#!/bin/bash
# filename 'scripts/tests/test_checkvalidor.sh'

# the famous quartet.
project_dir=$( cd $( dirname $0 ) && cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base
DEBUG=0

# function:checkvalidor,will return 1 of 4:
# return 30 -- $1(directory) not exists.
# return 20 -- $1 has a .done token.
# return 15 -- $1 has not a .token token. 
# return 10 -- $1 has not real file(waitting_for_encry). 

# give a test-fit env
TEMPD="$ABSROOT/temp/temp22/"
mkdir -p $TEMPD

echotest "1st test start."
# a not real dirname for "$1"
checkvalidor /home/nothisdir/
iisr "$? -ne 30"
checkvalidor "$TEMPD" 
iisr "$? -eq 15"

huali

# 2nd test
echotest "2nd test:has a .token."
touch "$TEMPD""/.token"
checkvalidor "$TEMPD" 
iisr "$? -eq 10"
huali


# 3nd test
echotest "3nd test:has a .token and a .done."
touch $TEMPD/.done
checkvalidor $TEMPD 
iisr "$? -eq 20"

huali

# 4th test
echotest "4th test:almost all satisfy:has .token,not have .done"
rm $TEMPD/.done
checkvalidor $TEMPD 
iisr "$? -eq 10"

huali

# 5th test 
echotest "5th test:all satisfy:has .token,not have .done,has real files."
touch $TEMPD/{a,b,c}.txt
touch $TEMPD/.ignores
checkvalidor $TEMPD
iisr "$? -eq 0"

# do home-keeping
rm -rf $ABSROOT/temp/*
