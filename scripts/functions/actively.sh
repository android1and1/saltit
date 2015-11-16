#!/bin/bash
# filename:actively.sh
# refact at 2015-10-19 AM 9:47:00
# actively.sh's actively()==saltit.sh's main()(means:delete old contents of saltit.sh,let it be a soft link of this.)
function actively(){
	# results keeps into the variable "founds"
	founds=$( help_of_find )
	if [ "$founds" = "No Way!" ];then
		echo "need uploading directory,has no found."
		return 2
	fi

	declare usepass="00"
	echo 'the first step:choice a simple pass,defaul is "00".'
	select decide in "00 (default)" "i_want_input_mine:" 
	do
		case $REPLY in
		2)
			read -p "enter your simple password,like '0','1','01'..." usepass 
			break
			;;
		*)
			# means use default '00' as $usepass.
			break
			;;
		esac
	done
			

	echo 'the second step:use default directory or else?'
	select decide in "${founds}"" (default)" "i_want_input_mine:" "exit"
	do
		case $REPLY in
		1)
			checkvalidor $founds
			if [ "$?" -ne 0 ];then
				rework_or_exit_whole
				break
			fi
			# get list.
			filelist=$(upload_all_except_ignores $founds)

			for eachfile in $filelist
			do
				salteach $eachfile "$usepass"			
#				salteach $eachfile "00"			
			done

			break
			;;
		2)
			# input mine
			read -p "enter the directory name: " dirname
			checkvalidor "$dirname"

			# get list.
			filelist=$(upload_all_except_ignores $dirname)

			for eachfile in $filelist
			do
				salteach $eachfile "$usepass"			
			#	salteach $eachfile "00"			
			done

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
