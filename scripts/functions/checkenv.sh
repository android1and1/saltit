#!/bin/bash

# first of first,include abs root(directory) name.
# get a global variable -- "ABSROOT"
. ../../conf/abs.conf

# !import! if produce already,comment the below line.
declare -i DEBUG=2

function checkenv(){
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

if [[ $DEBUG > 1 ]]
then
	. "${ABSROOT}""/base"  2>/dev/null
	checkenv
	echotest "\$?==$?"
	huali
	mkdir -p ./share
	touch ./.ignores
	checkenv
	echotest "\$?==$?"
	huali
	rm ./.ignores
	checkenv
	echotest "\$?==$?"
	# do home keeping
	sleep 2
	rm -rf ./share
fi
