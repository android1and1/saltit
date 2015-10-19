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

# mk a temporary directory,see tell us what?
mkdir -p ${ABSROOT}/ddk1/
touch ${ABSROOT}/ddk1/.token

# check _help_of_find () ,if works rightly.
something=$(_help_of_find)

sleep 1
# do cleanning
rm ${ABSROOT}/ddk1 -rf

if [ -z $something ];then
	echotest "Nothing can tell you."
else
	echotest "$something"
fi

huali

mkdir -p ${ABSROOT}/ddk2/
mkdir -p ${ABSROOT}/ddk3/
touch ${ABSROOT}/ddk2/.token
touch ${ABSROOT}/ddk3/token
#	_help_of_find
# run _help_of_find again.
get_dir_or_exit
echotest "$WORKINGDIR"

#do some home cleaning
rm -rf ${ABSROOT}/ddk{2,3}/
unset WORKINGDIR
