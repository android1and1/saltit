#!/bin/bash
# filename test_zookeeper.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# disable all debug infomations of each function.
DEBUG=0
TEMPDIR=${ABSROOT}/temp/temp14
mkdir -p $TEMPDIR
echo 'data here .' > $TEMPDIR/a.txt
echo 'data here .' > $TEMPDIR/b.txt
echo 'data here .' > $TEMPDIR/c.txt
echo 'data here .' > $TEMPDIR/d.txt
echo 'data here .' > $TEMPDIR/e.txt
touch $TEMPDIR/.token
echo 'a.txt' > $TEMPDIR/.ignores
# create real data file(crypted)
actively
#ls ${UPLOADS}
#sleep 1
# see some lines
#cat ${UPLOADS}/encoded_c.txt.data

zookeeper $UPLOADS
iisr "$? -eq 0"
#filelists=$(ls $DOWNLOADS)
#echotest "$filelists"
# see some lines
tail ${DOWNLOADS}/deco*
huali

#echotest "2nd test..."


# home keeping
sleep 1
rm -rf $UPLOADS/*data
rm -rf $UPLOADS/this.flag
rm -rf $DOWNLOADS/decoded_*
rm -rf $TEMPDIR
