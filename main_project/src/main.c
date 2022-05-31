/*
 * Copyright (c) 2020 Nordic Semiconductor ASA
 *
 * SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
 */
#include "gps_uart.h"

uint32_t start_time;
uint32_t cycles_spent;
cJSON *root, *dataToSent, *data;

void createJson(){
   	char *out;
	/* create root node and array */
	root = cJSON_CreateObject();

	if (get_saved_data() == 1){
		root = cJSON_Parse(stored_data);
    	dataToSent = cJSON_GetObjectItemCaseSensitive(root, "data");
		// cJSON_ArrayForEach(data, dataToSent)
		// {
		// 	cJSON *qrCode = cJSON_GetObjectItemCaseSensitive(data, "qr");
		// 	printk("qrCode: %s\n", qrCode->valuestring);
		// }

	}else{
		dataToSent = cJSON_CreateArray();
		/* add array to root */
		cJSON_AddItemToObject(root, "data", dataToSent);
	}	
	/* print everything */
	out = cJSON_Print(root);
	printk("data saved: \n%s\n", out);
}


void main(void)
{
	
	const struct device *lpuart;
	createJson();
	k_msleep(1000);

	lpuart = device_get_binding("UART_2");
	__ASSERT(lpuart, "Failed to get the device");
	//START READING QR CODE
	async(lpuart);
	
	//START READING LOCATION FROM GPS
	init_gps();
	start_gps();
}


void start_gps(void)
{
    latitude = 0;
    longitude = 0;
	int found_gps = 0;
	while(1) {
		found_gps = search();
		if (found_gps == 1){
			start_time = k_cycle_get_32()/32768;
			printk("Latitude from main: %.06f\n", latitude);
			printk("Longitude from main: %.06f\n", longitude);
			printk("Date from main: %04u-%02u-%02u\n", year, month, day);
			printk("Time from main (UTC): %02u:%02u:%02u\n", hour, minute, seconds);
		}else{
			
		}
		transmit();
		k_msleep(1000);
	}
}


// void disable_uart(){
//     NRF_UARTE0->TASKS_STOPTX = 1;
//     NRF_UARTE0->TASKS_STOPRX = 1;

//     NRF_UARTE3->TASKS_STOPTX = 1;
//     NRF_UARTE3->TASKS_STOPRX = 1;
// }

// void enable_uart(){
//     NRF_UARTE0->TASKS_STARTRX = 1;
//     NRF_UARTE3->TASKS_STARTRX = 1;
// }

void transmit(void) {
	
	// printk("QRCODE %s\n", qrCodeToSend);
	// printk("OLD QRCODE %s\n", oldQrCode);
    // if (latitude == 0 || longitude == 0){
    //     return;
    // }
	if(isStringEmpty(finalQrCode) == 0 || strcmp(oldQrCode, finalQrCode) == 0){
		return;
	}

    convert_time();
	char *out;
	char latitude_string[50];
	char longitude_string[50];
    
	char hour_string[3];
	char minute_string[3];
	char seconds_string[3];

    char year_string[5];
	char month_string[3];
	char day_string[3];

	char time[11];
	char date[15];


    snprintf(latitude_string, 50, "%f", latitude);
    snprintf(longitude_string, 50, "%f", longitude);

    snprintf(hour_string, 3, "%d", hour);
    snprintf(minute_string, 3, "%d", minute);
    snprintf(seconds_string, 3, "%d", seconds);

    snprintf(year_string, 5, "%d", year);
    snprintf(month_string, 3, "%d", month);
    snprintf(day_string, 3, "%d", day);
    
    strcat(time, hour_string);
    strcat(time, ":");
    strcat(time, minute_string);
    strcat(time, ":");
    strcat(time, seconds_string);

    strcat(date, day_string);
    strcat(date, "/");
    strcat(date, month_string);
    strcat(date, "/");
    strcat(date, year_string);

    printk("date: %s\n", date);
	printk("time: %s\n", time);

	/* add data to array */
	data = cJSON_CreateObject();
	cJSON_AddItemToObject(data, "qr", cJSON_CreateString(finalQrCode));
	cJSON_AddItemToObject(data, "latitude", cJSON_CreateString(latitude_string));
	cJSON_AddItemToObject(data, "longitude", cJSON_CreateString(longitude_string));
    cJSON_AddItemToObject(data, "date", cJSON_CreateString(date));
	cJSON_AddItemToObject(data, "time", cJSON_CreateString(time));
	cJSON_AddItemToArray(dataToSent, data);

	/* save everything */
	out = cJSON_Print(root);
	save_data(out);

	strcpy(oldQrCode, finalQrCode);
	memset(finalQrCode, 0, sizeof finalQrCode);
	memset(date, 0, sizeof date);
	memset(time, 0, sizeof time);

	// free(out);
	// printk("eeee");
	// /* free all objects under root and root itself */
	// cJSON_Delete(root);
}

//aggiorno l'orario preso dal gps per ottenere l'orario della scansione del qrcode
void convert_time(){
	if (current_time_for_gps_comparison <= start_time)
	{
		return;
	}
    cycles_spent = current_time_for_gps_comparison - start_time;
    printk("Seconds to add to last time: %d\n", cycles_spent);

    int x = hour * 3600 + minute * 60 + seconds; 
    int y = cycles_spent;
    int z = x + y;

    int newHour = z/3600;
    int newMinute = (z % 3600)/60;
    int newSeconds = (z % 3600)%60;

	hour = newHour;
	minute = newMinute;
	seconds = newSeconds;
	//TODO Fare controlli se orario > 00:00 e se data sfora con giorni mesi anni
}

int isStringEmpty(char *str){
    if (strlen(str) == 0)
    {
        return 0;
    }
    return 1;
}