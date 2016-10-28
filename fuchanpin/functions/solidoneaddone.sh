#!/bin/bash
# filename : solidoneaddone.sh
function solidoneaddone(){
	# $1 is a option - switcher 1 (means a is solid) or 0 (means b is solid)
	# $2 is solid to which number
	# $3 is min of range expression of fluid one(if $1==1,defines b's range. 
	# $4 is max of range expression of fluid one(if $1==1,defines b's range. 

	while true
	do 
		if test $1 -eq 0;then
			a=$2
			declare -i b=$(random $3 $4)
		else
			b=$2
			declare -i a=$(random $3 $4)
		fi

		((resu=a+b))
		item="$a""+""$b"
#		tooclose "$item"
#		if test $? -eq 0;then
#			continue	
#		fi
		records["$ordernum"]="$item"
		((ordernum++))
		break
	done
}
