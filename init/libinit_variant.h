/*
 * Copyright (C) 2021-2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#pragma once

#include <string>
#include <vector>

typedef struct variant_info {
    std::string brand;
    std::string device;
    std::string model;
    std::string build_fingerprint;
} variant_info_t;

void set_variant_props(const variant_info_t variant);
