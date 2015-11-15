#!/bin/bash
# filename:upload_all_except_ignores.sh
# test-filename:../tests/test_upload_all_except_ignores.sh

# ------------- the tropic of cancer
function upload_all_except_ignores(){
	# invoke another function:checkvalidor,for check the uploading directory,
	# obeys the files: '.ignore" include all need-encrypt file(s),
	# and re-list all files,they need be encryed,except files in .ignore.
	# return the list via 'echo' event.

	# first we will check if "$1" is given,if not , if "./uploads" is exists
	[[ $DEBUG > 1 ]] && echotest "\$#==$# and \$1==${1}"

	
#	[ $DEBUG -eq 0 ] && echo "[function upload_all_except_ignores said] \$\?==$keepd0 ."
#	[ $DEBUG -gt 1 ] && echo "[function upload_all_except_ignores said] \$\?==$keepd0 ."

	#ignores keeps some files that no need be encryed.
	declare -a ignores 


	#alls keeps all files from command : "ls"
	declare -a alls


	alls=( $( ls "$1" ) )
	[ $DEBUG -gt 1 ] && echo "[function upload_all_except_ignores said] \$alls==${alls[@]}"
	[ $DEBUG -gt 1 ] && echo "[function upload_all_except_ignores said] \$1==${1}"


	# check variable:alls


	if test -f "$1"/.ignores
	then
		ignores=( `cat "$1"/.ignores` )
		[[ $DEBUG > 2 ]] && echo "[function upload_all_except_ignores said] \$ignores==${ignores}"
		# run loop for match each ignore.	
		let outmax="${#alls[@]}-1"
		if test $DEBUG -gt 1;then
			echotest "OUTMAX==""$outmax"
		fi
		for i in $( seq 0 $outmax )	
		do
			if [ -z $ignores ];then
				break
			fi
			let innermax=${#ignores[@]}-1
			if test $DEBUG -gt 1;then
				echotest "INNERMAX==""$innermax"
			fi
			for ii in $( seq 0 $innermax )	
			do
				if [[ ${alls[$i]} == ${ignores[$ii]} ]]
				then
					test $DEBUG -gt 1 && echotest "\$all[i]:\$ignores[ii] ---${alls[$i]}:${ignores[$ii]}" 
					unset alls[i]
				fi
			done
		done
	fi

	# Till here,we got result,which should be encryed.
	# Notice that,must all are abs-pathname.
	#echo ${alls[@]}
	for ii in ${alls[@]}
	do
		echo "$1""/""${ii}"
	done

	# make a token,so next invoke this will exit --- dont do again.
	touch "$1""/.done"	
	unset i ii  innermax outmax alls ignores 
	return 0
}
# ------------- the tropic of capricorn 
