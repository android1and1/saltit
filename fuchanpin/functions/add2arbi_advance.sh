#!/bin/bash
# filename ./fuchanpin/functions/add2arbi_advance.sh
function add2arbi_advance(){
	while true
	do 
		declare -i a=$(random 0 100)
		declare -i b=$(random 0 100)
		((resu=a+b))
		if test $resu -gt 100 -o $resu -lt 11;then
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
