#!/bin/bash
# filename:actively.sh
# refact at 2015-10-19 AM 9:47:00
# modified at 2015-10-21 AM 9:42:00

# oldname:get_dir_or_exit.sh

function actively(){
	if [ "$( help_of_find )" = "No Way!" ];then
		[[ $DEBUG > 1 ]]  && echotest "always loop into this."
		rework_or_exit_whole
		return 2
	fi
	# 'passengers' means each of encode-needing-files.
	if [ -z "$passengers" ];then
		[[ $DEBUG -gt 1 ]] && echotest 'global variable "passengers" no seted.'
		return 1
	fi

	declare -i everloop=1

	while [ $everloop -gt 0 ]
	do
		select decide in "$( help_of_find )"" (default)" "i_want_input_mine:" "exit"
		do
			case $REPLY in
			1)
				echo $decide
				let everloop=0
				break
				;;
			2)
				# input mine
				read -p "enter the directory name: " dirname
				checkvalidor $dirname
				let everloop=0
				break
				;;
			3)
				echo 'exit case'
				let everloop=0
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
