#!/bin/bash
# filename : testdiff2.sh

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
echotest "1st test,invoke diff2 once."
echotest "init stat:ordernum==$ordernum records contents: ${records[@]}"
diff2
echotest "after invoke diff2() once,the num of ordernum is ""$ordernum"" ."

iisr "${#records[@]} -eq 1"
huali



#2nd
echotest "2nd test,invoke diff2() 12 times."
for i in {1..12}
do
	echo '------------ the '"$i"' time ------------'
	echo ordernum==$ordernum
	echo '------------      --------------------'
	diff2
done
echotest "after invoke 12 times,now ordernum is: ""$ordernum"
echotest "content of sets are:  "
echo "${records[@]}"
iisr "${#records[@]} -eq 13"


# home keeping
records=()
