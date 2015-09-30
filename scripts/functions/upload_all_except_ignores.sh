#!/bin/bash

. /home/pi/saltit/scripts/functions/base

# ------------- the tropic of cancer
upload_all_except_ignores(){
	# $1 is the uploads dir, default is ./uploads.
	# check if have a .ignore.get its content.
	# and re-list all files,they need be encryed,except files in .ignore.
	# return the list.


	#ignores keeps some files that no need be encryed.
	declare -a ignores 


	#alls keeps all files from command : "ls"
	declare -a alls


	alls=( $( ls "$1" ) )
	test $DEBUG -gt 1 && echo $DEBUGTITLE"  \$alls=="${alls[@]}


	# check variable:alls


	if test -f "$1"/.ignores
	then
		ignores=( `cat "$1"/.ignores` )
		# run loop for match each ignore.	
		let outmax="${#alls[@]}-1"
		for i in $( seq 0 $outmax )	
		do
			let innermax=" ${#ignores[@]} - 1 "
			for ii in $( seq 0 $innermax )	
			do
				if [[ ${alls[$i]} == ${ignores[$ii]} ]]
				then
					test $DEBUG -gt 1 && echo $DEBUGTITLE"  \$all[i]:\$ignores[ii] --- "${alls[$i]}":"${ignores[$ii]} 
					unset alls[i]
				fi
			done
		done
	fi

	# Till here,we got result,which should be encryed.
	echo ${alls[@]}
	unset i ii  innermax outmax alls ignores 
	return 0
}
# ------------- the tropic of capricorn 
if [[ DEBUG > 1 ]] 
then
	upload_all_except_ignores  "/home/pi/saltit/uploads/"
fi
