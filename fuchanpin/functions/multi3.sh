#!/bin/bash
# filename fuchanpin/functions/multi3.sh

function multi3(){
	#
	while true
	do
		x=$(random 0 20)
		y=$(random 0 20)
		z=$(random 0 20)

		symbola="-"
		symbolb="-"
		((resu=x%2))
		test $resu -eq 0 && symbola="+"
		((resu=y%2))
		test $resu -eq 0 && symbolb="+"

		part_of_expression="$x""$symbola""$y"
	[[ $LEVEL < 2 ]] && echo part_of_expresson=="$part_of_expression"
		let "part_result=$part_of_expression"
	[[ $LEVEL < 2 ]] && echo part_result=="$part_result"
		if test $part_result -gt 20 -o $part_result -lt 0;then
			continue
		fi

		this_expression="$x""$symbola""$y""$symbolb""$z"
		let multi_resu=$this_expression
		if test $multi_resu -gt 20 -o $multi_resu -lt 0;then
			continue
		fi

		records["$ordernum"]="$this_expression"
		let "ordernum+=1"
		break
	done
}
