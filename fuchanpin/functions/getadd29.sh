#!/bin/bash
function getadd29(){
	while true
	do 
		a=9
		declare -i b=$(random 0 10)
		((resu=a+b))
		item="$a""+""$b"
		tooclose "$item"
		if test $? -eq 0;then
			continue	
		fi
		records["$ordernum"]="$item"
		((ordernum++))
		break
	done
	echo "$item" 
}
