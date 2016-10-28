#!/bin/bash
function checkvalidor(){
	if [ $DEBUG -gt 2 ];then
		echo "[func checkvalidor said ] \$1==$1"
	fi
	# $1 is dirname which contains pre_encoded_file(s)
	# check dirname is exists.
	# check it has a '.token' file under the dir.
	# check dir has some files(not empty).
	# check if has '.done' token-file,means has or has not uploaded.
	# check below dir has or has not real file(need encryed).

	
	# substr "$1" if it has a '/' postfix.
	# declare -i thelatestindex=${#1}-1
	# there is a intresting story below line.
	# test $DEBUG -gt 2 && echo "[func checkvalidor said] the chars is: ""${1:$thelatestindex-2}"
	
	#if test "${1:$thelatestindex}" = "/";then
	#	[ $DEBUG -gt 1 ] && echo "[func checkvalidor said] the latest char is '/'."
	#	return 40
	#fi

	if test ! -d "$1";then
		[ $DEBUG -gt 1 ] && echo "[func checkvalidor said] \"$1\" is not a valid directory."
		return 30
	fi

	if test -f "$1""/.done";then
		[ $DEBUG -gt 1 ] && echo "[func checkvalidor said] uploaded already,can not replay."
		return 20
	fi

	if test ! -f "$1""/.token" -a ! -f "$1"".token";then
		[ $DEBUG -gt 1 ] && echo "[func checkvalidor said] token file no found."
		return 15
	fi
	
	if test -z "$(ls $1)";then
		[ $DEBUG -gt 1 ] && echo "[func checkvalidor said] no real file(s)."
		return 10
	fi
		
	# till here,all satisfy.
	return 0
}
