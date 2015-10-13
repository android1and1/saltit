#!/bin/bash
#filename get_dir_or_exit.sh
#test-filename:../tests/test_get_dir_or_exit.sh

function _help_of_find(){
	# this helpful func return a dir name.
	# fatastic,only one time wrriten it,no error!
	thesedirs=$( find ${ABSROOT} -type f -regex '.*/\.?token$' -exec dirname {} \;)
	thedir=$( echo $thesedirs | awk '{print $1;}' ) 
	if test -d "$thedir"
	then
		echo $thedir
	else
		echo ""	
	fi
}

function _get_dir_action(){
	select workingdir in $( _help_of_find ) "i want input the dir manully" "rework" "exit"
	do
		case "$REPLY" in 
		1)
			echo "$workingdir"" (default) "
			return 0
			;;
		2)
			read -p "Input Here. " inputthing
			ls "$inputthing" 2>/dev/null
			if [ $? -eq 0 ]
			then
				echo $inputthing
				return 0
			fi

			echo "your input are not a working directory,try again."
			REPLY=
			;;
		3)
			echo 'rework'
			REPLY=
			;;
		4)
			echo "Exit Case." 
			return 1	
			;;
		*)
			echo Unknow Option \,Just '"1" "2" "3" "4"' can use\.
			echo try again\.
			;;
		esac
	done

}


function get_dir_or_exit(){
	# check in its env,if there is a variable named 'workingdir'
	test -z $WORKINGDIR && return 3

	# this method should return strings (from its echo)
	# default,program will search every $HOME/ dir which contains a '.token' or 'token' file
	hello="\nHi,Please Input Your Working Directory(for uploading).\n"
	echo -en $hello

	# get result
	WORKINGDIR=$( _get_dir_action )
	return 0
}
