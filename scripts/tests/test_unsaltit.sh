#!/bin/bash
# filename test_unsaltit.sh

# first of first,include abs root(directory) name.
# then start the famous 'The Quartet'.
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf
. ${FUNCPATH}/base 2>/dev/null

# disable all debug infomations of each function.
DEBUG=0

TEMPDIR=${ABSROOT}/temp/temp16
mkdir -p $TEMPDIR

echo 'data here .' > $TEMPDIR/a.txt
echo 'b.txt,after some while we will meet again.' > $TEMPDIR/b.txt
echo 'data here baby girl.' > $TEMPDIR/c.txt
touch $TEMPDIR/.token

echo 'a.txt' > $TEMPDIR/.ignores

# create real data file(crypted)
actively
sleep 1

# first test
echotest "1st test,can run at last?"
# because at line no.7 there is a "cd ../../" means we are at working dir:saltit.
./scripts/unsaltit.sh 
iisr "$? -eq 0"

# second test
echotest "2nd test,really got decode_encoded file?"
cat ${ABSROOT}/DE_uploads/*b.txt
iisr "$? -eq 0"

# home keeping
rm -rf $TEMPDIR
rm -rf ${UPLOADS}/*data
rm -rf ${UPLOADS}/.flag
rm -rf ${ABSROOT}/DE_uploads/
