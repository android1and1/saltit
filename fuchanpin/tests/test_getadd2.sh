#!/bin/bash
# filename : test_getadd2.sh

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
echotest "1st test,invoke getadd2 once."
getadd2
iisr "$ordernum -eq 1"
iisr "${#records[@]} -eq 1"
huali

# 2nd
echotest "2nd test,invoke getadd2 12 times,see what\'s output?"
for i in {1..12}
do
	echo '-------  '"$i"'  ---------'
	getadd2
done
iisr "$ordernum -eq 13"
iisr "${#records[@]} -eq 13"
echo "now array contents:  "${records[@]}
huali

# 3rd
echotest "3rd test,more,,and more"
for i in {1..100}
do
	getadd2 2>&1 1>/dev/null
done
echotest "da jie ju"
echo ${records[@]}

