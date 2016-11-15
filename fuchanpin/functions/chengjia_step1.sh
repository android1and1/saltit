#!/bin/bash
# filename fuchanpin/functions/chengjia_step1.sh

function chengjia_step1(){

# this insipired from multi3_advanc2,
# global variable 1 is : "records[]" ,it is an array,elements are all describution of exprression.
# global variable 2 is : ordernum,give script interaction a order number while ansering.
#
#	while true
#	do
# important parts(below two lines):
#		records["$ordernum"]="$this_expression"
#		let "ordernum+=1"
#	done

	while true
	do
		multi1=$(random 2 7)
		multi2=$(random 2 7)
		# z not invole multiplication.
		z=$(random 1 100)
		multiplication_expression="$multi1""*""$multi2"

		(( oddoreven=z%2 ))
		if test ${oddoreven} -eq 0
		# means even
		then
			this_expression="$z""+""$multiplication_expression"
		else
			this_expression="$multiplication_expression""+""$z"
		fi
		
		# not exceed 100
		let resu="$this_expression"

		if test $resu -ge 100;then
			continue
		fi

		records["$ordernum"]="$this_expression"
		let "ordernum+=1"
		break
	done
}
