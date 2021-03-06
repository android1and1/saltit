#!/bin/bash
# filename help_find_dot_token
function help_find_dot_token(){
	# this helpful func return a dir name.
	# fatastic,only one time wrriten it,no error!
	# only find "../.token" file.
	dirordirs=$( find ${ABSROOT} -type f -regex ".*/.token$" -exec dirname {} \; | awk '{print $1;}' )
	# if count dirs more than one "dir1 dir2...",will lost at the below line,at last show "No Found!"
	[[ $DEBUG > 1 ]] && echo "\$dirordirs==$dirordirs"
	if test -d "$dirordirs"
	then
		echo $dirordirs
	else
		echo "No Way!"
	fi
}
