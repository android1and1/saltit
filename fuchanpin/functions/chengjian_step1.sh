#!/bin/bash
# filename fuchanpin/functions/chengjian_step1.sh //notice:not 'chengjia_XXX'!

function chengjian_step1(){
	while true
	do
	#//do something
		local -i sub0 
		local -i multi1 
		local -i multi2 
		local this_expression
		local -i res0

		multi1=$(random 2 8)
		multi2=$(random 2 8)
		if [[ $multi1 == $multi2 ]];then
			continue
		fi
		sub0=$(random 2 37)

		# check sub0,and result of 'multi1 * multi2'
		((res0=multi1*multi2))
#		[[ $LEVEL < 4 ]] && echotest 'from chengjian():::$res0=='"$res0" 
		if test  $res0 -gt  $sub0;then
			this_expression="$multi1"'*'"$multi2"'-'"$sub0"
		else
			this_expression="$sub0"'-'"$multi1"'*'"$multi2"
		fi
			records["$ordernum"]="$this_expression"
			let "ordernum+=1"
		
#		[[ $LEVEL < 4 ]] && echotest "from chengjian_step1():::""$this_expression" 	
		break
	done
}
