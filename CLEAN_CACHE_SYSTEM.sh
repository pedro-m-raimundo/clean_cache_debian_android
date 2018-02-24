#!/bin/bash
#version: 3.3
# -------------------------------------------------------------------
function remove_folder {

	if [[ -z "$1" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_folder\"]: 1st argument\n\t -> Function without arguments\e[33m\n"
		return
	fi

	for j in "${@}" ; do

		if [ "${j}" = "." ] || [ "${j}" = ".." ] ; then
			continue

		elif [ -d "${j}" ] ; then
			rm -r "${j}"
			OK="$?"

			if [ "$OK" -eq 0 ] ; then
				echo -e "\e[92m>> Deleted ${j}\e[33m"
			fi		
		fi
	done
}
# -------------------------------------------------------------------
function remove_file {

	if [[ -z "$1" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_file\"]: 1st argument\n\t -> Function without arguments\e[33m\n"
		return
	fi

	for j in "${@}" ; do

		if [ "${j}" = "." ] || [ "${j}" = ".." ] ; then
			continue

		elif ! [ -d "${j}" ] && [ -e "${j}" ] ; then
			rm "${j}"
			OK="$?"

			if [ "$OK" -eq 0 ] ; then
				echo -e "\e[96m>> Deleted ${j}\e[33m"
			fi		
		fi
	done
}
# -------------------------------------------------------------------
function remove_type {

	if [[ -z "$1" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_type\"]: 1st argument\n\t -> Function without arguments\e[33m\n"
		return
	fi

	if [[ -z "$2" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_type\"]: 2nd argument\n\t -> No maximum layer assigned\e[33m\n"
		return
	fi

	if [[ -z "$3" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_type\"]: 3rd argument\n\t -> There must be, at least, one type of extension to delete\e[33m\n"
		return
	fi

	if [ -e "$1" ] ; then

		first_argument=$1
		second_argument=$2
		shift
		shift

		if [ $second_argument = 0 ] ; then
			return
		fi

		arr1="$( ls -a "$first_argument")"
		SAVEIFS=$IFS
		IFS=$'\n'
		array=($arr1)
		IFS=$SAVEIFS

		if [ "${#array[@]}" = 2 ] ; then
			return
		fi

		for i in "${array[@]}" ; do
			for j in "${@}" ; do

				if [ "${j}" = "$first_argument" ] || [ "${j}" = "$second_argument" ] ; then
					continue

				else
					if [ "${i}" = "." ] || [ "${i}" = ".." ] ; then
						continue

					elif ! [ -d "$first_argument/${i}" ] && [[ "${i}" == *"${j}" ]] ; then
						rm "$first_argument/${i}"
						OK="$?"

						if [ "$OK" -eq 0 ] ; then
							echo -e "\e[96m>> Deleted $first_argument/${i}\e[33m"
						fi

					elif [ -d "$first_argument/${i}" ] ; then
						remove_type "$first_argument/${i}" $(($second_argument-1)) "${@}"
						first_argument=${first_argument%/*}
						second_argument=$(($second_argument+1))
							
					fi
				fi
			done
		done
	fi
}
# -------------------------------------------------------------------
function remove_folder_in_folders {

	if [[ -z "$1" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_folder_in_folders\"]: 1st argument\n\t -> Function without arguments\e[33m\n"
		return
	fi

	if [[ -z "$2" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_folder_in_folders\"]: 2nd argument\n\t -> No maximum layer assigned\e[33m\n"
		return
	fi

	if [[ -z "$3" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_folder_in_folders\"]: 3rd argument\n\t -> There must be, at least, one folder to delete\e[33m\n"
		return
	fi

	if [ -e "$1" ] ; then

		first_argument=$1
		second_argument=$2
		shift
		shift

		if [ $second_argument = 0 ] ; then
			return
		fi

		arr1="$( ls -a "$first_argument")"
		SAVEIFS=$IFS
		IFS=$'\n'
		array=($arr1)
		IFS=$SAVEIFS

		if [ "${#array[@]}" = 2 ] ; then
			return
		fi

		for i in "${array[@]}" ; do
			for j in "${@}" ; do

				if [ "${j}" = "$first_argument" ] || [ "${j}" = "$second_argument" ] ; then
					continue

				else
					if [ "${i}" = "." ] || [ "${i}" = ".." ] ; then
						continue

					elif [ -d "$first_argument/${i}" ] && [ "${i}" = "${j}" ] ; then
						rm -r "$first_argument/${i}"
						OK="$?"

						if [ "$OK" -eq 0 ] ; then
							echo -e "\e[92m>> Deleted $first_argument/${i}\e[33m"
						fi

					elif [ -d "$first_argument/${i}" ] ; then
						remove_folder_in_folders "$first_argument/${i}" $(($second_argument-1)) "${@}"
						first_argument=${first_argument%/*}
						second_argument=$(($second_argument+1))
					fi
				fi
			done
		done
	fi
}
# -------------------------------------------------------------------
function remove_file_in_folders {

	if [[ -z "$1" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_file_in_folders\"]: 1st argument\n\t -> Function without arguments\e[33m\n"
		return
	fi

	if [[ -z "$2" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_file_in_folders\"]: 2nd argument\n\t -> No maximum layer assigned\e[33m\n"
		return
	fi

	if [[ -z "$3" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_file_in_folders\"]: 3rd argument\n\t -> There must be, at least, one file to delete\e[33m\n"
		return
	fi

	if [ -e "$1" ] ; then

		first_argument=$1
		second_argument=$2
		shift
		shift

		if [ $second_argument = 0 ] ; then
			return
		fi

		arr1="$( ls -a "$first_argument")"
		SAVEIFS=$IFS
		IFS=$'\n'
		array=($arr1)
		IFS=$SAVEIFS

		if [ "${#array[@]}" = 2 ] ; then
			return
		fi

		for i in "${array[@]}" ; do
			for j in "${@}" ; do

				if [ "${j}" = "$first_argument" ] || [ "${j}" = "$second_argument" ] ; then
					continue

				else
					if [ "${i}" = "." ] || [ "${i}" = ".." ] ; then
						continue
					elif ! [ -d "$first_argument/${i}" ] && [ "${i}" = "${j}" ] ; then
						rm "$first_argument/${i}"
						OK="$?"

						if [ "$OK" -eq 0 ] ; then
							echo -e "\e[96m>> Deleted $first_argument/${i}\e[33m"
						fi

					elif [ -d "$first_argument/${i}" ] ; then
						remove_file_in_folders "$first_argument/${i}" $(($second_argument-1)) "${@}"
						first_argument=${first_argument%/*}
						second_argument=$(($second_argument+1))
							
					fi
				fi
			done
		done
	fi
}
# -------------------------------------------------------------------
function remove_empty_files_folders {

	if [[ -z "$1" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_empty_files_folders\"]: 1st argument\n\t -> Function without arguments\e[33m\n"
		return
	fi

	if [[ -z "$2" ]] ; then
		echo -e "\n\e[33m[ERROR in \"remove_empty_files_folders\"]: 2nd argument\n\t -> No maximum layer assigned\e[33m\n"
		return
	fi

	if [ -e "$1" ] ; then

		first_argument=$1
		second_argument=$2
		shift
		shift

		if [ $second_argument = 0 ] ; then
			return
		fi

		arr1="$( ls -a "$first_argument")"
		SAVEIFS=$IFS
		IFS=$'\n'
		array=($arr1)
		IFS=$SAVEIFS

		if [ "${#array[@]}" = 2 ] ; then
			rm -r "$first_argument"
			OK="$?"

			if [ "$OK" -eq 0 ] ; then
				echo -e "\e[92m>> Deleted $first_argument\e[33m"
			fi

			return
		fi

		for i in "${array[@]}" ; do
			NUMBER="${#@}"
			for j in "${@}" ; do

				if [ "${j}" = "$first_argument" ] || [ "${j}" = "$second_argument" ] ; then
					continue

				else
					if [ "$first_argument/${i}" == "${j}" ] ; then
						break
					fi
				fi

				NUMBER=$(($NUMBER-1))
			done

			if [ "${i}" = "." ] || [ "${i}" = ".." ] ; then
				continue

			elif ! [ -d "$first_argument/${i}" ] && ! [ -s "$first_argument/${i}" ] ; then
				rm "$first_argument/${i}"
				OK="$?"

				if [ "$OK" -eq 0 ] ; then
					echo -e "\e[96m>> Deleted $first_argument/${i}\e[33m"
				fi
			fi

			if [ $NUMBER -eq 0 ] ; then

				if [ -d "$first_argument/${i}" ] ; then

					remove_empty_files_folders "$first_argument/${i}" $(($second_argument-1)) "${@}"
					first_argument=${first_argument%/*}
					second_argument=$(($second_argument+1))
				fi
			fi
		done

		arr1="$( ls -a "$first_argument")"
		SAVEIFS=$IFS
		IFS=$'\n'
		array=($arr1)
		IFS=$SAVEIFS

		if [ "${#array[@]}" = 2 ] ; then
			rm -r "$first_argument"
			OK="$?"

			if [ "$OK" -eq 0 ] ; then
				echo -e "\e[92m>> Deleted $first_argument\e[33m"
			fi

			return
		fi
	fi
}
