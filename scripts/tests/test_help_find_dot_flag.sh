#!/bin/bash
# filename:test_help_find_dot_deen.sh

project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# first
echotest "1st:no '.deen' file exists."
echotest "$( help_find_dot_deen )"
huali

# mkdir
echotest "2nd:touch a 'deen' file and a 'hasprefixdeen' file."
mkdir -p ${ABSROOT}/temp/temp11/
touch ${ABSROOT}/temp/temp11/hasprefixdeen
touch ${ABSROOT}/temp/temp11/deen
echotest "$( help_find_dot_deen )"
huali

rm ${ABSROOT}/temp/temp11/deen
echotest "3th:has a '.deen' file, and its directory."
touch ${ABSROOT}/temp/temp11/.deen
echotest "$( help_find_dot_deen )"
huali

echotest "All of 2 dirs has .deen."
# parent dir has .done,its sun dir has no .done but a .deen.
TEMPDIR=${ABSROOT}/temp/temp12
mkdir -p $TEMPDIR/sundir/
touch $TEMPDIR/.done
touch $TEMPDIR/sundir/{a,b,c,d}.text
touch $TEMPDIR/sundir/.deen
# because temp11/ and temp12/ both of all has '.deen',the func will found 2,then return error status code.
# stdout will tell us "No Way".
echotest "$(help_find_dot_deen)"
huali

echotest "rm temp11\'s .deen,keep temp12\'s .deen,then run."
rm ${ABSROOT}/temp/temp11/.deen
echotest "$(help_find_dot_deen)"

# HOMEKEEPING!
rm -rf ${ABSROOT}/temp/temp11/
rm -rf ${ABSROOT}/temp/temp12/

