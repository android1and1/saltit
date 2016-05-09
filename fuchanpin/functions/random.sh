#!/bin/bash

function random(){
	min=$1
	max=$(($2-$min+1))
	num=$(($RANDOM+1000000000))
	echo $(($num%$max+$min))
}
