#!/bin/bash
# filename:actively.sh
# refact at 2015-10-19 AM 9:47:00
# actively.sh==main.sh(means:delete old contents of saltit.sh,let it be a soft link of this.)

function actively(){
	if [ "$( help_of_find )" = "No Way!" ];then
		[[ $DEBUG > 1 ]]  && echotest "no found!why?always loop into this."
		rework_or_exit_whole
		return 2
	fi
	# 'passengers' means each of encode-needing-files.
	if [ -z "$passengers" ];then
		[[ $DEBUG -gt 1 ]] && echotest 'global variable "passengers" no seted.'
		return 1
	fi

	while [ 1 ]
	do
		select decide in "$( help_of_find )"" (default)" "i_want_input_mine:" "exit"
		do
			case $REPLY in
			1)
				echo $decide
				break
				;;
			2)
				# input mine
				read -p "enter the directory name: " dirname
				checkvalidor $dirname
				break
				;;
			3)
				echo 'exit case'
				break
				;;
			*)
				echo 'only 1 2 3 option are valid.'
				REPLY=
				;;
		esac
		done
	done
}
