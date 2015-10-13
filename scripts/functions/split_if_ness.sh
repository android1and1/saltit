#!/bin/bash
# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf

# !import! if product already,comment the below line.
declare -i DEBUG=2

#-------------Tropic of Cancer
split_if_ness(){
	# $1 is bigfile prepare to be splited
	# $2 is a directory store splitted files.
	if [ ! -f "$1" -o ! -d "$2" ] 
	then
		[[ $DEBUG > 1 ]] && echotest "$1 or $2 not good enough to handling."
		return 1
	fi

	declare -i size
	declare -i display=$(ls -l "$1" | awk '{print $5;}')
	
	# /1024/1024 change ll output from bytes to Million Bytes.
	(( size=${display}/1024/1024 ))

	[[ $DEBUG > 1 ]] && echotest "its size is:""$size"" Mbytes."
	
	if [ $size -gt  4 ];then
		[[ $DEBUG > 1 ]] && echotest "prepare splitting!"
		declare basenameofdollar1=$( basename $1 )
		split -b 4m "$1"

		# rename right now!
		for name in $( ls x* )
		do
			mv $name ${2}/${basenameofdollar1}${name:1}
		done
		 		
		# show what files in temp directory. 
		ls -lh ${2}/${basenameofdoallar1}	
		sleep 3
		
	else
		echo \$size==$size\.
		echo "$DEBUGTITLE"" size is no big enough,no splitting." 
	fi
}

#-------------Tropic of Capricorn
if [[ $DEBUG > 1 ]]
then
	. ${FUNCPATH}/base 2>/dev/null
	TESTDIR="${FUNCPATH}/temp"
	mkdir -p $TESTDIR
	split_if_ness ${cur_dir}/scripts/functions/abigfile ${TESTDIR}
	# do house keeping.
	rm -rf $TESTDIR
	echo 'removed test data(s).'
fi
