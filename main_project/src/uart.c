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

#define BUF_SIZE 10


typedef uint8_t u8;
typedef uint32_t u32;
uint32_t u32Idx;
uint32_t previous_qr_code_time;
uint32_t current_qr_code_time;
uint32_t current_time;

static K_MEM_SLAB_DEFINE(uart_slab, BUF_SIZE, 3, 4);

static struct nvs_fs fs;
int nCharToRemove;
char oldQrCode[1000] = "";
char finalQrCode[1000] = "";

void uart_callback(const struct device *dev,struct uart_event *evt, void *user_data){
	struct device *uart = user_data;
	int err;
	switch (evt->type) {
	case UART_TX_DONE:
	break;

	case UART_TX_ABORTED:
		// LOG_ERR("Tx aborted");
	break;

	case UART_RX_RDY:
		current_qr_code_time = k_uptime_get();
		current_time = k_cycle_get_32()/32768;

		if ((current_qr_code_time - previous_qr_code_time) > 300){
			memset(finalQrCode, 0, strlen(finalQrCode));
		}
    	for(u32 i = 0; i < evt->data.rx.len; i++){
    		strncat(finalQrCode, &evt->data.rx.buf[evt->data.rx.offset + i], 1);
      	}
		printk("%s\n", finalQrCode);
			/* capture final time stamp */

		previous_qr_code_time = k_uptime_get();

		printk("Time in ms: %d\n", current_qr_code_time);

	break;

	case UART_RX_BUF_REQUEST:{
		uint8_t *buf;

		err = k_mem_slab_alloc(&uart_slab, (void **)&buf, K_NO_WAIT);
		__ASSERT(err == 0, "Failed to allocate slab");

		err = uart_rx_buf_rsp(uart, buf, BUF_SIZE);
		__ASSERT(err == 0, "Failed to provide new buffer");
	break;

	}

	case UART_RX_BUF_RELEASED:
		k_mem_slab_free(&uart_slab, (void **)&evt->data.rx_buf.buf);
		break;

	case UART_RX_DISABLED:
		printk("DISABLED");

		break;

	case UART_RX_STOPPED:
		printk("STOPPED");

		break;
	}
}

void async(const struct device *lpuart){
	uint8_t txbuf[5] = {1, 2, 3, 4, 5};
	int err;
	uint8_t *buf;
	err = k_mem_slab_alloc(&uart_slab, (void **)&buf, K_NO_WAIT);
	__ASSERT(err == 0, "Failed to alloc slab");

	err = uart_callback_set(lpuart, uart_callback, (void *)lpuart);
	__ASSERT(err == 0, "Failed to set callback");

	err = uart_rx_enable(lpuart, buf, BUF_SIZE, 10000);
	__ASSERT(err == 0, "Failed to enable RX");
	
	// while (1) {


	// 	k_sleep(K_MSEC(500));
	// 	transmit();
	// }
}






