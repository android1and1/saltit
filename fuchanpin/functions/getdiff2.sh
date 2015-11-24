#!/bin/bash
DEBUG=2

function getdiff2(){
	declare -i a=$(random 0 20)
	declare -i b=$(random 0 20)
	if [ $a -lt $b ];then
		item="$b""-""$a"
	else
		item="$a""-""$b"	
	fi
	tooclose "$item"
	if test $? -eq 1;then
		getdiff2
	fi
	histo[$ordernum]=$item
	((ordernum++))
	if [ $DELTA -lt 9 ];then
		((DELTA++))
	fi	

	echo $item
}
