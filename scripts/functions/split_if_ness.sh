#!/bin/bash
# first of first,include abs root(directory) name.
# get a global variable -- "ABSROOT"
. ../../conf/abs.conf

# !import! if product already,comment the below line.
declare -i DEBUG=2

#-------------Tropic of Cancer
split_if_ness(){
	# $1 is bigfile prepare to be splited
	# $2 is a directory store splitted files.
	if [ ! -f "$1" -o ! -d "$2" ] 
	then
		[[ DEBUG > 1 ]] && echotest "$1 or $2 not good enough to handling."
		return 1
	fi
	# if blocks too many,split,else do nothing.
	# $1 is file
	declare -i size
	# "ls -s"  will got file's size,unit is "kb"
	display=$(ls -s "$1" | awk '{print $1;}')
	
	(( size=${display}/1024 ))
	[[ DEBUG > 1 ]] && echotest "its size is:""$size""M bytes."
	
	if [[ size >  4 ]]   # rember!! in '[[...]]' can NOT use $size,must 'size' only!!
	then
		
		[[ DEBUG > 1 ]] && echotest "prepare splitting!"
		declare basenameofdollar1=$( basename $1 )
		split -d -b 4M "$1" 
		sleep 1

		# rename right now!
		for name in x*
		do
			mv $name ${2}/${basenameofdollar1}${name:1}
#			echo 1:$name 
#			echo 2:2:${2}/${basenameofdollar1}${name:1}
		done
		 		
		
	else
		echo "$DEBUGTITLE"" :why?"
	fi
}

#-------------Tropic of Capricorn
if [[ $DEBUG > 1 ]]
then
	. ${ABSROOT}/base 2>/dev/null
	TESTDIR="${ABSROOT}/temp"
	mkdir -p $TESTDIR

	split_if_ness ./abigfile ${TESTDIR}
	sleep 5
	# do house keeping.
	rm -rf $TESTDIR
	echo 'removed test data(s).'
fi
