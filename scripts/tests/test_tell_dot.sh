#!/bin/bash
# filename:test_rework_or_exit_whole.sh

# first of first,include abs root(directory) name.
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf

. ${FUNCPATH}/base 2>/dev/null

TEMPD="${ABSROOT}/temp/temp7"
mkdir -p  "$TEMPD"

DEBUG=1

echotest "first test:"
touch  $TEMPD/.token
msg=$(tell_dot token)
iisl "$TEMPD" $msg
huali

echotest "2nd test:"
rm $TEMPD/.token
msg=$(tell_dot token)
iisl "" "$msg"
huali

echotest "3rd test"
touch $TEMPD/.flag
msg=$(tell_dot flag)
iisl "$msg" "$TEMPD"
huali

echotest "4th test"
rm $TEMPD/.flag
msg=$(tell_dot flag)
iisl "$msg" ""

# home keeping
rm -rf $TEMPD

