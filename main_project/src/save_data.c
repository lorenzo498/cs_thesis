#include <zephyr.h>
#include <string.h>
#include <sys/printk.h>
#include <psa/storage_common.h>
#include <psa/protected_storage.h>

struct psa_storage_info_t uid1_info;
char stored_data[1000];

void getInfo(void)
{
    psa_status_t status = 0;
	psa_storage_uid_t uid1 = 1;
	printk("Protected Storage sample started.\n");
	printk("PSA Protected Storage API Version %d.%d\n",
			PSA_PS_API_VERSION_MAJOR, PSA_PS_API_VERSION_MINOR);

	/* Get info on UID1 */

	status = psa_ps_get_info(uid1, &uid1_info);
	if (status != PSA_SUCCESS){
		printk("Failed to get info! (%d)\n", status);
		return;
	}
	printk("Info on data stored in UID1:\n");
	printk("- Size: %d\n", uid1_info.size);
	printk("- Capacity: 0x%2x\n", uid1_info.capacity);
	printk("- Flags: 0x%2x\n", uid1_info.flags);

	// printk("Removing UID1\n");
	// status = psa_ps_remove(uid1);
	// if (status != PSA_SUCCESS) {
	// 	printk("Failed to remove UID1! (%d)\n", status);
	// 	return;
	// }
}


int save_data(char *data_to_save){
    psa_status_t status = 0;

	printk("Writing data to UID1: %s\n", data_to_save);
	psa_storage_uid_t uid1 = 1;
	psa_storage_create_flags_t uid1_flag = PSA_STORAGE_FLAG_NO_CONFIDENTIALITY;

	status = psa_ps_set(uid1, sizeof(data_to_save), &data_to_save, uid1_flag);
	if (status != PSA_SUCCESS){
		printk("Failed to store data! (%d)\n", status);
		return 0;
	}
    return 1;
}

int get_saved_data(){
    //DA VEDERE PERCHé non prende i dati salvati!!!
    printk("Read and compare data stored in UID1\n");
	size_t bytes_read;
    psa_status_t status = 0;
	psa_storage_uid_t uid1 = 1;
	status = psa_ps_get(uid1, 0, 1000, &stored_data, &bytes_read);
	if (status != PSA_SUCCESS) {
		printk("Failed to get data stored in UID1! (%d)\n", status);
		return 0;
	}
	printk("Data stored in UID1: %s\n", stored_data);
    return 1;
}