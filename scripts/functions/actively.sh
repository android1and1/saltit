#!/bin/bash
# filename:actively.sh
# refact at 2015-10-19 AM 9:47:00
# actively.sh==main.sh(means:delete old contents of saltit.sh,let it be a soft link of this.)
function actively(){
	if [ "$( help_of_find )" = "No Way!" ];then
		echo "need uploading directory,has no found."
		return 2
	fi

	select decide in "$( help_of_find )"" (default)" "i_want_input_mine:" "exit"
	do
		case $REPLY in
		1)
			upload_all_except_ignores $decide
			break
			;;
		2)
			# input mine
			read -p "enter the directory name: " dirname

			upload_all_except_ignores $dirname
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
}
