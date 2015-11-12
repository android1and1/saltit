#!/bin/bash
# filename 'scripts/tests/test_salteach.sh'

# the famous quartet.
project_dir=$( cd $( dirname $0 ) && cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base

# first test 
# if uploading dir exists?
echotest "1st test ."
test -d $UPLOADS && echotest "directory 'uploads' exists!"
test ! -d $UPLOADS && echotest "directory 'uploads' NOT exists!"
huali

# 2nd test
echotest "2nd test : if func done its task."
echo 'just something.' > ${UPLOADS}/live1
salteach "${UPLOADS}/live1" "00"
iisr "$? -eq 0"
huali


# 3nd test
echotest "3nd test : check filename,correctly?" 
filename="$( ls $UPLOADS/*data )"
if [[ "$filename" == *"live1.data" ]]
then
	echo "::TRUE:: ""$filename""==""*live1.data"
else
	echo "::ERROR:: ""$filename""==""*live1.data"
fi

# 4nd test
#echotest "4th test: transfer code to function:splitXXX,if file too big."
# use scripts/functions/abigfile
#salteach "${FUNCPATH}/abigfile" "00"




# do some house keeping
rm -rf ${UPLOADS}/*
