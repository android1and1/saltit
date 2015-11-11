#!/bin/bash
# filename:test_tellsize.sh

# the famous 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# 1st test
echotest "1st test,give a big file as \$1"
thesize="$(tellsize ${FUNCPATH}/abigfile)"
iisr "$thesize=more"
huali

# 2nd test
echotest "2nd test,give a small file as \$1"
thesize="$(tellsize ${FUNCPATH}/checkvolidor.sh)"
iisr "$thesize=less"

