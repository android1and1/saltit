#!/bin/bash
# filename:upload_all_except_ignores.sh
# test-filename:../tests/test_upload_all_except_ignores.sh

# ------------- the tropic of cancer
function upload_all_except_ignores(){
	# $1 is a directory.
	# the main func should invoke another function:checkvalidor checking the uploading directory,
	# so it not a task here.
	# obeys the files: '.ignores" include all need-encrypt file(s),
	# and re-list all files,they need be encryed,except files in .ignore.
	# return the list via 'echo' event.

	#ignores keeps some files that no need be encryed.
	declare -a ignores 

	#alls keeps all files from command : "ls"
	declare -a alls

	alls=( $( ls "$1" 2>/dev/null) )

	if test -f "$1"/.ignores
	then
		ignores=( `cat "$1"/.ignores` )
		# run loop for match each ignore.	
		let outmax="${#alls[@]}-1"
		[[ $DEGUG > 1 ]] && echo "[func upload_allXX said +] OUTMAX==$outmax"

		for i in $( seq 0 $outmax )	
		do
			if [ -z $ignores ];then
				break
			fi
			let innermax=${#ignores[@]}-1

			if test $DEBUG -gt 1;then
				echo "[func upload_XXX said + ] INNERMAX==""$innermax"
			fi

			for ii in $( seq 0 $innermax )	
			do
				if [[ ${alls[$i]} == ${ignores[$ii]} ]]
				then
					#unset alls[i]  ===== work also.
					#unset alls[$i] ===== work also.
					unset alls["$i"]
				fi
			done
		done
	fi

	# Till here,we got result,which should be encryed.
	# Notice that,must all are abs-pathname.
	[[ $DEBUG -gt 1 ]] && echo [func:upload_all_except_ignores said +] after unset: ${alls[@]}
	for eachresultfile in ${alls[@]}
	do
		echo "$1""/""${eachresultfile}"
	done

	# make a token,so next invoke this will exit --- dont do again.
	unset i ii  innermax outmax alls ignores 
	# NOTICE :: Only Till Here,function do its work totally,so check its return code if it is '0' is very important for
	# Other Funcs Or Programs.
	return 0
}
# ------------- the tropic of capricorn 
