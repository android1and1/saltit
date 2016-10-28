#!/bin/bash
# filename ./fuchanpin/functions/add2arbi.sh
function add2arbi(){
	while true
	do 
		declare -i a=$(random 0 19)
		declare -i b=$(random 0 19)
		((resu=a+b))
		if test $resu -gt 20 -o $resu -lt 8;then
			continue
		fi
		item="$a""+""$b"
#		tooclose "$item"
#		if test $? -eq 0;then
#			continue	
#		fi
		records["$ordernum"]="$item"
		((ordernum++))
		break
	done
#	echo "$item" 
}
