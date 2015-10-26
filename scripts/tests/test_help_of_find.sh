#!/bin/bash
# filename:

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null
# first
echotest "first:no token or .token file exists."
echotest "$( help_of_find )"
huali

# mkdir
echotest "second:has a .token and its directory."
mkdir -p ${ABSROOT}/temp/temp11/
touch ${ABSROOT}/temp/temp11/.token
echotest "$( help_of_find )"
huali

# last test
rm ${ABSROOT}/temp/temp11/.token
echotest "second:has a token, and its directory."
touch ${ABSROOT}/temp/temp11/token
echotest "$( help_of_find )"
# HOMEKEEPING!
rm -rf ${ABSROOT}/temp/temp11
