Author: Pedro Raimundo

Contact: pedro.miguel.raimundo1@gmail.com

Github: https://github.com/raimas1996/clean_cache_android

Last reviewed: 2017-09-30 12:10:34



These bash script allows users to delete unwanted files from their android device with one tap. Simply select the functions and the arguments that you want to use and run the script.



In order for this to work, you need:

	1 -> Download and install "Terminal Emulator for Android" (https://play.google.com/store/apps/details?id=jackpal.androidterm).
	2 -> Put the folder with the scripts on a directory of your choice.
	3 -> ONLY MODIFY THE CLEAN_CACHE_USER FILE with the available functions.
	4 -> Put "cd PATH_TO_LOCATION/clean_cache_android" and "sh CLEAN_CACHE_USER.sh" as the initial command in the preferences to run the file everytime you open the Terminal.
	5 -> Enjoy!


Functions:

	-> remove_type: delete files with the same extension from a certain folder
	arguments:
		1st -> folder (full path)
		2nd to last -> extension type

	-> remove: delete files or folders
	all arguments: file or folder (full path)

	-> remove_folder: remove certain folders within a directory
	arguments:
		1st -> directory where the folders are (full path)
		2nd to last -> folders to delete (full path)

	-> remove_empty_files_folders: delete empty files and folders in the main folders and in all subfolders
	arguments:
		1st -> main folder (full path)
		2nd to last -> folders and files to skip, if any (full path)


WARNING: THESE BASH SCRIPTS CAN DELETE IMPORTANT FILES IF YOU DON'T KNOW HOW TO USE! I WILL NOT TAKE RESPONSIBILITY IF IMPORTANT DATA ON YOUR DEVICE IS LOST! USE IT AT YOUR OWN RISK!


Future implementations:

	-> Adding counters for the number of files, folders and the total size of everything that was deleted (in a far future)


Versions:

	2.3.1: Fixed bug in functions where not all arguments were parsed.
	2.3: Altered the first 3 function in order to parse multiple arguments.
	2.2.1: Fixed bug on "remove_empty_files_folders" function where it basically skipped the first argument as well.
	2.2: Added the option to skip multiple files and folders in the function "remove_empty_files_folders".
	2.1: Created a README text file.
	2.0: Separating functions and user preferences into two separate files.
	1.1: Resolving problems with permissions.1.0: Cleaning some junk code and making it "look great". 
	0.6: Added a condition in the "remove_empty_files_folders" function to skip certain folders. Its not fully implemented yet.
	0.5: "remove_empty_files_folders" can now delete empty files and folders from subdirectories
	0.4: function "remove_empty_files_folders" created, but only working in the main folder, not the subfolders
	0.3: " remove_type " was added
	0.2: implemented function "remove_folder"
	0.1.1: "echo" was added to the below function
	0.1: created "remove" function
