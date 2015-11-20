#!/bin/bash
# filename help_find_dot_deen
function help_find_dot_deen(){
	# this helpful func return a dir name.
	# only find "../.deen" file.
	dirordirs=$( find ${ABSROOT} -type f -regex ".*/.deen$" -exec dirname {} \; | awk '{print $1;}' )
	# if count dirs more than one "dir1 dir2...",will lost at the below line,at last show "No Found!"
	if test -d "$dirordirs"
	then
		echo $dirordirs
	else
		echo "No Way!"
	fi
}
