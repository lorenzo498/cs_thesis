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




extern uint32_t start_time;
extern uint32_t current_time;
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

int init_gps(void);
int search(void);
bool output_paused(void);
void print_satellite_stats(struct nrf_modem_gnss_pvt_data_frame *pvt_data);
void print_fix_data(struct nrf_modem_gnss_pvt_data_frame *pvt_data);

void async(const struct device *lpuart);

void uart_callback(const struct device *dev,struct uart_event *evt, void *user_data);