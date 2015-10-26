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
echotest "the first test started."
echotest "$( actively )"
huali

# but still has warnning.
mkdir -p ${ABSROOT}/temp/temp11/
touch  ${ABSROOT}/temp/temp11/.token
touch ${ABSROOT}/temp/temp11/done
echotest "the second test:has .token and done."
echotest "$( actively )"
huali

#next test
rm ${ABSROOT}/temp/temp11/done
echotest "the third test: has .token(file -- 'done' remove)."
echotest "$(actively)"
huali

# last test
rm  ${ABSROOT}/temp/temp11/.token
echotest "the fourth test :has None(no 'done',no '.token')."
echotest "$(actively)"


#house keeping
rm -rf ${ABSROOT}/temp/temp11/
echotest "Test Done."
