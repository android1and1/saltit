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
TEMPDIR=${ABSROOT}/temp/temp13
mkdir -p $TEMPDIR
echo 'data here..' > $TEMPDIR/a.file
echo 'data here..' > $TEMPDIR/b.file
echo 'data here..' > $TEMPDIR/c.file
echo 'data here..' > $TEMPDIR/d.file
echo 'a.file' > $TEMPDIR/.ignore

touch $TEMPDIR/.token
actively
echo ${SIMPLE_PASSWORD} | grep --quiet $usepass
iisr "$? -eq 0"
# home keeping
rm -rf $TEMPDIR
rm -rf ${UPLOADS}/*data
rm -rf ${UPLOADS}/*flag
