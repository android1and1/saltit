#!/bin/bash
function checkvalidor(){
	#$1 is dirname which contains pre_encoded_file(s)
	# check dirname is exists.
	# check it has a '.token' file under the dir.
	# check dir has some files(not empty).
	if test ! -d "$1";then
		[ $DEBUG -gt 1 ] && echo "\"$1\" is not a valid directory."
		return 3
	fi

	if test -f "$1""/.done" -o -f "$1"".done";then
		[ $DEBUG -gt 1 ] && echo "uploaded already,can not replay."
		return 2
	fi

	if test ! -f "$1""/.token" -a ! -f "$1"".token";then
		[ $DEBUG -gt 1 ] && echo "token file no found."
		return 1
	fi

	# till here,all satisfy.
	return 0
}
