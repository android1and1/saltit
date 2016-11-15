#!/bin/bash
# filename : fuchanpin/functions/diff2_advance.sh
function diff2_advance(){
	while true
	do
		declare -i a=$(random 1 100)
		declare -i b=$(random 1 100)
		if [ $a -lt $b ];then
			item="$b""-""$a"
		else
			item="$a""-""$b"	
		fi
#		tooclose "$item"
#		if [ $? -eq 0 ];then
#			continue
#		fi
		records["$ordernum"]="$item"
		((ordernum++))
		break
	done
}
