#!/bin/bash
# filename : test_solidoneaddone.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf

. ${FUNCPATH}/base 2>/dev/null

# include ours
. fuchanpin/functions/base

echotest "1st test,invoke once."
solidoneaddone 1  11 0 20
iisr "$? -eq 0"
huali

echotest "2nd test,invokes many times."
for i in {1..10}
do
	(( arg1value = i % 2 ))
	echo 'this time is odd?even?see: '$arg1value
	solidoneaddone $arg1value 7 0 20
done
# the first test let records add 1.
iisr "${#records[@]} -eq 11"
huali

# the 2nd 

