# Install script for directory: /opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/opt/nordic/ncs/v1.9.1/toolchain/bin/arm-none-eabi-objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/lib/ext/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/lib/fih/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/tools/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/app/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/ns_log/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/secure_fw/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/interface/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/platform/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/outputs/EXTERNAL/NRF/MODULES/TFM/TFM/BOARDS/NRF9160/")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/outputs/EXTERNAL/NRF/MODULES/TFM/TFM/BOARDS/NRF9160" TYPE DIRECTORY FILES "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/bin/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/lib/s_veneers.o")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/lib" TYPE FILE FILES "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/secure_fw/s_veneers.o")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/client.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/error.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa" TYPE FILE FILES
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/client.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/error.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa_manifest/sid.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa_manifest" TYPE FILE FILES "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/generated/interface/include/psa_manifest/sid.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm_api.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm_ns_interface.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa_config.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include" TYPE FILE FILES
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_api.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_ns_interface.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa_config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm_ns_client_ext.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_ns_client_ext.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm/veneers/tfm_veneers.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm/veneers" TYPE FILE FILES "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/generated/interface/include/tfm_veneers.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/protected_storage.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/protected_storage.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm_ps_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_ps_defs.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/internal_trusted_storage.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/storage_common.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa" TYPE FILE FILES
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/internal_trusted_storage.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/storage_common.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm_its_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_its_defs.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/crypto_extra.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/crypto_compat.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/crypto.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/crypto_client_struct.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/crypto_sizes.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/crypto_struct.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/crypto_types.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/crypto_values.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa" TYPE FILE FILES
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_extra.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_compat.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_client_struct.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_sizes.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_struct.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_types.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/crypto_values.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm_crypto_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_crypto_defs.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa/initial_attestation.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa/initial_attestation.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm_attest_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_attest_defs.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa_audit_api.h;/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/psa_audit_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include" TYPE FILE FILES
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa_audit_api.h"
    "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/psa_audit_defs.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include/tfm_platform_api.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/include" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/include/tfm_platform_api.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src/tfm_ns_interface.c.example")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_ns_interface.c.example")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src/tfm_ps_func_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_ps_func_api.c")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src/tfm_its_func_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_its_func_api.c")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src/tfm_crypto_func_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_crypto_func_api.c")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src/tfm_initial_attestation_func_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_initial_attestation_func_api.c")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src/tfm_audit_func_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_audit_func_api.c")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src/tfm_platform_func_api.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/install/interface/src" TYPE FILE FILES "/opt/nordic/ncs/v1.9.1/modules/tee/tf-m/trusted-firmware-m/interface/src/tfm_platform_func_api.c")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/platform/ext/accelerator/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/lorenzobrancaleoni/Progetti/Progetto_ESP/nrf9160_device_main/main_project/build/tfm/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
