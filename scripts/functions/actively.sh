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

	old_PS3=$PS3
	PS3="Input Your Choice(Number):  "
	usepass="00"
	hunglow='#############################################################################'
	echo $hunglow
	echo 'the first step::: USE DEFAULT PASSWORD(00) OR INPUT YOURS?'
	echo $hunglow
	echo
	select decide in "00 (default)" "i_want_input_mine:" 
	do
		case $REPLY in
		1)
			# means use default '00' as $usepass.
			break
			;;
		2)
			read -p "[Enter Simple Passwd,Like '0','1','01'...]   " usepass 
			# check "$usepass"
			echo ${SIMPLE_PASSWORD} | grep --quiet $usepass
			if [ $? -ne 0 ];then
				rework_or_exit_whole
				break
			fi
			break
			;;
		3)
			REPLY=
			echo "only '1' '2' is option."
			;;
		esac
	done

	echo $hunglow
	echo 'the second step::: KEEP ON(USE DEFAULT DIRECTORY TO UPLOADING) OR TURN BACK?'
	echo $hunglow
	echo
	select decide in "${founds}"" (default)"  "rework" "exit"
	do
		case $REPLY in
		1)
			checkvalidor $founds
			if [ "$?" -ne 0 ];then
				echo -e "\033[1;31m::ERROR:: \033[0m""$decide Is Not A Valid Directory."
				sleep .5
				rework_or_exit_whole
				break
			fi
			# get list.
			filelist=$(upload_all_except_ignores $founds)

			for eachfile in $filelist
			do
				salteach $eachfile "$usepass"			
			done
			# not forget,touch a tokenfile:.done to $founds
			touch $founds/.done
			# not forget attach 'okay' token file.
			cp ${SHARE_D}/okaies/encoded_okay_$usepass ${UPLOADS}/this.flag

			break
			;;
		2)
			actively
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
	PS3=${old_PS3}
}
