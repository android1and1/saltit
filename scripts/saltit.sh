#!/bin/bash
# interaction encrypt-decrpyt manager script:saltit.sh
# edited by Alan 2015-9-28


# Global Variables
# 1
# 	"DAEMONDIR"
# 2
#	"WORKINGDIR"
# "WORKINGDIR" is a temprary global varible,used by function "get_dir_or_exit.sh"
# 3
#	"DEBUG"
# override variable:DEBUG if nessary,in produce-process,set DEBUG=0 

# the path of the dir,is by your env,override it till meet your need.
DAEMONDIR="/home/pi/Workspace/saltit"
# dummy a variable's value.
WORKINGDIR="No Yet"

# include "base" first,then re-define "DEBUG"(from '2' to '0')
. "$DAEMONDIR""/scripts/functions/base"

DEBUG=0

# -----------------  Tropic of Cancer
for i in "$DAEMONDIR"/scripts/functions/*.sh
do
	echo 'function=='"$i"
	. $i 2>/dev/null
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
			checkenv # see some important files is exists or no. 
			if [ $? -eq 0 ]
			then
				let step+=1
			else
				continue_or_exit_whole
			fi 
			;;
		2)
			echo -en $title21
			get_dir_or_exit	
			if [ $? -eq 0 ]
			then
				let step+=1
			else
				continue_or_exit_whole
			fi 
			;;
		3)
			echo 'in step 3'

			if [ $? -eq 0 ]
			then
				let step+=1
			else
				continue_or_exit_whole
			fi 
			;;		
		4|44)
			break		
		esac
		
	done
}
#at last,invoke main()
main


# include bash scripts
#base
#checkenv.sh
#continue_or_exit_whole.sh
#daimecheck.sh
#get_dir_or_exit.sh
#split_if_ness.sh
#upload_all_except_ignores.sh
