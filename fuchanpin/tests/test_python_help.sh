#!/bin/bash
# filename fuchanpin/functions/test_python_help.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf

. ${FUNCPATH}/base 2>/dev/null

# include ours
. fuchanpin/functions/base


# 1st
echotest "1st : each ordernum is element of array which be output by python help script."
echotest "init,ordernum==$ordernum"
eval ordernum=$(python fuchanpin/help.py)
echotest "now ordernum has ${#ordernum[@]} length."
echotest "output,see."
echo "${ordernum[@]}"
huali

# home keeping
records=()
ordernum=()

