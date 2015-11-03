#!/bin/bash
# filename:test_actively.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# first test,if it has no global variable 'passengers' yet,function will fastly return a warning msg.
step=1
DEBUG=0

echotest "the first test started."
echotest "$( actively )"
huali

# but still has warnning.
mkdir -p ${ABSROOT}/temp/temp11/
touch  ${ABSROOT}/temp/temp11/.token
touch  ${ABSROOT}/temp/temp11/a
touch  ${ABSROOT}/temp/temp11/b
touch  ${ABSROOT}/temp/temp11/c
touch  ${ABSROOT}/temp/temp11/.ignores
touch  ${ABSROOT}/temp/temp11/d
echo 'a b'>>${ABSROOT}/temp/temp11/.ignores
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
# invoking now!
actively
# must choice 1
iisr "$? -eq 1000"
huali

#house keeping
rm -rf ${ABSROOT}/temp/temp11/

echotest "Test Done."
