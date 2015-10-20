#!/bin/bash
# filename get_dir_or_exit.sh
# refact at 2015-10-19 AM 9:47:00
#test-filename:../tests/test_get_dir_or_exit.sh

function _help_of_find(){
	# this helpful func return a dir name.
	# fatastic,only one time wrriten it,no error!
	dirordirs=$( find ${ABSROOT} -type f -regex '.*/\.?token$' -exec dirname {} \; | awk '{print $1;}' )
	# if count dirs more than one "dir1 dir2...",will lost at the below line,at last show "No Found!"
	if test -d "$dirordirs"
	then
		echo $dirordirs
	else
		echo "No Way!"
	fi
}

function _actively(){

	if [ $DEBUG -gt 1 ];then
		#echotest "${0##*/}"
		. ${FUNCPATH}/rework_or_exit_whole.sh
	fi

	while [ 1 ]
	do
		if [ "$(_help_of_find)" = "No Way!" ];then
			rework_or_exit_whole
			break
		else
			select decide in "$(_help_of_find)"" (default)" "i_want_input_mine:" "exit"
			do
				case $REPLY in
				1)
					echo $decide
					;;
				2)
					echo $decide
					;;
				3)
					echo 'exit case'
					break
				esac
			done
			return 0
		fi
	done
}


function get_dir_or_exit(){
	:
}
