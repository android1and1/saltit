#!/bin/bash

# first of first,include abs root(directory) name.
# get a global variable -- "ABSROOT"
. ../../conf/abs.conf

# !import!  if product already,comment below line!
declare -i DEBUG=2

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

if [[ $DEBUG > 1 ]] 
then
	. ${ABSROOT}/base 2>/dev/null
	step=0
	continue_or_exit_whole
fi
