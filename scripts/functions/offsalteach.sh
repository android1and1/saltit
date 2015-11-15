#!/bin/bash
# filename offsalteach.sh (a conversert of 'salteach')

function offsalteach(){
	# $1 is a token file,be encoded alreay,we use 'guess' func,get its plain text.
	# $2 is encoded_file,need decode it.

	# in some inner tests,it is nessary to know if client or program give full of arguments.
	# so,add a line code to handle the case.
	if test $# -lt 2 ;then
		:
	fi 
	
	# offsalteach() is a inner func,means,it no need juadge some difference conditions.

	# first we guess the password of encoding-token-file.
	password=$( guess "$1" )
	[[ $DEBUG >  1 ]] && echo "[func offeach() said] ""$password"	

	# get $2's basename
	from2=$( basename "$2" )

	openssl enc -d -aes256 -in $2 -kfile "${SHARE_D}""/md5s/md5sum_""$password" -out "${DOWNLOADS}""/decoded_""$from2" 2>${SHARE_D}/isee
}
