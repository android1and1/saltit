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

echotest "the first test started."
echotest "$( actively )"
huali

# check env var:UPLOADS
#echotest "\$UPLOADS==$UPLOADS"
#exit

# but still has warnning.
mkdir -p ${ABSROOT}/temp/temp11/
touch  ${ABSROOT}/temp/temp11/.token
echo 'Data-a' >  ${ABSROOT}/temp/temp11/a
echo 'Data-b' >  ${ABSROOT}/temp/temp11/b
echo 'c' >  ${ABSROOT}/temp/temp11/c
echo 'd' >  ${ABSROOT}/temp/temp11/d
echo 'a'>>${ABSROOT}/temp/temp11/.ignores
echo -e 'b\nc' >> ${ABSROOT}/temp/temp11/.ignores
touch ${ABSROOT}/temp/temp11/.done
echotest "the second test:has a '.token' file  and a '.done' file."
echotest "$( actively )"
huali

#the 3rd test
rm ${ABSROOT}/temp/temp11/.done
echotest "the third test: has a .token file (the 'done' file has removed)."
echotest "$(actively)"
huali

# the 4th test
echotest "the 4th test: has None(no '.done',no '.token')."
rm  ${ABSROOT}/temp/temp11/.token
echotest "$(actively)"
huali

# the 5th test
echotest "the 5th test:when choice order 1,will display invoking function\'s name."
touch  ${ABSROOT}/temp/temp11/.token
if [ -f "${ABSROOT}/temp/temp11/.done" ];then
	rm "${ABSROOT}/temp/temp11/.done"
fi
echo "c" > ${ABSROOT}/temp/temp11/.ignores
# invoking now! (must choice 1)
actively
# successfully?
iisr "$? -eq 0"
# has result file(s)?
set $( ls ${UPLOADS}/encoded_*data )
# {a,b,c,d}.txt and c.txt in '.ignores'.
iisr "$# -eq 3"

#house keeping
rm -rf ${ABSROOT}/temp/temp11/
find ${UPLOADS} -type f -name "encoded*data" -exec rm {} \;
