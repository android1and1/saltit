#!/bin/bash
# filename ./fuchanpin/functions/getadd2.sh
function getadd2(){
	declare -i a=$(random 0 10)
	declare -i b=$(random 0 10)
	((resu=a+b))
	if test $resu -lt 8;then
		getadd2
	else
		item="$a""+""$b"
		tooclose "$item"
		if test $? -eq 0;then
			getadd2
		fi
		records[$ordernum]=$item
		((ordernum++))
		echo $item 
	fi
}
