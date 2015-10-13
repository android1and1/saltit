#!/bin/bash
# filename get_dir_or_exit.sh
# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf

# !import! if product already,comment the below line.
declare -i DEBUG=2

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

if [[ $DEBUG > 1 ]]
then
	. ${FUNCPATH}/base 2>/dev/null
	#global var: WORKINGDIR
	WORKINGDIR='no_yet_now'
	mkdir -p ${ABSROOT}/ddk1/
	mkdir -p ${ABSROOT}/ddk2/
	touch ${ABSROOT}/ddk1/.token
	touch ${ABSROOT}/ddk2/token
#	_help_of_find
	get_dir_or_exit
	huali
	echotest "$WORKINGDIR"
	
#clean
	rm -rf ${ABSROOT}/ddk1/
	rm -rf ${ABSROOT}/ddk2/
	unset WORKINGDIR
fi
