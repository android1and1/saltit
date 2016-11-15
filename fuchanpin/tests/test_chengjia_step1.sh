#!/bin/bash
# filename : test_chengjia_step1.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf

. ${FUNCPATH}/base 2>/dev/null

# include ours
. fuchanpin/functions/base

# curent directory is "saltit/"
LEVEL=1


# 1st test
echotest "1 test:func can be found?"
chengjia_step1
iisr "${#records[@]} == 1"
huali

# 2nd test
echotest "2nd test,if results of last two invokes be recorded?"
chengjia_step1
iisr "${#records[@]} == 2"
huali

# 3rd test
echotest "Global Variable ordernum now added."
chengjia_step1
iisr "$ordernum == 3"
huali

# 4th test
echotest "has an addition symbol and a multilication symbol."
records=()
ordernum=()
chengjia_step1
result=${records[0]}
iisl "$result" *"+"*
iisl "$result" *'*'
#iisl "$result" *"-"*

#echotest "$result"
# home-keeping
records=()
ordernum=()
