#!/bin/bash

# -------------------------------------------------------------------
function remove_type {

	for j in "${@}" ; do
	
		if [ "${j}" = "$1" ] ; then
			continue
	
		elif ! [ "${j}" = "$1" ] ; then
			
			for i in "$1"/*."${j}" ; do
				
				if [ "${i}" = "$1/*.${j}" ] ; then
					return
				fi
		
				rm "${i}"
				OK="$?"

				if [ "$OK" -eq 0 ] ; then
					echo -e "\e[96m>> Deleted ${i}\e[33m"
				fi
			done
		fi
	done
}
# -------------------------------------------------------------------
function remove {

	for j in "${@}" ; do

		if [ -e "${j}" ] ; then
			rm -r "${j}"
			OK="$?"

			if [ "$OK" -eq 0 ] ; then
				echo -e "\e[92m>> Deleted ${j}\e[33m"
			fi
		fi
	done
}
# -------------------------------------------------------------------
function remove_folder {

	for j in "${@}" ; do
		if [ "${j}" = "$1" ] ; then
			continue
		fi
		for i in "$1"/* ; do
			
			if [ "${i}" = "$1/*" ] ; then
				return
			elif ! [ -e "${i}/${j}" ] ; then
				continue
			fi
		
			rm -r "${i}/${j}"
			OK="$?"

			if [ "$OK" -eq 0 ] ; then
				echo -e "\e[92m>> Deleted ${i}/${j}\e[33m"
			fi
		done
	done
}
# -------------------------------------------------------------------
function remove_empty_files_folders {

	for i in "$1"/{.,}* ; do
		for j in "${@}" ; do
			if [ "${j}" = "$1" ] ; then
				continue
			elif [ "${i}" = "${j}" ] && ! [ "${j}" = "$1" ] ; then
				return
			fi
		done
		if [ -d "${i}" ] ; then
			 remove_empty_files_folders "${i}"
		fi

		for i in "$1"/{.,}* ; do
			for j in "${@}" ; do
				if [ "${j}" = "$1" ] ; then
					continue
				elif [ "${i}" = "${j}" ] && ! [ "${j}" = "$1" ] ; then
					return
				fi
			done
		done
		if [ "${i}" = "$1/*" ] ; then
			rm -r "$1"
			echo -e "\e[92m>> Deleted $1\e[33m"
			return

		elif ! [ -s "${i}" ] && [ "${i}" != "$1/.*" ] && [ "${i}" != "$1/*" ] ; then
			rm "${i}"
			echo -e "\e[96m>> Deleted ${i}\e[33m"
		fi
	done
}
