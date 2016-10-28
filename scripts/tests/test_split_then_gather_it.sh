#!/bin/bash
# filename test_split_then_gather_it.sh

# first of first,include abs root(directory) name.
# then start the famous 'The Quartet'.
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf
. ${FUNCPATH}/base 2>/dev/null

# disable all debug infomations of each function.
DEBUG=0
TEMPDIR=${ABSROOT}/temp/temp17
mkdir -p $TEMPDIR
# gather pics and tokens.
cp -pa  ~/Documents/yousee/post2/gap/  ${TEMPDIR}

./scripts/unsaltit

# test some presumes.
# 1st test.
echotest ":1: now has a new dir,named DE_temp17,under the directory:temp."
ls  -AF ${ABSROOT}/temp/ | grep --quiet "DE_temp17" 
iisr "$? -eq 0"

# 2nd test.
echotest ":2: gather pieces into one pic data,show it."
# function:gather() will compose each piece into one image-file.
gather "cannon"


# home keeping
sleep 1
rm -rf $TEMPDIR
rm -rf ${ABSROOT}/temp/DE_temp17/
