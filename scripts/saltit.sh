#!/bin/bash
# interaction encrypt-decrpyt manager script:saltit.sh
# edited by Alan 2015-9-28

# first,need include our TDD Frame
. /home/pi/saltit/scripts/functions/base


# Global Variables
# 1
# 	"WORKINGDIR"
WORKINGDIR="no yet"
# 2
#	"DEBUG"
# override variable:DEBUG if nessary,in produce-process,set DEBUG=0 
# if we dont do this,the debug infos will appears in console.
DEBUG=0

# -----------------  Tropic of Cancer
for i in /home/pi/saltit/scripts/functions/*.sh
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
			#daimecheck	
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
