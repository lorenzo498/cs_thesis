#
# Copyright (c) 2021 Nordic Semiconductor ASA
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
#

cmake_minimum_required(VERSION 3.20.0)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})

project(ecdsa)

target_sources(app PRIVATE
        src/main.c)
zephyr_library_sources(src/rlp_serializer.c)
zephyr_library_sources(src/rlp_serializer.h)
zephyr_library_sources(src/keccak256.c)
zephyr_library_sources(src/keccak256.h)
zephyr_library_sources(src/ecdsa.c)
zephyr_library_sources(src/ecdsa.h)

        cmake_minimum_required(VERSION 3.9)
project(RLP C)

set(CMAKE_C_STANDARD 99)

