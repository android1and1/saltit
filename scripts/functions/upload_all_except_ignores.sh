#!/bin/bash
# !import! if product already,comment the below line.
declare -i DEBUG=2


# ------------- the tropic of cancer
upload_all_except_ignores(){
	# $1 is the uploads dir, default name is "uploads".
	# check if it has a 'done' token-file.
	# check if have a '.ignore' file.
	# and re-list all files,they need be encryed,except files in .ignore.
	# return the list via 'echo' event.

	# first we will check if "$1" is given,if not , if "./uploads" is exists
	[[ DEBUG > 1 ]] && echotest "\$#==$# and \$1==${1}"

	# check length of arguments.
	if [ $# -ne 1 ];then
		echo Usage: "$0" THE_UPLOAD_DIRECTORY
		# exit 2
		return 2
	fi
	
	# check if the dir name is real(if exists)
	if test ! -d "$1";then
		echo "directory	""$1""is not exists."
		return 1
	fi

	# check if the dir contains a 'done' file,it is a token meanning all files below the dir has
	# been encryed and handled.
	# in this case,function return
	if [ -f "$1""/done" ];then
		echo 'the directory is done(encryed already,not need handle again till you remove "done" file)'
		return 0
	fi

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
	# make a token,so next invoke this will exit --- dont do again.
	touch "$1""/done"	
	unset i ii  innermax outmax alls ignores 
	return 0
}
# ------------- the tropic of capricorn 
if [[ $DEBUG > 1 ]] 
then
	. /home/pi/Workspace/saltit/scripts/functions/base
	
	# first ,client(programer) forgot append the dir-argument
	upload_all_except_ignores

	# it will return and show why it failure
	# try again.
	huali

	# second time,client forgot the real path name,he input
	# a no exists directory.
	upload_all_except_ignores /home/pi/nothisdirectory/

	# and it failure.try again
	huali

	# make a temprary dir
	TEMPD="/home/pi/Workspace/saltit/uploads"
	mkdir -p "$TEMPD"	
	touch "$TEMPD""/"{a,b,c,d,A,B,C,D}.txt
	touch "$TEMPD"/.ignores 
	echo "a.txt A.txt" > "$TEMPD""/.ignores"
	 
	# real test...
	upload_all_except_ignores "$TEMPD"

	# invoke the function again,see if it will work(we hope it no).
	# huali not rember
	huali
	upload_all_except_ignores "$TEMPD"

	# yes,it not work again,but if we remove the ./done?
	# not forget 'huali'
	huali
	rm "$TEMPD""/done"
	upload_all_except_ignores "$TEMPD"
	
	 
	sleep 4 
	# do homekeeping
	rm -rf "$TEMPD"
fi
