#!/bin/bash
function checkvalidor(){
	#$1 is dirname which contains pre_encoded_file(s)
	# check dirname is exists.
	# check it has a 'token' file under the dir.
	# check dir has some files(not empty).
	if test -f "$1""/.done" -o -f "$1"".done";then
		echo "uploaded already,can not replay."
		return 3
	fi

	if test ! -d "$1";then
		echo "\"$1\" is not a valid directory."
		return 2
	fi

	return 0
}
