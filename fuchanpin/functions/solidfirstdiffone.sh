#!/bin/bash
# filename : solidfirstdiffone.sh
function solidfirstdiffone(){
	# $1 is solid to which number
	# $2 is min of range expression of fluid one. 

	while true
	do 
		random_b=$(random "$2" "$1")
		item="$1""-""$random_b"
		tooclose "$item"
		if test $? -eq 0;then
			continue	
		fi
		records["$ordernum"]="$item"
		((ordernum++))
		break
	done
}
