#!/bin/bash
# filename:test_rework_or_exit_whole.sh

# first of first,include abs root(directory) name.
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf

. ${FUNCPATH}/base 2>/dev/null

step=0
echotest "first,step==$step."
rework_or_exit_whole
echotest "Now \$step==$step"
huali
# if enviroment has no "step"
unset step
rework_or_exit_whole
huali
# if step=1000,yes,its too big but its valid.
step=1000
rework_or_exit_whole
echotest "Now \$step==$step."
