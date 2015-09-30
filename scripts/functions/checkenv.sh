#!/bin/bash
. /home/pi/saltit/scripts/functions/base 2>/dev/null
function checkenv(){
	[[ DEBUG > 1 ]]
	if [ ! -d "./share" ]
	then
		[[ DEBUG > 1 ]] && echotest "no share directory."
		return 3
	fi
	if [ ! -f "./.ignores" -a ! -f "./ignores" ]
	then
		[[ DEBUG > 1 ]] && echotest " no .ignores file."
		return 2
	fi

	return 0
}

if [[ DEBUG > 1 ]]
then
	checkenv
	echotest "\$?==$?"
fi
