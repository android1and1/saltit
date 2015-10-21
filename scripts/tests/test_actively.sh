#!/bin/bash
# filename:test_actively.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

step=1
mkdir -p ${ABSROOT}/temp/temp11/
touch  ${ABSROOT}/temp/temp11/.token
touch ${ABSROOT}/temp/temp11/done
echotest "$( actively )"
huali

#next test
rm ${ABSROOT}/temp/temp11/done
echotest "$(actively)"
huali

# last test
rm  ${ABSROOT}/temp/temp11/.token
echotest "$(actively)"


#house keeping
rm -rf ${ABSROOT}/temp/temp11/
