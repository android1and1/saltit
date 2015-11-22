#!/bin/bash
# filename help_find_dot_flag
function help_find_dot_flag(){
	# this helpful func return a dir name.
	# only find "../.flag" file.
	dirordirs=$( find ${ABSROOT} -type f -regex ".*/\.flag$" -exec dirname {} \; | awk '{print $1;}' )
	# if count dirs more than one "dir1 dir2...",will lost at the below line,at last show "No Found!"
	if test -d "$dirordirs"
	then
		echo $dirordirs
	else
		echo "No Way!"
	fi
}
