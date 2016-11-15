#!/bin/bash
# filename : fuchanpin/functions/bdiffs_advance.sh
function bdiffs_advance(){
	while true
	do
		declare -i a=$(random 22 99)
		declare -i b=$(random 2 10)
		item="$a""-""$b"
		#tooclose "$item"
		#if [ $? -eq 0 ];then
		#	continue
		#fi
		records["$ordernum"]="$item"
		((ordernum++))
		break
	done
}
