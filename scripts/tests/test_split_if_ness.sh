#!/bin/bash
# the famous 'quartet'.
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

TESTDIR="${FUNCPATH}/temp"
mkdir -p $TESTDIR
split_if_ness ${ABSROOT}/scripts/functions/abigfile ${TESTDIR}

# do house keeping.
rm -rf $TESTDIR
echotest 'removed test data(s).'
