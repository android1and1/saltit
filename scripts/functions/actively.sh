#!/bin/bash
# filename:actively.sh
# refact at 2015-10-19 AM 9:47:00

# oldname:get_dir_or_exit.sh

function actively(){

	if [ $DEBUG -gt 1 ];then
		#echotest "${0##*/}"
		. ${FUNCPATH}/*.sh
	fi

	while [ 1 ]
	do
		if [ "$( help_of_find )" = "No Way!" ];then
			rework_or_exit_whole
			break
		else
			select decide in "$( help_of_find )"" (default)" "i_want_input_mine:" "exit"
			do
				case $REPLY in
				1)
					echo $decide
					;;
				2)
					# input mine
					checkvalidor $decide
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
