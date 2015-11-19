#!/bin/bash
# filename zookeeper
# purpose:decode a crypted_dir.interaction with cmd_client,..
function zookeeper(){
	# $1 is a directory,which keeps all encrypted files(data).
	# $1 should contains a "this.flag" token-file,which can be made for password
	if test ! -f $1/this.flag
	then
		return 3
	fi

	password=$( guess $1/this.flag )
	if test -z $password
	then
		return 2
	fi

	for ii in $(ls $1/encoded_*)
	do
		offsalteach $ii $password
	done
}
