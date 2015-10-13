#!/bin/bash
# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null
. ${FUNCPATH}/split_if_ness.sh

TESTDIR="${FUNCPATH}/temp"
mkdir -p $TESTDIR
split_if_ness ${cur_dir}/scripts/functions/abigfile ${TESTDIR}
# do house keeping.
rm -rf $TESTDIR
echo 'removed test data(s).'
