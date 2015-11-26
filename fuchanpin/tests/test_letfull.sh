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
echotest "1st,run once."


echo 'diff2=10' >> fuchanpin/temp/itis.conf
echo 'add2=10' >> fuchanpin/temp/itis.conf
echo 'multi3=10' >> fuchanpin/temp/itis.conf
sleep 1

letfull "fuchanpin/temp/itis.conf"
iisr "$? -eq 0"
iisr "! -z $records"
iisr "${#records[@]} -eq 30"


# 2nd
echotest "2nd,this time,with python."
records=()
ordernum=()
# 55 expressions,so give it as argument1 to py script.
#eval ordernum=$(python fuchanpin/help.py "55")
echo 'diff2=15' >> fuchanpin/temp/sample_55.conf
echo 'add2=20' >> fuchanpin/temp/sample_55.conf
echo 'multi3=20' >> fuchanpin/temp/sample_55.conf
sleep 1
letfull "fuchanpin/temp/sample_55.conf"
iisr "$? -eq 0"
iisr "! -z $records"
iisr "${#records[@]} -eq 55"
# let us see see
echo "${records[@]}"

# home keeping
rm -rf fuchanpin/temp/*
records=()
ordernum=0
