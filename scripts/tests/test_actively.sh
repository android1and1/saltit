#!/bin/bash
# filename:test_actively.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# disable all debug infomations of each function.
DEBUG=0
TEMPDIR=${ABSROOT}/temp/temp13
mkdir -p "$TEMPDIR"
touch $TEMPDIR/.token
echo 'data here..' > $TEMPDIR/a.file
echo 'data here..' > $TEMPDIR/b.file
echo 'data here..' > $TEMPDIR/c.file
echo 'data here..' > $TEMPDIR/d.file
echo 'a.file' > $TEMPDIR/.ignores  # only fool here,NOT "ignore" but "ignores"
need_uploads=$(upload_all_except_ignores $TEMPDIR)
iisl "$need_uploads" "*c.file*"
huali

actively
echo ${SIMPLE_PASSWORD} | grep --quiet $usepass
iisr "$? -eq 0"
huali

# 2nd test
echotest "2nd test.if got expected file(s)?"
ls ${UPLOADS}
sleep 1

ls ${UPLOADS}/*data | grep --silent "encoded_a.file.data"
# because 'a.file' be ignored,so below use "-ne 0".
iisr "$? -ne 0"

ls ${UPLOADS}/*data | grep --silent "encoded_b.file.data"
iisr "$? -eq 0"
huali

# 3rd test
echotest "3rd test.after executing,remains a '.done'?"
ls $TEMPDIR/.done
iisr "$? -eq 0"

cp ${FUNCPATH}/abigfile $TEMPDIR/

#remove .done file
rm $TEMPDIR/.done
#run again!
actively
#iisr "$? -eq 0"
# see see uploads/
ls -RF $TEMPDIR
ls -RF $UPLOADS
sleep 10

# home keeping
rm -rf $TEMPDIR
rm -rf ${UPLOADS}/*data
rm -rf ${UPLOADS}/*flag
