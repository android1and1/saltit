#!/bin/bash
# filename 'scripts/tests/test_checkenv.sh'

# the famous quartet.
project_dir=$( cd $( dirname $0 ) && cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base

# give a test-fit env
mkdir -p $ABSROOT/temp/temp22/
echotest "1st test:an ordinary dir,no .done,no .token."
checkvalidor $ABSROOT/temp/temp22
iisr "$? -eq 3"
huali

# 2nd test
echotest "2nd test:has a .token."
touch $ABSROOT/temp/temp22/.token
checkvalidor $ABSROOT/temp/temp22/
iisr "$? -eq 0"
huali


# 3nd test
echotest "3nd test:has a .token and a .done."
touch $ABSROOT/temp/temp22/.done
checkvalidor $ABSROOT/temp/temp22
iisr "$? -eq 1"
huali

# do home-keeping
rm -rf $ABSROOT/temp/*
