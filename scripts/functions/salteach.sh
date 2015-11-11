#!/bin/bash
# filename:salteach.sh
function salteach(){
	# $1 is a valid file.
	# $2 is one kind of simple password,in value of variable : $SIMPLE_PASSWORD 
	# return status code:0,2,1
	# a template varialbe named "from2" convert $2.
	# if $1 too big,more than 4M,will return 1,means no handle till split the big file.
	
	from2=$( ls "${SHARE_D}""/md5s/"*${2} )
	from1="$( basename $1 )"
	openssl enc -aes256 -in $1 -kfile $from2 -out "${UPLOADS}/""encoded_"${from1}".data" 	
}	

