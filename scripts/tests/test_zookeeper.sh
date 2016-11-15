#!/bin/bash
# filename test_zookeeper.sh

# first of first,include abs root(directory) name.
# then start the famous 'The Quartet'.
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf
. ${FUNCPATH}/base 2>/dev/null

# disable all debug infomations of each function.
DEBUG=0
TEMPDIR=${ABSROOT}/temp/temp14
mkdir -p $TEMPDIR
echo 'data here .' > $TEMPDIR/a.txt
echo 'data here baby.' > $TEMPDIR/b.txt
echo 'data here baby girl.' > $TEMPDIR/c.txt
touch $TEMPDIR/.token
echo 'a.txt' > $TEMPDIR/.ignores
# create real data file(crypted)
actively
willbehere="${ABSROOT}/DE_uploads"
zookeeper $UPLOADS
ls  $willbehere | grep --quiet "decoded_encoded_c.txt"
iisr "$? -eq 0"
cat $willbehere/decoded_encoded_c.txt 

# home keeping
sleep 1
rm -rf $UPLOADS/*data
rm -rf $UPLOADS/.flag
rm -rf $willbehere
rm -rf $TEMPDIR
