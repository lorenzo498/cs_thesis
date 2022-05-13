#include <string.h>
#include <zephyr.h>
#include <logging/log.h>
#include <nrf_modem_at.h>
#include <nrf_modem_gnss.h>
#include <modem/lte_lc.h>
#include <date_time.h>
#include "cJSON.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <drivers/flash.h>
#include <storage/flash_map.h>
#include <fs/nvs.h>


uint8_t cnt = 0;
struct nrf_modem_gnss_nmea_data_frame *nmea_data;

uint64_t fix_timestamp = 0;

uint8_t hour = 0;
uint8_t minute = 0;
uint8_t seconds = 0;

uint16_t year = 0;
uint8_t month = 0;
uint8_t day = 0;

double latitude = 0;
double longitude = 0;
int flag_gps = 0;
LOG_MODULE_REGISTER(gnss_sample, CONFIG_GNSS_SAMPLE_LOG_LEVEL);


static struct nrf_modem_gnss_pvt_data_frame last_pvt;

static const char update_indicator[] = {'\\', '|', '/', '-'};

static struct nrf_modem_gnss_pvt_data_frame last_pvt;

K_MSGQ_DEFINE(nmea_queue, sizeof(struct nrf_modem_gnss_nmea_data_frame *), 10, 4);
static K_SEM_DEFINE(pvt_data_sem, 0, 1);
static K_SEM_DEFINE(time_sem, 0, 1);

static struct k_poll_event events[2] = {
	K_POLL_EVENT_STATIC_INITIALIZER(K_POLL_TYPE_SEM_AVAILABLE,
					K_POLL_MODE_NOTIFY_ONLY,
					&pvt_data_sem, 0),
	K_POLL_EVENT_STATIC_INITIALIZER(K_POLL_TYPE_MSGQ_DATA_AVAILABLE,
					K_POLL_MODE_NOTIFY_ONLY,
					&nmea_queue, 0),
};


BUILD_ASSERT(IS_ENABLED(CONFIG_LTE_NETWORK_MODE_LTE_M_GPS) ||
	     IS_ENABLED(CONFIG_LTE_NETWORK_MODE_NBIOT_GPS) ||
	     IS_ENABLED(CONFIG_LTE_NETWORK_MODE_LTE_M_NBIOT_GPS),
	     "CONFIG_LTE_NETWORK_MODE_LTE_M_GPS, "
	     "CONFIG_LTE_NETWORK_MODE_NBIOT_GPS or "
	     "CONFIG_LTE_NETWORK_MODE_LTE_M_NBIOT_GPS must be enabled");



void nrf_modem_recoverable_error_handler(uint32_t error)
{
	LOG_ERR("Modem library recoverable error: %u", error);
}

void gnss_event_handler(int event)
{
	int retval;
	struct nrf_modem_gnss_nmea_data_frame *nmea_data;

	switch (event) {
	case NRF_MODEM_GNSS_EVT_PVT:

		retval = nrf_modem_gnss_read(&last_pvt, sizeof(last_pvt), NRF_MODEM_GNSS_DATA_PVT);
		if (retval == 0) {
			k_sem_give(&pvt_data_sem);
		}
		break;

	case NRF_MODEM_GNSS_EVT_NMEA:
		nmea_data = k_malloc(sizeof(struct nrf_modem_gnss_nmea_data_frame));
		if (nmea_data == NULL) {
			LOG_ERR("Failed to allocate memory for NMEA");
			break;
		}

		retval = nrf_modem_gnss_read(nmea_data,
					     sizeof(struct nrf_modem_gnss_nmea_data_frame),
					     NRF_MODEM_GNSS_DATA_NMEA);
		if (retval == 0) {
			retval = k_msgq_put(&nmea_queue, &nmea_data, K_NO_WAIT);
		}

		if (retval != 0) {
			
			k_free(nmea_data);
		}
		break;

	default:
		break;
	}
}



void date_time_evt_handler(const struct date_time_evt *evt)
{
	k_sem_give(&time_sem);
}

int modem_init(void)
{
	if (strlen(CONFIG_GNSS_SAMPLE_AT_MAGPIO) > 0) {
		if (nrf_modem_at_printf("%s", CONFIG_GNSS_SAMPLE_AT_MAGPIO) != 0) {
			LOG_ERR("Failed to set MAGPIO configuration");
			return -1;
		}
	}

	if (strlen(CONFIG_GNSS_SAMPLE_AT_COEX0) > 0) {
		if (nrf_modem_at_printf("%s", CONFIG_GNSS_SAMPLE_AT_COEX0) != 0) {
			LOG_ERR("Failed to set COEX0 configuration");
			return -1;
		}
	}

	if (lte_lc_init() != 0) {
		LOG_ERR("Failed to initialize LTE link controller");
		return -1;
	}

	if (IS_ENABLED(CONFIG_DATE_TIME)) {
		date_time_register_handler(date_time_evt_handler);
	}

#if defined(CONFIG_GNSS_SAMPLE_ASSISTANCE_NONE) || defined(CONFIG_GNSS_SAMPLE_LTE_ON_DEMAND)
#if defined(CONFIG_GNSS_SAMPLE_LTE_ON_DEMAND)
	lte_lc_register_handler(lte_lc_event_handler);
#endif /* CONFIG_GNSS_SAMPLE_LTE_ON_DEMAND */

	if (lte_lc_func_mode_set(LTE_LC_FUNC_MODE_ACTIVATE_GNSS) != 0) {
		LOG_ERR("Failed to enable GNSS");
		return -1;
	}
#else

#endif

	return 0;
}

int sample_init(void)
{
	int err = 0;



	return err;
}

int gnss_init_and_start(void)
{
	/* Configure GNSS */
	if (nrf_modem_gnss_event_handler_set(gnss_event_handler) != 0) {
		LOG_ERR("Failed to set GNSS event handler");
		return -1;
	}

	/* Enable all supported NMEA messages. */
	uint16_t nmea_mask = NRF_MODEM_GNSS_NMEA_RMC_MASK |
			     NRF_MODEM_GNSS_NMEA_GGA_MASK |
			     NRF_MODEM_GNSS_NMEA_GLL_MASK |
			     NRF_MODEM_GNSS_NMEA_GSA_MASK |
			     NRF_MODEM_GNSS_NMEA_GSV_MASK;

	if (nrf_modem_gnss_nmea_mask_set(nmea_mask) != 0) {
		LOG_ERR("Failed to set GNSS NMEA mask");
		return -1;
	}

	/* This use case flag should always be set. */
	uint8_t use_case = NRF_MODEM_GNSS_USE_CASE_MULTIPLE_HOT_START;

	if (IS_ENABLED(CONFIG_GNSS_SAMPLE_MODE_PERIODIC) &&
	    !IS_ENABLED(CONFIG_GNSS_SAMPLE_ASSISTANCE_NONE)) {
		/* Disable GNSS scheduled downloads when assistance is used. */
		use_case |= NRF_MODEM_GNSS_USE_CASE_SCHED_DOWNLOAD_DISABLE;
	}

	if (IS_ENABLED(CONFIG_GNSS_SAMPLE_LOW_ACCURACY)) {
		use_case |= NRF_MODEM_GNSS_USE_CASE_LOW_ACCURACY;
	}

	if (nrf_modem_gnss_use_case_set(use_case) != 0) {
		LOG_ERR("Failed to set GNSS use case");
		return -1;
	}

#if defined(CONFIG_GNSS_SAMPLE_MODE_CONTINUOUS)
	/* Default to no power saving. */
	uint8_t power_mode = NRF_MODEM_GNSS_PSM_DISABLED;

#if defined(GNSS_SAMPLE_POWER_SAVING_MODERATE)
	power_mode = NRF_MODEM_GNSS_PSM_DUTY_CYCLING_PERFORMANCE;
#elif defined(GNSS_SAMPLE_POWER_SAVING_HIGH)
	power_mode = NRF_MODEM_GNSS_PSM_DUTY_CYCLING_POWER;
#endif

	if (nrf_modem_gnss_power_mode_set(power_mode) != 0) {
		LOG_ERR("Failed to set GNSS power saving mode");
		return -1;
	}
#endif /* CONFIG_GNSS_SAMPLE_MODE_CONTINUOUS */

	/* Default to continuous tracking. */
	uint16_t fix_retry = 0;
	uint16_t fix_interval = 1;

// #if defined(CONFIG_GNSS_SAMPLE_MODE_PERIODIC)
	fix_retry = CONFIG_GNSS_SAMPLE_PERIODIC_TIMEOUT;//Intervallo di tempo in cui il gps va in timeout e non richiede nuovamente la posizione(dopo il primo ottenimento di una posizione)
	fix_interval = CONFIG_GNSS_SAMPLE_PERIODIC_INTERVAL;//Intervallo di tempo in cui il gps richiede la posizione e poi va in timeout(dopo il primo ottenimento di una posizione)
// #endif

	if (nrf_modem_gnss_fix_retry_set(fix_retry) != 0) {
		LOG_ERR("Failed to set GNSS fix retry");
		return -1;
	}

	if (nrf_modem_gnss_fix_interval_set(fix_interval) != 0) {
		LOG_ERR("Failed to set GNSS fix interval");
		return -1;
	}

	if (nrf_modem_gnss_start() != 0) {
		LOG_ERR("Failed to start GNSS");
		return -1;
	}

	return 0;
}

bool output_paused(void)
{
#if defined(CONFIG_GNSS_SAMPLE_ASSISTANCE_NONE) || !defined(CONFIG_GNSS_SAMPLE_LOG_LEVEL_INF)
	return false;
#else

#endif
}

void print_satellite_stats(struct nrf_modem_gnss_pvt_data_frame *pvt_data)
{
	uint8_t tracked   = 0;
	uint8_t in_fix    = 0;
	uint8_t unhealthy = 0;

	for (int i = 0; i < NRF_MODEM_GNSS_MAX_SATELLITES; ++i) {
		if (pvt_data->sv[i].sv > 0) {
			tracked++;

			if (pvt_data->sv[i].flags & NRF_MODEM_GNSS_SV_FLAG_USED_IN_FIX) {
				in_fix++;
			}

			if (pvt_data->sv[i].flags & NRF_MODEM_GNSS_SV_FLAG_UNHEALTHY) {
				unhealthy++;
			}
		}
	}

	printk("Tracking: %2d Using: %2d Unhealthy: %d\n", tracked, in_fix, unhealthy);
}

int set_gps_data(struct nrf_modem_gnss_pvt_data_frame *pvt_data)
{
	// printk("Latitude:       %.06f\n", pvt_data->latitude);
	// printk("Longitude:      %.06f\n", pvt_data->longitude);
	// printk("Altitude:       %.01f m\n", pvt_data->altitude);
	// printk("Accuracy:       %.01f m\n", pvt_data->accuracy);
	// printk("Speed:          %.01f m/s\n", pvt_data->speed);
	// printk("Speed accuracy: %.01f m/s\n", pvt_data->speed_accuracy);
	// printk("Heading:        %.01f deg\n", pvt_data->heading);
	// printk("Date:           %04u-%02u-%02u\n",
	//        pvt_data->datetime.year,
	//        pvt_data->datetime.month,
	//        pvt_data->datetime.day);
	// printk("Time (UTC):     %02u:%02u:%02u.%03u\n",
	//        pvt_data->datetime.hour,
	//        pvt_data->datetime.minute,
	//        pvt_data->datetime.seconds,
	//        pvt_data->datetime.ms);
	// printk("PDOP:           %.01f\n", pvt_data->pdop);
	// printk("HDOP:           %.01f\n", pvt_data->hdop);
	// printk("VDOP:           %.01f\n", pvt_data->vdop);
	// printk("TDOP:           %.01f\n", pvt_data->tdop);
			/* capture initial time stamp */

	if (pvt_data->datetime.hour == hour && pvt_data->datetime.minute == minute && pvt_data->datetime.seconds == seconds){
		events[0].state = K_POLL_STATE_NOT_READY;
		events[1].state = K_POLL_STATE_NOT_READY;
		return 0;
	}
	latitude = pvt_data->latitude;
	longitude = pvt_data->longitude;

	hour = pvt_data->datetime.hour;
	minute = pvt_data->datetime.minute;
	seconds = pvt_data->datetime.seconds;

	year = pvt_data->datetime.year;
	month = pvt_data->datetime.month;
	day = pvt_data->datetime.day;
	return 1;
}

int init_gps(void){


	LOG_INF("Starting GNSS sample");

	if (modem_init() != 0) {
		LOG_ERR("Failed to initialize modem");
		return -1;
	}

	if (sample_init() != 0) {
		LOG_ERR("Failed to initialize sample");
		return -1;
	}

	if (gnss_init_and_start() != 0) {
		LOG_ERR("Failed to initialize and start GNSS");
		return -1;
	}

	fix_timestamp = k_uptime_get();
}

int search(void)
{
		(void)k_poll(events, 2, K_FOREVER);
		// && k_sem_take(events[0].sem, K_NO_WAIT) == 0
		
		if (events[0].state == K_POLL_STATE_SEM_AVAILABLE )
		    {
			/* New PVT data available */

			if (!IS_ENABLED(CONFIG_GNSS_SAMPLE_NMEA_ONLY) &&
			    !output_paused()) {
				// printk("\033[1;1H");
				// printk("\033[2J");
				// print_satellite_stats(&last_pvt);

				if (last_pvt.flags & NRF_MODEM_GNSS_PVT_FLAG_DEADLINE_MISSED) {
					printk("GNSS operation blocked by LTE\n");
				}
				if (last_pvt.flags &
				    NRF_MODEM_GNSS_PVT_FLAG_NOT_ENOUGH_WINDOW_TIME) {
					printk("Insufficient GNSS time windows\n");
				}
				if (last_pvt.flags & NRF_MODEM_GNSS_PVT_FLAG_SLEEP_BETWEEN_PVT) {
					printk("Sleep period(s) between PVT notifications\n");
				}

				if (last_pvt.flags & NRF_MODEM_GNSS_PVT_FLAG_FIX_VALID) {
					fix_timestamp = k_uptime_get();
					flag_gps = set_gps_data(&last_pvt);
				} else {
					flag_gps = 0;
					printk("-----------------------------------\n");
					printk("Seconds since last fix: %lld\n",
					       (k_uptime_get() - fix_timestamp) / 1000);
					cnt++;
					printk("Searching [%c]\n", update_indicator[cnt%4]);
				}

				// printk("\nNMEA strings:\n\n");
			}
		}
		if (events[1].state == K_POLL_STATE_MSGQ_DATA_AVAILABLE &&
		    k_msgq_get(events[1].msgq, &nmea_data, K_NO_WAIT) == 0) {
			/* New NMEA data available */

			if (!output_paused()) {
				// printk("%s", nmea_data->nmea_str);
			}
			k_free(nmea_data);
		}

		events[0].state = K_POLL_STATE_NOT_READY;
		events[1].state = K_POLL_STATE_NOT_READY;
		return flag_gps;

}


