#!/bin/bash
# filename : test_solidfirstdiffone.sh

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
solidfirstdiffone  11 0 
iisr "$? -eq 0"
huali

# the 2nd 
iisr "${#records[@]} -eq 1"

# do home keeping
records=()
ordernum=()

