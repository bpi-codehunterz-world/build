#!/bin/bash
# build_armbian.sh

read -p "RELEASE > " release
./compile.sh BOARD="bananapim2ultra" BRANCH="current" RELEASE=$release BUILD_MINIMAL="no" BUILD_DESKTOP="no" KERNEL="yes" KERNEL_CONFIGURE="no"
