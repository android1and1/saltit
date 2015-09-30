#!/bin/bash
# in this func,we want to do what?
# -- do these,multi f.
# we want check what?
# -- name has or has not '.ignores'
# -- empty,normal size,too big(size).
# -- is a directory or a file.
# 

. /home/pi/saltit/scripts/functions/base 2>/dev/null

function daimecheck(){
		
	# $1 is a path's name from client's input 
	if test -d "$1"
	then
		test $DEBUG -gt 1 && echotest "is a dir name."
		files=$( ls -A "$1" )
		if [[ "$files" =~ "ignores" ]]	
		then
			return 0
		fi
	elif test -f "$1"
		test $DEBUG -gt 1 && echotest "is a file name."
		return 0
	else
		test $DEBUG -gt 1 && echotest "maybe it is not exists at all."
		return 1
	fi
}
if [[ DEBUG > 1 ]]
then
	daimecheck /home/pi/saltit/scripts/functions 
fi
