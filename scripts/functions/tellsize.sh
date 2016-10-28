#!/bin/bash
# filename:scripts/functions/tellsize.sh

function tellsize(){
	# $1 is the file which need to encryed.
	declare -i size
	declare -i display=$(ls -l "$1" | awk '{print $5;}')
	
	# /1024/1024 change ll output from bytes to Million Bytes.
	(( size=${display}/1024/1024 ))
	if test $size -gt "$MAXSIZE";then
		echo 'more' 
	else
		echo 'less' 
	fi
}
