#!/bin/bash
# filename:split_if_ness.sh
# test-filename:../tests/test_split_if_ness.sh

#-------------Tropic of Cancer
split_if_ness(){
	# $1 is bigfile prepare to be splited
	# $2 is a directory store splitted files.
	sizereport="$(tellsize $1)"
	if [ $sizereport=more ];then
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
