#!/bin/bash

# filename: ask.sh (spirit from jia9.sh)

# global vars here

function ask(){
	# because $1 maybe involves * ,pupple could miss its means,let change it form from '*' to 'x'
	# keep new form to templary variable:jazz
	local jazz
	# maybe involves multiplication
	jazz=${1#*\*}
	# maybe involves division
	jazz=${jazz#*/}

	if test ${#1} == ${#jazz};then
		# means $1 has not involve multiplication symbol(s)
		# in bash shell a ':' means do nothing.
		:
	else
		# in this case,tr(translate) $1 to common format,example:5x8+1
		jazz=`echo $1|tr '*' 'x'|sed -e 's/\//\\u00f7/'` 
	fi

	while true 
	do
	#version1
	#	read -s -p "Q""$curnum"") ""${1}""=?" clientans
	#version2
		read -s -p "Q""$curnum"") ""${jazz}""=?" clientans
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
