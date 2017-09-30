#!/bin/bash

source CLEAN_CACHE_SYSTEM.sh

# -------------------------------------------------------------------
echo -e "\e[33m"

# Cache (and similar)
remove_folder /sdcard/Android/data cache spotifycache .cache albumthumbs
remove_folder /sdcard fb_temp
remove /sdcard/data/system/extra/cache /sdcard/__chartboost 

# DCIM
remove /sdcard/DCIM/.thumbnails

# Diaxin
remove /sdcard/dianxin /sdcard/dianxinos

# Google
remove /sdcard/.cloudagent

# Pokémon Go
remove /sdcard/Android/data/com.nianticlabs.pokemongo/files

# Facebook
remove /sdcard/Android/data/com.facebook.katana/files /sdcard/Android/data/com.facebook.orca/files/stickers /sdcard/DCIM/Facebook /sdcard/.facebook_cache

# Instagram
remove /sdcard/Android/data/com.instagram.android/files /sdcard/.InstagramLive

# New Star Soccer
remove /sdcard/Android/data/com.newstargames.newstarsoccer/files/al

# Soccer Hero
remove /sdcard/Android/data/com.appfactory.soccerhero/files/UnityCache

# Sonic Dash 2: Sonic Boom
remove /sdcard/Android/data/com.sega.sonicboomandroid/files/.vungle /sdcard/Android/data/com.sega.sonicboomandroid/files/al

# Sonic Forces Speed Battle
remove /sdcard/Android/data/com.sega.sprint/files/al /sdcard/Android/data/com.sega.sprint/files/UnityCache

# Tap Tap Reborn
remove /sdcard/Android/data/com.musicrage.tr/files/.vungle "/sdcard/Tap Tap Reborn"
remove_type /sdcard/Android/data/com.musicrage.tr/files png

# Tap Tap Reborn 2
remove_type /sdcard/Android/data/com.amanotes.taptapreborn2/files png
remove_type /sdcard/Android/data/com.amanotes.reborn/files png
remove /sdcard/Android/data/com.amanotes.taptapreborn2/files/.vungle /sdcard/Android/data/com.amanotes.reborn/files/.vungle "/sdcard/Tap Tap Reborn 2" "/sdcard/Tap Tap Reborn 2 Beta" /sdcard/.ValuePotion /sdcard/Android/data/com.amanotes.reborn/files/al

# uTorrent
remove /sdcard/Android/data/com.utorrent.client/files/al

# Recycle Bin
remove /sdcard/.estrongs/recycle

# Empty files and folders
remove_empty_files_folders /sdcard

echo -e "\e[0m"
