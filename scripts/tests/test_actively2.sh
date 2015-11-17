#!/bin/bash
# filename:test_actively2.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# disable all debug infomations of each function.
DEBUG=0
tempdir=${ABSROOT}/temp/temp12
mkdir -p $tempdir
echo 'data here..' > $tempdir/a.file
echo 'data here..' > $tempdir/b.file
echo 'data here..' > $tempdir/c.file
echo 'data here..' > $tempdir/d.file
echo 'a.file' > $tempdir/.ignore

touch $tempdir/.token
actively
echo ${SIMPLE_PASSWORD} | grep --quiet $usepass
iisr "$? -eq 0"
# home keeping
rm -rf $tempdir
rm -rf ${UPLOADS}/*data
