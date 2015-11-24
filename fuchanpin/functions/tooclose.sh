#!/bin/bash
function tooclose(){
	# $1 is a be-tested expression(str)
	# return 0 means tooclose? yes.
	# return 1 means no 
	if test "${#records[@]}" -lt 9;then
		[[ $LEVEL < 2 ]] && echo 'till -lt 9 case.'
		for i in ${records[@]}
		do
			if [ "$i" = "$1" ];then
				[[ $LEVEL < 2 ]] && echo got match:\$1==\$i==$i 
				return 0
			fi
		done
	else	
		[[ $LEVEL < 2 ]] && echo 'till else case' 
		let "start_index=${#records[@]}-10"
		let "to_index=${#records[@]}-1"
		[[ $LEVEL < 2 ]] && echo 'start=='$start_index' ;to_index=='"$to_index"
		for i in $(seq $start_index ${to_index}) 
		do
			elem=${records[$i]}
			[[ $LEVEL < 2 ]] && echo elem==$elem \$1==$1
			if [ $1 = $elem ];then
				[[ $LEVEL < 2 ]] && echo 'test $1==$elem,will return 0(True).'
				return 0
			fi
		done
	fi
	return 1
}
