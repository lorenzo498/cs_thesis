# Install script for directory: C:/ncs/v1.9.0/zephyr

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/Zephyr-Kernel")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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
  set(CMAKE_OBJDUMP "C:/ncs/v1.9.0/toolchain/opt/bin/arm-none-eabi-objdump.exe")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/arch/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/lib/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/soc/arm/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/boards/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/subsys/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/drivers/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/nrf/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/mcuboot/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/mbedtls/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/trusted-firmware-m/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/cjson/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/cddl-gen/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/memfault-firmware-sdk/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/openthread/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/CANopenNode/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/civetweb/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/cmsis/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/fatfs/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/hal_nordic/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/st/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/libmetal/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/littlefs/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/loramac-node/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/lvgl/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/lz4/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/mipi-sys-t/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/nanopb/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/nrf_hw_models/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/open-amp/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/segger/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/tinycbor/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/tinycrypt/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/TraceRecorder/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/zscilib/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/nrfxlib/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/modules/connectedhomeip/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/kernel/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/cmake/flash/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/cmake/usage/cmake_install.cmake")
  include("C:/Users/Gioele/Desktop/Tesi/cs_thesis/RLP/build/zephyr/cmake/reports/cmake_install.cmake")

endif()

