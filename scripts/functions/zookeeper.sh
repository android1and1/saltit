#!/bin/bash
# filename zookeeper
# purpose:decode a crypted_dir.interaction with cmd_client,..

function zookeeper(){
	# $1 is a directory,which keeps all encrypted files(data).
	# $1 should contains a "this.flag" token-file,which can be made for password

	# its task for itself,mkdir a new dir that from itself,
	# examples : if "$1" is ${ABSROOT}/uploads,will create a directory ,named "${ABSROOT}/DE_uploads".

	if test ! -f $1/.flag
	then
		echo flag no found\.
		return 3
	fi

	password=$( guess "$1/.flag" )
	if test -z $password
	then
		echo can resolve flag\'s pass\.
		return 2
	fi
	# till here,should prepare directory which offsalteach's result live in.

	# the DE_XXX directory must clearly.
	thisdownprefix=$( dirname $1 )
	thisdownbasename=$( basename $1 )
	thisdown=$thisdownprefix/DE_$thisdownbasename
	mkdir $thisdown

	for ii in $(ls $1/encoded_*)
	do
		offsalteach $ii $password
	done
}
