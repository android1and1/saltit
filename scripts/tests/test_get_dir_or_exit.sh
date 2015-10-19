#!/bin/bash
# filename test_get_dir_or_exit.sh
# refact at 2015 10 19
# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# then include function get_dir_or_exit() & its help_XXX
. ${FUNCPATH}/get_dir_or_exit.sh

#global var: WORKINGDIR
WORKINGDIR='no_yet_now'

