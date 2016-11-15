#!/bin/bash
# filename : test_letfull.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf

. ${FUNCPATH}/base 2>/dev/null

# include ours
. fuchanpin/functions/base

LEVEL=3

# 1st
echotest "1st:invoke once,can running?"

echo 'solidoneaddone=5%1%11%0%10' > fuchanpin/temp/sample_of_test_letfull.conf
echo 'solidoneaddone=5%0%11%0%10' >> fuchanpin/temp/sample_of_test_letfull.conf
echo 'diff2=40' >> fuchanpin/temp/sample_of_test_letfull.conf

letfull "fuchanpin/temp/sample_of_test_letfull.conf"
iisr "$? == 0"
huali

echotest "2nd : global array is full?"
iisr "${#records[@]} == 50"
huali

#3rd
echotest "3rd : full of chengjia"
rm -rf fuchanpin/temp/*
records=()
ordernum=0
#echo 'chengjia_step1=15' >> fuchanpin/temp/sample_of_test_letfull.conf
echo 'diff2=15' >> fuchanpin/temp/sample_of_test_letfull.conf
letfull "fuchanpin/temp/sample_of_test_letfull.conf"
iisr "${#records[@]} == 15"
huali

# home keeping
rm -rf fuchanpin/temp/*
records=()
ordernum=0
