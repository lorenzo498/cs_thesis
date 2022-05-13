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
#include <drivers/uart.h>

#include <sys/printk.h>
#include <psa/crypto.h>
#include <psa/crypto_extra.h>

#include <psa/storage_common.h>
#include <psa/protected_storage.h>

#ifdef CONFIG_BUILD_WITH_TFM
#include <tfm_ns_interface.h>
#endif



extern uint32_t start_time;
extern uint32_t current_time_for_gps_comparison;
extern uint8_t hour;
extern uint8_t minute;
extern uint8_t seconds;
extern uint16_t year;
extern uint8_t month;
extern uint8_t day;
extern double latitude;
extern double longitude;
extern char oldQrCode[1000];
extern char finalQrCode[1000];

extern struct psa_storage_info_t uid1_info;
extern char stored_data[1000];

int init_gps(void);
int search(void);
bool output_paused(void);
void print_satellite_stats(struct nrf_modem_gnss_pvt_data_frame *pvt_data);
void print_fix_data(struct nrf_modem_gnss_pvt_data_frame *pvt_data);

void async(const struct device *lpuart);

void uart_callback(const struct device *dev,struct uart_event *evt, void *user_data);
int get_saved_data(void);
int save_data(char *data_to_save);

#define APP_SUCCESS		(0)
#define APP_ERROR		(-1)
#define APP_SUCCESS_MESSAGE "Example finished successfully!"
#define APP_ERROR_MESSAGE "Example exited with error!"

#define PRINT_HEX(p_label, p_text, len)\
	({\
		LOG_INF("---- %s (len: %u): ----", p_label, len);\
		LOG_HEXDUMP_INF(p_text, len, "Content:");\
		LOG_INF("---- %s end  ----", p_label);\
	})

LOG_MODULE_REGISTER(ecdsa, LOG_LEVEL_DBG);

/* ====================================================================== */
/*				Global variables/defines for the ECDSA example			  */

#define NRF_CRYPTO_EXAMPLE_ECDSA_TEXT_SIZE (100)

#define NRF_CRYPTO_EXAMPLE_ECDSA_PUBLIC_KEY_SIZE (65)
#define NRF_CRYPTO_EXAMPLE_ECDSA_SIGNATURE_SIZE (64)
#define NRF_CRYPTO_EXAMPLE_ECDSA_HASH_SIZE (32)

/* Below text is used as plaintext for signing/verification */
static uint8_t m_plain_text[NRF_CRYPTO_EXAMPLE_ECDSA_TEXT_SIZE] = {
	"Example string to demonstrate basic usage of ECDSA."
};

static uint8_t m_pub_key[NRF_CRYPTO_EXAMPLE_ECDSA_PUBLIC_KEY_SIZE];

static uint8_t m_signature[NRF_CRYPTO_EXAMPLE_ECDSA_SIGNATURE_SIZE];
static uint8_t m_hash[NRF_CRYPTO_EXAMPLE_ECDSA_HASH_SIZE];

static psa_key_handle_t keypair_handle;
static psa_key_handle_t pub_key_handle;