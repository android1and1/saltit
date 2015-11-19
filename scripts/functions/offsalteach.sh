#!/bin/bash
# filename offsalteach.sh (a conversert of 'salteach')

function offsalteach(){
	# $1 is encoded_file,need decode it.
	# $2 is a password("00","1"...)

	# in some inner tests,it is nessary to know if client or program give full of arguments.
	# so,add a line code to handle the case.
	if test $# -ne 2 ;then
		return 2	
	fi 
	
	# offsalteach() is a inner func,means,it no need juadge some difference conditions.

	# first we guess the password of encoding-token-file.
	password=$2
	[[ $DEBUG >  1 ]] && echo "[func offeach() said] ""$password"	

	# get $1's basename
	from1=$( basename "$1" )
	essential1=${from1%\.*}

	openssl enc -d -aes256 -in $1 -kfile "${SHARE_D}""/md5s/md5sum_""$password" -out "${DOWNLOADS}""/decoded_""$essential1" 2>${DOWNLOADS}/stdout.error
}
