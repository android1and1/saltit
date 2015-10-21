#!/bin/bash
function checkvalidor(){
	#$1 is dirname which contains pre_encoded_file(s)
	[ -d $1 ] && echo "$1"
	return 0
}
