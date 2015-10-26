#!/bin/bash
# filename help_of_find
function help_of_find(){
	# this helpful func return a dir name.
	# fatastic,only one time wrriten it,no error!
	dirordirs=$( find ${ABSROOT} -type f -regex '.*/\.?token$' -exec dirname {} \; | awk '{print $1;}' )
	# if count dirs more than one "dir1 dir2...",will lost at the below line,at last show "No Found!"
	[[ $DEBUG > 1 ]] && echo "hi,""$dirordirs"
	if test -d "$dirordirs"
	then
		echo $dirordirs
	else
		echo "No Way!"
	fi
}
