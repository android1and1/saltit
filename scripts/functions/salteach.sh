#!/bin/bash
# filename:salteach.sh
function salteach(){
	# Usage salteach $1 $2
	# $1 is a valid file.and its size must smaller than we defined before(in this case
	# it was '4M'.
	# $2 is one kind of simple password,in value of variable : $SIMPLE_PASSWORD 
	# return status code:0,2,1
	# a template varialbe named "from2" convert $2.
	# if $1 too big,more than 4M,will return 1,means no handle till split the big file.

	# B.T.W
	# salteach is inner func,means:it can handle multi condition:
	# 1) $1 is a link file
	# 2) $1 is too big so need split it.
	# 3) $1 is no exists at all.
	# ..
	# all of them(hard problem),task is by its connector:maybe it is actively.sh
	
	if test $(tellsize $1) != "less"
	then
		return 1
	fi

	from2=$( ls "${SHARE_D}""/md5s/"*${2} )
	from1="$( basename $1 )"
	openssl enc -aes256 -in $1 -kfile $from2 -out "${UPLOADS}/""encoded_"${from1}".data" 	
}	

