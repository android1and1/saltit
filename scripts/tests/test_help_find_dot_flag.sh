#!/bin/bash
# filename:test_help_find_dot_flag.sh

project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# first
echotest "1st:no '.flag' file exists."
echotest "$( help_find_dot_flag )"
huali

# mkdir
echotest "2nd:touch a 'flag' file and a 'hasprefixflag' file."
mkdir -p ${ABSROOT}/temp/temp11/
touch ${ABSROOT}/temp/temp11/hasprefixflag
touch ${ABSROOT}/temp/temp11/flag
echotest "$( help_find_dot_flag )"
huali

rm ${ABSROOT}/temp/temp11/flag
echotest "3th:has a '.flag' file, and its directory."
touch ${ABSROOT}/temp/temp11/.flag
echotest "$( help_find_dot_flag )"
huali

echotest "All of 2 dirs has .flag."
# parent dir has .done,its sun dir has no .done but a .flag.
TEMPDIR=${ABSROOT}/temp/temp12
mkdir -p $TEMPDIR/sundir/
touch $TEMPDIR/.done
touch $TEMPDIR/sundir/{a,b,c,d}.text
touch $TEMPDIR/sundir/.flag
# because temp11/ and temp12/ both of all has '.flag',the func will found 2,then return error status code.
# stdout will tell us "No Way".
echotest "$(help_find_dot_flag)"
huali

echotest "rm temp11\'s .flag,keep temp12\'s .flag,then run."
rm ${ABSROOT}/temp/temp11/.flag
echotest "$(help_find_dot_flag)"

# HOMEKEEPING!
rm -rf ${ABSROOT}/temp/temp11/
rm -rf ${ABSROOT}/temp/temp12/

