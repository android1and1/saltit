#!/bin/bash
# filename saltit.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
#echo $project_dir

#no like scripts/tests/test_XXX,the project_dir exceed the working dir.
. $project_dir/saltit/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

DEBUG=0

actively
if test $? -ne 0
then
	echo something wrong happened\.
fi

echo 'Done.'
