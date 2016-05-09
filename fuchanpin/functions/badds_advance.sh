#!/bin/bash
# filename ./fuchanpin/functions/badds_advance.sh
function badds_advance(){
	while true
	do 
		declare -i a=$(random 11 97)
		declare -i b=$(random 2 10)
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
