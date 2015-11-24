#!/bin/bash
# filename:yibaidao.sh( 100 calculator )
# global vars here
DEBUG=2
#test $DEBUG -gt 1 && 
question=""
# DELTA is range of main array.
# first it defined to '1',then func:  will increase it to '2','3',till '9'.after this moment,DELTA solid
# to '9'.

declare -i DELTA=1

declare -i ordernum=0
declare -a histo
declare latest

function tooclose(){
	# $1 is be test number (made by get2add,get2diff..)
	if [ $ordernum -lt 9 ];then
		for i in ${histo[@]}
		do
			if [[ "$i"=="$1" ]];then
				return 1
			fi
		done
	else	
		let "start_index=$ordernum-$DELTA"
		for i in $(seq $start_index $ordernum) 
		do
			if [[ "$1"=="${histo[$i]}" ]];then
				return 1
			fi
		done
	fi
	return 0
}

function random(){
	min=$1
	max=$(($2-$min+1))
	num=$(($RANDOM+1000000000))
	echo $(($num%$max+$min))
}

function get2add(){
	declare -i a=$(random 0 10)
	declare -i b=$(random 0 10)
	((resu=a+b))
	if test $resu -lt 10;then
		get2add
	else
		item="$a""+""$b"
		tooclose "$item"
		if test $? -eq 1;then
			get2add
		fi
		histo[$ordernum]=$item
		((ordernum++))
		if [ $DELTA -lt 9 ];then
			((DELTA++))
		fi	
		echo $item 
	fi
}

function get2diff(){
	declare -i a=$(random 0 20)
	declare -i b=$(random 0 20)
	if [ $a -lt $b ];then
		item="$b""-""$a"
	else
		item="$a""-""$b"	
	fi
	tooclose "$item"
	if test $? -eq 1;then
		get2diff
	fi
	histo[$ordernum]=$item
	((ordernum++))
	if [ $DELTA -lt 9 ];then
		((DELTA++))
	fi	

	echo $item
}

for i in {1..11}
do
	get2add
	get2diff
	echo ordernum: $ordernum
	echo arr elements: ${histo[@]}
done
