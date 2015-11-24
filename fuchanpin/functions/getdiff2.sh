#!/bin/bash
# filename : fuchanpin/functions/getdiff2.sh
function getdiff2(){
	while true
	do
		declare -i a=$(random 0 20)
		declare -i b=$(random 0 20)
		if [ $a -lt $b ];then
			item="$b""-""$a"
		else
			item="$a""-""$b"	
		fi
		tooclose "$item"
		if [ $? -eq 0 ];then
			continue
		fi
		records["$ordernum"]="$item"
		((ordernum++))
		break
	done
	echo "$item"
}
