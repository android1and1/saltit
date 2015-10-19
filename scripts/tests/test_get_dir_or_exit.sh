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

# give a space for testing.
mkdir -p "${ABSROOT}""/temp/else11"

# check if we can believe _help_find().
help_find_result=$( _help_of_find )
echotest "$help_find_result"
huali

# then we real mkdir and its token file:.token
touch  "${ABSROOT}""/temp/else11/token"
help_find_result=$( _help_of_find )
echotest "$help_find_result"
huali

# handle 1+ ways.
mkdir "${ABSROOT}""/temp/else11/else111"
touch  "${ABSROOT}""/temp/else11/else111/token"
help_find_result=$( _help_of_find )
echotest "$help_find_result"
# the output said "no found!",because in testing-func logic
# return "dir1 dir2",will occurs 'Nothing'
huali

# the last test,rm the latest dir,then run func again.
rm  "${ABSROOT}""/temp/else11/else111/token"
help_find_result=$( _help_of_find )
echotest "$help_find_result"

# homekeeping
rm -rf temp/else11




