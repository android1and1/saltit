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


echo 'total=30' >> fuchanpin/temp/itis.conf
echo 'diff2=10' >> fuchanpin/temp/itis.conf
echo 'add2=10' >> fuchanpin/temp/itis.conf
echo 'multi3=10' >> fuchanpin/temp/itis.conf
sleep 1

letfull "fuchanpin/temp/itis.conf"
iisr "$? -eq 0"
huali

# 2nd
echotest "2nd,got correctly configurations."
echo 'total=30' >> fuchanpin/temp/sample.conf
echo 'add2=10' >> fuchanpin/temp/sample.conf
echo 'diff2=20' >> fuchanpin/temp/sample.conf
sleep 1
letfull "fuchanpin/temp/sample.conf"
iisr "! -z $records"

# 3rd
echotest "3rd,really got add2,diff2...?"
echotest "let us clear sources."
records=()
letfull "fuchanpin/temp/sample.conf"
let "maxindex=${#records[@]}-1"
for i in $(seq 0 $maxindex)
do
	# display them
	echo "${records[$i]}"
	echo "ordernum==$ordernum"
done

# home keeping
rm -rf fuchanpin/temp/*
records=()
ordernum=0
