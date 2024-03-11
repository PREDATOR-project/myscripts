#!/usr/bin/env bash
#
# Copyright (C) 2019 nysascape
#
# Licensed under the Raphielscape Public License, Version 1.d (the "License");
# you may not use this file except in compliance with the License.
#
# Probably the 3rd bad apple coming
# Enviroment variables

# Export KERNELDIR as en environment-wide thingy
# We start in scripts, so like, don't clone things
KERNELDIR="$(pwd)"
SCRIPTS=${KERNELDIR}/kernelscripts
OUTDIR=${KERNELDIR}/out
COMPILER_TYPES=clang

# Pick your poison
if [[ "${COMPILER_TYPES}" =~ "clang" ]]; then
        git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 -b main --depth=1  "${KERNELDIR}/clang"
	git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 -b lineage-19.1 --depth=1 "${KERNELDIR}/gcc"
        git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9 -b lineage-19.1 --depth=1 "${KERNELDIR}/gcc32"
	COMPILER_STRING='google clang 17.0.4 & gcc4.9'
        COMPILER_TYPE='google clang 17.0.4 & gcc4.9'
else
        # Default to GCC from Arter
        git clone https://github.com/mvaisakh/gcc-arm64 -b gcc-master --depth=1 "${KERNELDIR}/gcc"
        git clone https://github.com/kdrag0n/arm-eabi-gcc --depth=1 "${KERNELDIR}/gcc32"
        COMPILER_STRING='GCC'
	COMPILER_TYPE='GCC'
fi    

export COMPILER_STRING COMPILER_TYPE KERNELDIR SCRIPTS OUTDIR

git clone https://github.com/fabianonline/telegram.sh/ telegram

# Export Telegram.sh
TELEGRAM=${KERNELDIR}/telegram/telegram

export TELEGRAM JOBS
