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
		case "$thisname" in
		add2)
			add2="$thisvalue"
			;;
		diff2)
			diff2="$thisvalue"
			;;
		multi3)
			multi3="$thisvalue"
			;;
		add210)
			add210="$thisvalue"
			;;
		add29)
			add29="$thisvalue"
			;;
		add28)
			add28="$thisvalue"
			;;
		add27)
			add27="$thisvalue"
			;;
		add26)
			add26="$thisvalue"
			;;
		esac
	done < $1
	declare -i redthread=0
	if test ! -z "$add2";then
		let endnum=${add2}-1
		for i in $(seq 0 $endnum)
		do
			records[$i]=$(getadd2)
		done
	fi
	if test ! -z "$add210";then
		let endnum=${add210}-1
		for i in $(seq 0 $endnum)
		do
			records[$i]=$(getadd210)
		done
	fi
	if test ! -z "$add29";then
		let endnum=${add29}-1
		for i in $(seq 0 $endnum)
		do
			records[$i]=$(getadd29)
		done
	fi
	if test ! -z "$add28";then
		let endnum=${add28}-1
		for i in $(seq 0 $endnum)
		do
			records[$i]=$(getadd28)
		done
	fi
	if test ! -z "$add27";then
		let endnum=${add27}-1
		for i in $(seq 0 $endnum)
		do
			records[$i]=$(getadd27)
		done
	fi
	if test ! -z "$add26";then
		let endnum=${add26}-1
		for i in $(seq 0 $endnum)
		do
			records[$i]=$(getadd26)
		done
	fi

	let redthread=$endnum+1
	if test ! -z "$diff2";then
		for i in $( seq $redthread $(( redthread+diff2-1)) )
		do	
			records[$i]=$(getdiff2)
		done	
	fi	

	let redthread=$redthread+diff2

	if test ! -z "$multi3";then
		for i in $(seq $redthread $(( redthread + multi3 -1)) )
		do	
			records[$i]=$(getmulti3)
		done
	fi
	return 0
}
