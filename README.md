Have you ever had your smartphone full of trash files that you want to get rid of? Are cleaning apps unreliable to certain trash files?
If only there was a way to customize the files and folders that you want to delete... Oh wait, here's the solution!

These bash scripts allows users to delete their unwanted files (it can be anything) from their android device with one tap. Simply select the functions and the arguments that you want to use and run the script. Easy to use and effective when cleaning!

------

In order for this to work on **Android**, you need:

1. Download and install [Terminal Emulator for Android](https://play.google.com/store/apps/details?id=jackpal.androidterm).
2. Put the folder with the scripts on a directory of your choice.
3. **ONLY MODIFY THE CLEAN_CACHE_USER FILE with the available functions. Also beware that not all text editors for Windows work for this kind of script (It's because of the "Enter" key)!**
4. Put _"cd PATH_TO_LOCATION/clean_cache_ubuntu_android"_ and _"sh CLEAN_CACHE_USER.sh"_ as the initial command in the preferences to run the file everytime you open the Terminal.
5. Enjoy!
------

In order for this to work on **Ubuntu**, you need:

1. Put the folder with the scripts on a directory of your choice.
2. **ONLY MODIFY THE CLEAN_CACHE_USER FILE with the available functions. Also beware that not all text editors for Windows work for this kind of script (It's because of the "Enter" key)!**
3. Execute _"cd PATH_TO_LOCATION/clean_cache_ubuntu_android"_ and _"sh CLEAN_CACHE_USER.sh"_ on the terminal.
4. Enjoy!
------

**Functions:**

* **_remove_folder_**: delete folders.
	* all arguments: full path of the folders.
<p>

* **_remove_file_**: delete files.
	* all arguments: full path of the files.
<p>

* **_remove_type_within_folder_**: delete files with the same extension from a certain folder.
	* arguments:
		* 1st &rarr; folder (full path).
		* 2nd to last &rarr; extension type.
<p>

* **_remove_folder_within_folder_**: remove certain folders within a directory.
	* arguments:
		* 1st &rarr; directory where the folders are (full path).
		* 2nd to last &rarr; folders to delete (name of the folder).
<p>

* **_remove_file_within_folder_**: remove certain files within a directory.
	* arguments:
		* 1st &rarr; directory where the files are (full path).
		* 2nd to last &rarr; files to delete (name of the file).
<p>

* **_remove_folder_within_subfolder_**: remove certain folders within a directory.
	* arguments:
		* 1st &rarr; directory where the folders are (full path).
		* 2nd &rarr; how many layers should the function go. Choose:
			* = 1 &rarr; only the folder itself.
			* \> 1 &rarr; the main folder and subfolders, until they reach the maximum layer given.
			* = 0 &rarr; nothing happens.
			* anything else &rarr; the main folders and all subfolders
		* 3rd to last &rarr; folders to delete (name of the folder).
<p>

* **_remove_file_within_subfolder_**: remove certain files within a directory.
	* arguments:
		* 1st &rarr; directory where the files are (full path).
		* 2nd &rarr; how many layers should the function go. Choose:
			* = 1 &rarr; only the folder itself.
			* \> 1 &rarr; the main folder and subfolders, until they reach the maximum layer given.
			* = 0 &rarr; nothing happens.
			* anything else &rarr; the main folders and all subfolders
		* 3rd to last &rarr; files to delete (name of the folder).
<p>

* **_remove_empty_files_folders_**: delete empty files and folders in the main folders and in all subfolders.
	* arguments:
		* 1st &rarr; main folder (full path).
		* 2nd &rarr; how many layers should the function go. Choose:
			* = 1 &rarr; only the folder itself.
			* \> 1 &rarr; the main folder and subfolders, until they reach the maximum layer given.
			* = 0 &rarr; nothing happens.
			* anything else &rarr; the main folders and all subfolders
		* 3rd to last (optional) &rarr; folders and files to skip, if any (full path).

------

**WARNING: THESE BASH SCRIPTS CAN DELETE IMPORTANT FILES IF YOU DON'T KNOW HOW TO USE! I WILL NOT TAKE RESPONSIBILITY IF IMPORTANT DATA ON YOUR DEVICE IS LOST! USE IT AT YOUR OWN RISK!**

------

**Future implementations:**

| Priority | Description |
|----------------|:------------|
| Low | Adding counters for the number of files, folders and the total size of everything that was deleted (in a far future). |

------

**Versions:**

| Version number | Description |
|----------------|:------------|
| 3.2 | Rewrite of the version 3.1.3, to make all functions display error messages when arguments are missing. |
| 3.1.3 | Error message is displayed when the second argument of the last three functions is not an integer and shows the line where the function is called. |
| 3.1.2 | Added another condition to all functions that allow searching in layers to accept only integers on their second argument ("_remove_folder_within_subfolder_", "_remove_file_within_subfolder_" and "_remove_empty_files_folders_"). |
| 3.1.1 | Added a condition to all functions (except "_remove_file_" and "_remove_folder_") to skip them if the main folder doesn't exist. |
| 3.1 | Restored two functions where a folders and files can be directly deleted instead of searching for them ("_remove_file_" and "_remove_folder_"). |
| 3.0 | Complete overhaul on the system functions. Many bugs led to the rewrite of all them. All of them were fixed, some of them were renamed and others were created. It was also added compatibility between Android and Ubuntu (they both use Shell). Performance is lower than the other versions, but reliability was increased. |
| 2.3.2 | Fixed a bug on the last function, where at folders were not skipped. |
| 2.3.1 | Fixed bug in functions where not all arguments were parsed. |
| 2.3 | Altered the first 3 function in order to parse multiple arguments. |
| 2.2.1 | Fixed bug on "_remove_empty_files_folders_" function where it basically skipped the first argument as well. |
| 2.2 | Added the option to skip multiple files and folders in the function "_remove_empty_files_folders_". |
| 2.1 | Created a _README_ text file. |
| 2.0 | Separating functions and user preferences into two separate files. |
| 1.1 | Resolving problems with permissions. |
| 1.0 | Cleaning some junk code and making it "_look great_". |
| 0.6 | Added a condition in the "_remove_empty_files_folders_" function to skip certain folders. Its not fully implemented yet. |
| 0.5 | "_remove_empty_files_folders_" can now delete empty files and folders from subdirectories. |
| 0.4 | function "_remove_empty_files_folders_" created, but only working in the main folder, not the subfolders. |
| 0.3 | "_remove_type_" was added. |
| 0.2 | implemented function "_remove_folder_". |
| 0.1.1 | "_echo_" was added to the below function. |
| 0.1 | created "_remove_" function. |
