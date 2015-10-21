#!/bin/bash
# filename:rework_or_exit_whole.sh(old name:continue_or_exit_whole.sh)
# test-filename:../tests/test_rework_or_exit_whole.sh

function rework_or_exit_whole(){
	# should test if global variable:"step" is exists.
	if test -z "$step"
	then
		[[ $DEBUG > 1 ]]  | echotest "\$step not exists."
		return 1
	fi

	select iwant in "exit" "rework"
	do

		case $REPLY in 
		1)
			let step=44
			break
			;;
		2)
			let step=1
			break
			;;
		*)
			echo Unknow Option Item Only \'1\' \'2\' CAN Choice\.
			REPLY=
			;;
		esac
	done
}
