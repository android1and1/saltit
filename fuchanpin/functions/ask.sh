#!/bin/bash

# filename: ask.sh (spirit from jia9.sh)

# global vars here

function ask(){
	while true 
	do
		read -s -p "Q""$curnum"") ""${1}""=?" clientans
		echo -ne "\nA) ""$clientans""\n"
		if [ "$clientans" = 'Q' ];then
			echo 'Quit This Test,Bye.'
			return 1
		fi
		eval let correctone="${1}"
		if test "$correctone" -eq "$clientans" 2>/dev/null;then
			echo 'Good.'
			echo
			break
		else
			echo -e "\033[1;31mWrong,try again\033[0m"
			sleep 1
			echo
		fi
	done
	let "curnum++"	
	return 0
}
