#!/bin/bash
# filename : solidfirstdiffone.sh
function solidfirstdiffone(){
	# $1 is solid to which number
	# $2 is min of range expression of fluid one. 

	while true
	do 
		random_b=$(random "$2" "$1")
		item="$1""-""$random_b"
		# if random give a num equal $1,like "1-1"
		if test "$1" -eq "$random_b";then
			continue	
		fi
		# avoid too close to the previous exp.
#		tooclose "$item"
#		if test $? -eq 0;then
#			continue	
#		fi
		records["$ordernum"]="$item"
		((ordernum++))
		break
	done
}
