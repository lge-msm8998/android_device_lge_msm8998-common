/*
    Copyright (C) 2007, The Android Open Source Project
    Copyright (c) 2016, The CyanogenMod Project
    Copyright (c) 2017-2024, The LineageOS Project

    SPDX-License-Identifier: BSD-3-Clause
 */

#include <android-base/logging.h>
#include <android-base/properties.h>

#include "vendor_init.h"

#include "libinit_utils.h"
#include "libinit_variant.h"

using android::base::GetProperty;

#define PROPERTY_LGE_MODEL "ro.boot.product.model"

static variant_info_t phoenix_lgu_kr_info = {
    .brand = "lge",
    .device = "phoenix_sprout",
    .build_fingerprint = "lge/phoenix_lgu_kr/phoenix_sprout:11/RKQ1.201123.002/22005163197a5:user/release-keys",
};

static variant_info_t phoenix_lao_com_info = {
    .brand = "lge",
    .device = "phoenix_sprout",
    .build_fingerprint = "lge/phoenix_lgu_kr/phoenix_sprout:11/RKQ1.201123.002/22005163197a5:user/release-keys",
};

void init_target_properties()
{
    std::string model;
    variant_info_t variant;

    model = GetProperty(PROPERTY_LGE_MODEL, "UNKNOWN");
    // TODO: Add support for X5
    if(model == "LM-Q927")
        variant = phoenix_lgu_kr_info;
    else
        variant = phoenix_lao_com_info;

    variant.model = model;
    set_variant_props(variant);
}

void vendor_load_properties() {
    LOG(INFO) << "Loading vendor specific properties";
    init_target_properties();
}
