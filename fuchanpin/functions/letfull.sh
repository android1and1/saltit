#!/bin/bash
# file about 100 questions

function letfull(){
	# $1 is a filename,which lists the configurations,
	# we interesting at 
	# 1) how many question we need?
	# 2) how many question each kind we need?(add2 diff2 multi3,..etc..)
	# sample
	#		### order is 'add2' first,then 'diff2',at last cook 'multi3'
	#	total=100
	# 	add2=15
	#	diff2=45
	#	multi3=40
	# at lat,RETURN 0
	if test ! -f $1;then
		return 1
	fi
	
	total=""
	add2=
	diff2=
	multi3=
	while read  line
	do
		if test -z "$line";then
			[[ $LEVEL < 2 ]] && echo line is zero\.
			continue
		fi
		thisname=$(echo $line | cut -d ' ' -f 1 | cut -d '=' -f 1)
		thisvalue=$(echo $line | cut -d ' ' -f 1 | cut -d '=' -f 2)
		[[ $LEVEL < 2 ]] && echo thisname==$thisname thisvalue==$thisvalue
		if test $thisname = total;then
			total="$thisvalue"			
			[[ $LEVEL < 2 ]] && echo got match\! 
		elif test $thisname = add2;then
			add2="$thisvalue"
		elif test $thisname = diff2;then
			diff2="$thisvalue"
		elif test $thisname = multi3;then
			multi3="$thisvalue"	
		else
			:
		fi
	done < $1

	if test ! -z "$add2";then
		let max_index_of_add2=${add2}-1
		for i in $(seq 0 $max_index_of_add2)
		do
			records[$i]=$(getadd2)
		done
	fi
	#[[ $LEVEL < 4 ]] && echo "${max_index_of_add2}" 

	if test ! -z "$diff2";then
		let max_index_of_add2+=1
		let max_index_of_diff2=${diff2}+${max_index_of_add2}-1
		for i in $(seq $max_index_of_add2 $max_index_of_diff2)
		do	
			records[$i]=$(getdiff2)
		done	
	fi	
	return 0
}
