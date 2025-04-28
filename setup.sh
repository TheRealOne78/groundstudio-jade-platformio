#!/usr/bin/env sh

## Copyright_notice ####################################################
#                                                                      #
# SPDX-License-Identifier: GPL-3.0-or-later                            #
#                                                                      #
# Copyright (C) 2025 TheRealOne78 <bajcsielias78@gmail.com>            #
#                                                                      #
# This is free software: you can redistribute it and/or modify         #
# it under the terms of the GNU General Public License as published by #
# the Free Software Foundation, either version 3 of the License, or    #
# (at your option) any later version.                                  #
#                                                                      #
# This software is distributed in the hope that it will be useful,     #
# but WITHOUT ANY WARRANTY; without even the implied warranty of       #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        #
# GNU General Public License for more details.                         #
#                                                                      #
# You should have received a copy of the GNU General Public License    #
# along with this software.  If not, see                               #
# <https://www.gnu.org/licenses/>.                                     #
#                                                                      #
########################################################################

# CONFIG CONSTANTS
BOARDS_PATH="${HOME}/.platformio/platforms/atmelavr/boards/"
VARIANTS_PATH="${HOME}/.platformio/packages/framework-arduino-avr/variants/"
BOOTLOADERS_PATH="${HOME}/.platformio/packages/framework-arduino-avr/bootloaders/"
CATERINA_NAME="caterina-jade"

# Colors
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[34m"

# Misc
ENDCOLOR="\033[0m" # Reset color and formatting

# Sequences [colored]
INFO="[${BLUE}I${ENDCOLOR}]"
WARN="[${YELLOW}W${ENDCOLOR}]"
ERR="[${RED}E${ENDCOLOR}]"

log_info() {
    message="$1"
    timestamp="$(date +'%Y-%m-%d %H:%M:%S')"
    printf "%b %b: %b\n" "${INFO}" "${timestamp}" "${message}"
}

log_warn() {
    message="$1"
    timestamp="$(date +'%Y-%m-%d %H:%M:%S')"
    printf "%b %b: %b\n" "${WARN}" "${timestamp}" "${message}"
}

log_err() {
    message="$1"
    timestamp="$(date +'%Y-%m-%d %H:%M:%S')"
    printf "%b %b: %b\n" "${ERR}" "${timestamp}" "${message}" >&2
}

log_err_exec() {
    log_err "Something went wrong" && exit 1
}

# Make sure that PlatformIO exists and it's executable
if [ ! -x "$(command -v pio)" ] && [ ! -x "$(command -v platformio)" ]; then
        log_err "PlatformIO cannot be found, please make sure that it is installed on this system."
        exit 1
fi

# Check if paths exist, else init a new tmp project to install deps
if [ ! -d "${BOARDS_PATH}" ] || [ ! -d "${VARIANTS_PATH}" ] || [ ! -d "${CATERINA_PATH}" ]; then
    log_info "Couldn't find the necessary directories, initializing a temporary PlatformIO project to install the necessary packages ..."
    pwddir=$(pwd)
    tmpdir=$(mktemp -d)
    cd "$tmpdir" || log_err_exec

    if [ ! -x "$(command -v pio)" ]; then
        platformio project init --board uno
    else
        pio project init --board uno
    fi

    cd "$pwddir" || log_err_exec
    rm -rf tmpdir
fi

log_info "Copying boards ..."
cp ./boards/* "${BOARDS_PATH}"

log_info "Copying variants ..."
cp -r ./Jade/variants/* "${VARIANTS_PATH}"

log_info "Copying the Caterina bootloader for Jade Pro Micro ..."
cp -r ./Jade/bootloaders/caterina/ "${BOOTLOADERS_PATH}${CATERINA_NAME}"

log_warn "Warning! The GroundStudio Jade Pro Micro profile is still untested! Proceed at your own risk."
log_info "Done.  Check <https://github.com/TheRealOne78/groundstudio-jade-platformio> for troubleshooting."
