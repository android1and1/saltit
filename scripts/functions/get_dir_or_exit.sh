#!/bin/bash
#filename get_dir_or_exit.sh
# refact at 2015-10-19 AM 9:47:00
#test-filename:../tests/test_get_dir_or_exit.sh

function _help_of_find(){
	# this helpful func return a dir name.
	# fatastic,only one time wrriten it,no error!
	thesedirs=$( find ${ABSROOT} -type f -regex '.*/\.?token$' -exec dirname {} \; | awk '{print $1;}' )
	[[ $DEBUG > 1 ]] && echotest "$thesedirs"
	# if count dirs more than one "dir1 dir2...",will lost at the below line,at last show "No Found!"
	if test -d "$thesedirs"
	then
		#echo $thedir
		echo $thesedirs
	else
#		echo ""	
		echo "No Found!"
	fi
}

function _get_dir_action(){
	:
}


function get_dir_or_exit(){
	:
}
