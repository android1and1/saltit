#!/bin/bash
# interaction encrypt-decrpyt manager script:saltit.sh
# edited by Alan 2015-9-28


# Global Variables
# 1
# 	"FUNCPATH":it is a conf file,within saltit/conf/ directory,see which os type,will return a varible 'ABSROOT' meet your real one.

# 2
#	"WORKINGDIR"
# "WORKINGDIR" is a temprary global varible,used by function "get_dir_or_exit.sh"
# 3
#	"DEBUG"
# override variable:DEBUG if nessary,in produce-process,set DEBUG=0 

# the path of the dir,is by your env,override it till meet your need.
# in rpi,it is /home/pi/Workspace/saltit/scripts/functions/.
# in MinGW,it is /home/Users/Alan/tempP/saltit/(etc..)
cur_dir=$( cd $( dirname $0 )  &&  cd ../conf && pwd -P )
. $cur_dir/abs.conf

# then include 'base' enviroment.
. ${FUNCPATH}/base 2>/dev/null
# dummy a variable's value.
WORKINGDIR="No Yet"

# include "base" first,then re-define "DEBUG"(from '2' to '0')
DEBUG=0

# -----------------  Tropic of Cancer
for i in "${FUNCPATH}"/*.sh
do
	. $i # 2>/dev/null 
done
# -----------------  Tropic of Capricorn 

# titles( !s!)
# these titles all need "echo -en" because it contains '\n' token.
# we can do these via invoke our help-func:weecho(we echo)

# titleMN=title of step M,minor step N
title01="\nThanks.Let Us Step By Step For This EN/DEcoding!\n"
title11="\nStep1:Check Your Enviroment.\n"  
title21="\nStep2:Choice Directory To Encoding.\n"
title31="\nStep3:...\n"
# define step
# all step number & its means
# step 1: start point
# step 2: finish checking enviroments. 
# ...
# step 44: want exit(in a judge loop:case...esac)
declare -i step=1

PS3=" [.   ] "

function main(){
	echo -en $title01
	while [ 1 ]
	do
		# from here do a forever loop!
		case $step in
		1)
			echo -en $title11 
			if [ $? -eq 0 ]
			then
				let step+=1
			else
				rework_or_exit_whole
			fi 
			;;
		2)
			echo -en $title21
			get_dir_or_exit	
			if [ $? -eq 0 ]
			then
				let step+=1
			else
				rework_or_exit_whole
			fi 
			;;
		3)
			echo 'in step 3'

			if [ $? -eq 0 ]
			then
				let step+=1
			else
				rework_or_exit_whole
			fi 
			;;		
		4|44)
			break		
		esac
		
	done
}

#at last,invoke main()
main
