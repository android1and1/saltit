#!/bin/bash
# filename test_get_dir_or_exit.sh

# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# then include function get_dir_or_exit() & its help_XXX
. ${FUNCPATH}/get_dir_or_exit.sh

#global var: WORKINGDIR
WORKINGDIR='no_yet_now'

mkdir -p ${ABSROOT}/ddk1/
mkdir -p ${ABSROOT}/ddk2/
touch ${ABSROOT}/ddk1/.token
touch ${ABSROOT}/ddk2/token
#	_help_of_find
get_dir_or_exit
huali
echotest "$WORKINGDIR"

#clean
rm -rf ${ABSROOT}/ddk1/
rm -rf ${ABSROOT}/ddk2/
unset WORKINGDIR
