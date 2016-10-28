#!/bin/bash
# filename:test_rework_or_exit_whole.sh

# first of first,include abs root(directory) name.
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf

. ${FUNCPATH}/base 2>/dev/null

echotest "first test:"
rework_or_exit_whole
huali

echotest "2nd test:"
rework_or_exit_whole
