#!/bin/bash

# filename:rework_or_exit_whole.sh(old name:continue_or_exit_whole.sh)

# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf

# !import!  if product already,comment below line!
declare -i DEBUG=2

function rework_or_exit_whole(){
	# should test if global variable:"step" is exists.
	if test -z "$step"
	then
		[[ $DEBUG > 1 ]]  | echotest "\$step not exists."
		return 1
	fi

	[[ $DEBUG > 1 ]]  &&  echotest "\$step==$step"
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
	. ${FUNCPATH}/base 2>/dev/null
	step=0
	echotest "first,step==$step."
	rework_or_exit_whole
	echotest "Now \$step==$step"
	huali
	# if enviroment has no "step"
	unset step
	rework_or_exit_whole
	huali
	# if step=1000,yes,its too big but its valid.
	step=1000
	rework_or_exit_whole
	echotest "Now \$step==$step."
fi
