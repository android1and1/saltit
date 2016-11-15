#!/bin/bash
# filename tell_dot 
function tell_dot(){
	# base help_find_dot_{flag|token) func.
	# sometimes(after serverial use-time),will fuzzed of how many dir contains token file?
	# run this help main client program:saltit unsaltit

	# $1 is type ,maybe in {token|flag}
	if test $1 = "token";then
		dirordirs=$( find ${ABSROOT} -type f -regex ".*/.token$" -exec dirname {} \; | awk '{print $1;}' )
	fi
	if test $1 = "flag";then
		dirordirs=$( find ${ABSROOT} -type f -regex ".*/\.flag$" -exec dirname {} \; | awk '{print $1;}' )
	fi
	echo "$dirordirs"
	[ $DEBUG -gt 1 ] && echo [func tell_dot said +]: till here
}
