#!/bin/bash
. /home/pi/saltit/scripts/functions/base

function continue_or_exit_whole(){
	# should test if global variable:"step" is exists.
	if test -z "$step"
	then
		[[ DEBUG > 1 ]]  | echotest "\$step not exists."
		return 1
	fi

	[[ DEBUG > 1 ]]  &&  echotest "\$step==$step"
	select iwant in "exit" "rework"
	do

		case $iwant in 
		exit)
			let step=44
			break
			;;
		rework)
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

if [[ DEBUG > 1 ]] 
then
	continue_or_exit_whole
fi
