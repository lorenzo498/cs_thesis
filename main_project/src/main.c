/*
 * Copyright (c) 2020 Nordic Semiconductor ASA
 *
 * SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
 */

#include "gps_function.h"

uint32_t start_time;
uint32_t cycles_spent;
cJSON *root, *dataToSent, *data;

void main(void)
{
	const struct device *lpuart;
	createJson();
	k_msleep(1000);
	
	lpuart = device_get_binding("UART_1");
	__ASSERT(lpuart, "Failed to get the device");
	//START READING QR CODE
	async(lpuart);
	
	//START READING LOCATION FROM GPS
	init_gps();
	start_gps();
	

 
}



void start_gps(void)
{
	// cycles_spent = stop_time - start_time;

	int found_gps = 0;
	for (;;) {
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


void createJson() {
   char *out;
   /* create root node and array */
   root = cJSON_CreateObject();
   dataToSent = cJSON_CreateArray();

   /* add array to root */
   cJSON_AddItemToObject(root, "dataToSent", dataToSent);

   /* print everything */
   out = cJSON_Print(root);
   printk("%s\n", out);
}

void transmit(void) {
	
	// printk("QRCODE %s\n", qrCodeToSend);
	// printk("OLD QRCODE %s\n", oldQrCode);
	printk("loading data...\n");
    // if (latitude == 0 || longitude == 0){
    //     return;
    // }
	if(isStringEmpty(finalQrCode) == 0 || strcmp(oldQrCode, finalQrCode) == 0){
		return;
	}
	char *out;
	char latitude_string[10] = ""; 
	char longitude_string[10] = "";


    // double a = 0.0000005l;
    // char aa[50];
    // sprintf(latitude_string, "%.06f", latitude);
    // printk("%s prova \n", latitude_string);

	double_to_string(latitude, latitude_string);
	double_to_string(longitude, longitude_string);

    printk("latitude string %s\n", latitude_string);

    // printf("latitude %.06f\n", latitude);
	printk("Latitude from main: %.06f\n", latitude);

	/* add data to array */
	cJSON_AddItemToArray(dataToSent, data = cJSON_CreateObject());
	cJSON_AddItemToObject(data, "qrCode", cJSON_CreateString(finalQrCode));
	cJSON_AddItemToObject(data, "latitude", cJSON_CreateString(latitude_string));
	cJSON_AddItemToObject(data, "longitude", cJSON_CreateString(longitude_string));


	/* print everything */
	out = cJSON_Print(root);
	printk("%s\n", out);

	memset(oldQrCode, 0, sizeof oldQrCode);

	strcpy(oldQrCode, finalQrCode);
	memset(finalQrCode, 0, sizeof finalQrCode);

    latitude = 0;
    longitude = 0;
	// free(out);
	// printk("eeee");

	// /* free all objects under root and root itself */
	// cJSON_Delete(root);

}

int isStringEmpty(char *str){
    if (strlen(str) == 0)
    {
        return 0;
    }
    return 1;
}



int n_tu(int number, int count)
{
    int result = 1;
    while(count-- > 0)
        result *= number;

    return result;
}

/*** Convert float to string ***/
void double_to_string(double f, char r[])
{
    long long int length, length2, i, number, position, sign;
    double number2;

    sign = -1;   // -1 == positive number
    if (f < 0)
    {
        sign = '-';
        f *= -1;
    }

    number2 = f;
    number = f;
    length = 0;  // Size of decimal part
    length2 = 0; // Size of tenth

    /* Calculate length2 tenth part */
    while( (number2 - (double)number) != 0.0 && !((number2 - (double)number) < 0.0) )
    {
         number2 = f * (n_tu(10.0, length2 + 1));
         number = number2;

         length2++;
    }

    /* Calculate length decimal part */
    for (length = (f > 1) ? 0 : 1; f > 1; length++)
        f /= 10;

    position = length;
    length = length + 1 + length2;
    number = number2;
    if (sign == '-')
    {
        length++;
        position++;
    }

    for (i = length; i >= 0 ; i--)
    {
        if (i == (length))
            r[i] = '\0';
        else if(i == (position))
            r[i] = '.';
        else if(sign == '-' && i == 0)
            r[i] = '-';
        else
        {
            r[i] = (number % 10) + '0';
            number /=10;
        }
    }
}