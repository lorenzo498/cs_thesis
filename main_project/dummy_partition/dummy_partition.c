/*
 * Copyright (c) 2021 Nordic Semiconductor ASA
 *
 * SPDX-License-Identifier: Apache-2.0
*/

#include "tfm_secure_api.h"


void secure_function(){
	// NRF_NVMC_S->CONFIG = 0x1;//NVMC_CONFIG_WEN_Wen << NVMC_CONFIG_WEN_Pos; 
	// while (NRF_NVMC_S->READY == NVMC_READY_READY_Busy){}
	// NRF_UICR_S->APPROTECT = 0x00;
	// // NRF_UICR->ERASEPROTECT.DISABLE = 0xaa;
	// NRF_NVMC_S->CONFIG = 0x0; //NVMC_CONFIG_WEN_Ren << NVMC_CONFIG_WEN_Pos; 
	// while (NRF_NVMC_S->READY == NVMC_READY_READY_Busy){}
}
