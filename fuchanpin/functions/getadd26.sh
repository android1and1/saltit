#!/bin/bash
# filename ./fuchanpin/functions/getadd26.sh
function getadd26(){
	while true
	do 
		a=6
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
