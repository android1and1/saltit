#!/bin/bash

# filename:jia9.sh( + 9 )

# global vars here
DEBUG=2
question=""
declare -i prenum=0
declare -i curnum=0

declare -i ordernum=1
function random(){
	min=$1
	max=$(($2-$min+1))
	num=$(($RANDOM+1000000000))
	echo $(($num%$max+$min))
}

function getpeer(){
	curnum=$(random 0 9)
	question="9+""$curnum"	
}
function jia9(){
	getpeer 
	if test $curnum -eq $prenum;then
		jia9
	fi	
	declare -i success=1
	while [ 1 ]
	do
		if [ $success -eq 0 ];then
			break
		fi
		read -s -p "Q""$ordernum"") ""$question""=?" myans
		echo -ne "\nA) ""$myans""\n"
		eval let correctone=$question
		if test $correctone -eq $myans;then
			echo 'Good.'
			echo
			let success=0
		else
			echo -e "\033[1;31mWrong,try again\033[0m"
			sleep 1
			echo
		fi
	done
	let "ordernum++"	
	prenum=$curnum
}
echo -en "\n<<<   hi,welcome calculator game.   >>>\n\n"
while [ $ordernum -le 15 ] 
do
	jia9
done
echo 'total '"$ordernum"' questions.'
echo 'Done.'
