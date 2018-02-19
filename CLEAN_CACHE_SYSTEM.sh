#!/bin/bash
#version: 3.1.2
# -------------------------------------------------------------------
function remove_folder {

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

	for j in "${@}" ; do

		if [ "${j}" = "." ] || [ "${j}" = ".." ] ; then
			continue

		elif ! [ -d "${j}" ] ; then
			rm "${j}"
			OK="$?"

			if [ "$OK" -eq 0 ] ; then
				echo -e "\e[96m>> Deleted ${j}\e[33m"
			fi		
		fi
	done
}
# -------------------------------------------------------------------
function remove_type_within_folder {

	if [ -e "$1" ] ; then

		for j in "${@}" ; do

			if [ "${j}" = "$1" ] ; then
					continue

			else
				arr1="$( ls -a "$1"/*".${j}" )"
				
				SAVEIFS=$IFS
				IFS=$'\n'
				array=($arr1)
				IFS=$SAVEIFS

				if [ "${#array[@]}" = 0 ] ; then
					return
				fi

				for i in "${array[@]}" ; do

					if ! [ -d "${i}" ] ; then
						rm "${i}"
						OK="$?"

						if [ "$OK" -eq 0 ] ; then
							echo -e "\e[96m>> Deleted ${i}\e[33m"
						fi
					fi
				done
			fi
		done
	fi
}
# -------------------------------------------------------------------
function remove_folder_within_folder {

	if [ -e "$1" ] ; then

		arr1="$( ls -a "$1")"
		SAVEIFS=$IFS
		IFS=$'\n'
		array=($arr1)
		IFS=$SAVEIFS

		if [ "${#array[@]}" = 2 ] ; then
			return
		fi

		for i in "${array[@]}" ; do
			for j in "${@}" ; do

				if [ "${j}" = "$1" ] ; then
					continue

				else
					if [ "${i}" = "." ] || [ "${i}" = ".." ] ; then
						continue

					elif [ -d "$1/${i}" ] && [ "${i}" = "${j}" ] ; then
						rm -r "$1/${i}"
						OK="$?"

						if [ "$OK" -eq 0 ] ; then
							echo -e "\e[92m>> Deleted $1/${i}\e[33m"
						fi		
					fi
				fi
			done
		done
	fi
}
# -------------------------------------------------------------------
function remove_file_within_folder {

	if [ -e "$1" ] ; then

		arr1="$( ls -a "$1")"
		SAVEIFS=$IFS
		IFS=$'\n'
		array=($arr1)
		IFS=$SAVEIFS

		if [ "${#array[@]}" = 2 ] ; then
			return
		fi

		for i in "${array[@]}" ; do
			for j in "${@}" ; do

				if [ "${j}" = "$1" ] ; then
					continue

				else
					if [ "${i}" = "." ] || [ "${i}" = ".." ] ; then
						continue
					elif ! [ -d "$1/${i}" ] && [ "${i}" = "${j}" ] ; then
						rm "$1/${i}"
						OK="$?"

						if [ "$OK" -eq 0 ] ; then
							echo -e "\e[96m>> Deleted $1/${i}\e[33m"
						fi
					fi
				fi
			done
		done
	fi
}
# -------------------------------------------------------------------
function remove_folder_within_subfolder {

	if [ -e "$1" ] && [[ $2 =~ ^-?[0-9]+$ ]] ; then

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
						remove_folder_within_subfolder "$first_argument/${i}" $(($second_argument-1)) "${@}"
						first_argument=${first_argument%/*}
						second_argument=$(($second_argument+1))
					fi
				fi
			done
		done
	fi
}
# -------------------------------------------------------------------
function remove_file_within_subfolder {

	if [ -e "$1" ] && [[ $2 =~ ^-?[0-9]+$ ]] ; then

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
						remove_file_within_subfolder "$first_argument/${i}" $(($second_argument-1)) "${@}"
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

	if [ -e "$1" ] && [[ $2 =~ ^-?[0-9]+$ ]] ; then

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
