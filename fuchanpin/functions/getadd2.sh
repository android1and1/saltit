#!/bin/bash
# filename ./fuchanpin/functions/getadd2.sh
function getadd2(){
	while true
	do 
		declare -i a=$(random 0 10)
		declare -i b=$(random 0 10)
		((resu=a+b))
		if test $resu -lt 8;then
			continue
		fi
		item="$a""+""$b"
		tooclose "$item"
		if test $? -eq 0;then
			continue	
		fi
		records[$ordernum]=$item
		((ordernum++))
		break
	done
	echo $item 
}
