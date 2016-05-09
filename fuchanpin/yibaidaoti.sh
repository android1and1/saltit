#!/bin/bash
# file about 100 questions

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
#. $project_dir/conf/abs.conf
#. $project_dir/conf/options.conf
#. ${FUNCPATH}/base 2>/dev/null

# include ours
#. fuchanpin/functions/base

function zhuo100(){
	# 1) got sources via func:letfull,$records will full of 100 question
	# 2) a while loop,count each question's order,
	#	in inner level,test answer,if right,pass,or return the beginning.one success,one num++
	# 3) till end,report.. 

	letfull	
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
