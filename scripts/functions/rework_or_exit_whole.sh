#!/bin/bash
# filename:rework_or_exit_whole.sh(old name:continue_or_exit_whole.sh)
# test-filename:../tests/test_rework_or_exit_whole.sh

function rework_or_exit_whole(){
	select iwant in "exit" "rework"
	do

		case $REPLY in 
		1)
			[ $DEBUG -gt 1 ] && echo "[func rewowrk_or_exit_whole said] in '1' choice."
			#break
			exit 1
			;;
		2)
			actively
			break
			;;
		*)
			echo Unknow Option Item Only \'1\' \'2\' CAN Choice\.
			REPLY=
			;;
		esac
	done
	return 0
}
