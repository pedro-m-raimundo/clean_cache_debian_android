#!/bin/bash

source CLEAN_CACHE_SYSTEM.sh

echo -e "\e[33m"

# -------------------------------------------------------------------

# Cache
remove_folder /sdcard/Android/data cache

# DCIM
remove /sdcard/DCIM/.thumbnails

# Tap Tap Reborn 2
remove_type /sdcard/Android/data/com.amanotes.reborn/files png

# Recycle Bin
remove /sdcard/.estrongs/recycle

# Empty files and folders
remove_empty_files_folders /sdcard

# -------------------------------------------------------------------

echo -e "\e[0m"