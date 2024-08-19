#!/usr/bin/env bash

# This script add font to your environment

# Load helpers function
source $(dirname "$0")/helpers.sh

# Input variables
FONT_NAME=$1
FONT_FILE=$(dirname "$0")/fonts/${FONT_NAME}/*

# Determine the operating system
