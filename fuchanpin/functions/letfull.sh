#!/bin/bash
# file about 100 questions

function letfull(){
	# $1 is filename
	if test ! -f $1;then
		return 1
	fi
	while read  line
	do
		if test -z "$line";then
			[[ $LEVEL < 2 ]] && echo line is zero\.
			continue
		fi

		if [[ "$line" == '#'* ]];then
			continue
		fi

		thisname=$(echo $line | cut -d ' ' -f 1 | cut -d '=' -f 1)
		thisvalue=$(echo $line | cut -d ' ' -f 1 | cut -d '=' -f 2)
		[[ $LEVEL < 2 ]] && echo thisname==$thisname thisvalue==$thisvalue 
		case "$thisname" in
		solidoneaddone)
			amount=$( echo "$thisvalue" | cut -d '%' -f 1)
			option1=$( echo "$thisvalue" | cut -d '%' -f 2)
			option2=$( echo "$thisvalue" | cut -d '%' -f 3)
			option3=$( echo "$thisvalue" | cut -d '%' -f 4)
			option4=$( echo "$thisvalue" | cut -d '%' -f 5)
			for i in $(seq 0 $((amount-1)) )
			do
				solidoneaddone "$option1" "$option2" "$option3" "$option4" 
			done
			;;
		diff2)
			for i in $(seq 0 $((thisvalue-1)) )
			do
				diff2
			done
			;;
		multi3)
			for i in $(seq 0 $((thisvalue-1)) )
			do
				multi3	
			done
			;;
		add2arbi)
			for i in $(seq 0 $((thisvalue-1)) )
			do
				add2arbi	
			done
			;;
		esac
	done < "$1"

	return 0
}
