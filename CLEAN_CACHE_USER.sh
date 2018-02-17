#!/bin/bash

source CLEAN_CACHE_SYSTEM.sh

echo -e "\e[33m"

# -------------------------------------------------------------------

# Cache
#remove_folder_within_subfolder /sdcard/Android/data 2 cache
#remove_file_within_subfolder /sdcard/Android/data 2 .cache
#remove_folder_within_folder /sdcard Download
#remove_folder_within_folder /sdcard/Android/data cache
#remove_type_within_folder /sdcard/Android/data mpe

#remove_folder_within_subfolder /home/pedro/Desktop/teste 2 cache .cache
#remove_file_within_subfolder /home/pedro/Desktop/teste 2 .cache
#remove_file_within_folder "/home/pedro/Desktop/teste/Ola a todos" cache
#remove_folder_within_folder "/home/pedro/Desktop/teste/Ola a todos" cache
#remove_type_within_folder "/home/pedro/Desktop/teste" mpe

# DCIM
#remove /sdcard/DCIM/.thumbnails
#remove_within_folder /home/pedro/Desktop/teste onfwefuion "Ola a todos" dsfsdfsfsd.mpe

# Tap Tap Reborn 2
#remove_type /sdcard/Android/data/com.amanotes.reborn/files png

# Recycle Bin
#remove /sdcard/.estrongs/recycle

# Empty files and folders
#remove_empty_files_folders /sdcard -2
remove_empty_files_folders /home/pedro/Desktop/teste -1 /home/pedro/Desktop/teste/ada

# -------------------------------------------------------------------

echo -e "\e[0m"