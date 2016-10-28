#!/bin/bash
# filename fuchanpin/functions/test_multi3.sh
# multi3 means 3 num delimte by '+' or '-',example
# 3+2-4  8+10-9

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf

. ${FUNCPATH}/base 2>/dev/null

# include ours
. fuchanpin/functions/base

LEVEL=2

# 1st
echotest "1st test,invoke multi3 once."
multi3
iisr "$? -eq 0"


# 2nd
echotest "2nd : invoke more times."
for i in {1..11}
do
	multi3
done
iisr "${#records[@]} -eq 12"

# 3nd 
echotest "3nd: work with python."
eval getarr=$(python fuchanpin/help.py)
echo 'getarr is'
echo "${getarr[@]}" 

# home keeping
records=()
ordernum=()

