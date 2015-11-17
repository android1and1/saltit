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

# first test.
echotest "the 1st test:has a '.token' file  and has not '.done' file."
mkdir -p ${ABSROOT}/temp/temp11/
touch  ${ABSROOT}/temp/temp11/.token
echo 'Data-a' >  ${ABSROOT}/temp/temp11/a
echo 'Data-b' >  ${ABSROOT}/temp/temp11/b
echo 'c' >  ${ABSROOT}/temp/temp11/c
echo 'd' >  ${ABSROOT}/temp/temp11/d
echo 'a'>>${ABSROOT}/temp/temp11/.ignores
echo -e 'b\nc' >> ${ABSROOT}/temp/temp11/.ignores
echotest "$( actively )"
huali

#the 2nd test
echotest "the 2nd test: has a .token file (the 'done' file has removed)."
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
huali

# the 3rd test
echotest "the 3rd test:can usepass be a odd name?"
if [ -f "${ABSROOT}/temp/temp11/.done" ];then
	rm "${ABSROOT}/temp/temp11/.done"
fi
# invoing!
actively
# successfully?
iisr "$? -eq 0"
# usepass now=?
echotest "\$usepass==$usepass"
echo $SIMPLE_PASSWORD | grep --silent "$usepass"
iisr "$? -eq 0"

#house keeping
rm -rf ${ABSROOT}/temp/temp11/
find ${UPLOADS} -type f -name "encoded*data" -exec rm {} \;
