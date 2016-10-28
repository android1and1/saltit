#!/bin/bash
# filename:

project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# first
echotest "1st:no '.token' file exists."
echotest "$( help_find_dot_token )"
huali

# mkdir
echotest "2nd:touch a 'token' file and a 'hasprefixtoken' file."
mkdir -p ${ABSROOT}/temp/temp11/
touch ${ABSROOT}/temp/temp11/hasprefixtoken
touch ${ABSROOT}/temp/temp11/token
echotest "$( help_find_dot_token )"
huali

rm ${ABSROOT}/temp/temp11/token
echotest "3th:has a '.token' file, and its directory."
touch ${ABSROOT}/temp/temp11/.token
echotest "$( help_find_dot_token )"
huali

echotest "All of 2 dirs has .token."
# parent dir has .done,its sun dir has no .done but a .token.
TEMPDIR=${ABSROOT}/temp/temp12
mkdir -p $TEMPDIR/sundir/
touch $TEMPDIR/.done
touch $TEMPDIR/sundir/{a,b,c,d}.text
touch $TEMPDIR/sundir/.token
# because temp11/ and temp12/ both of all has '.token',the func will found 2,then return error status code.
# stdout will tell us "No Way".
echotest "$(help_find_dot_token)"
huali

echotest "rm temp11\'s .token,keep temp12\'s .token,then run."
rm ${ABSROOT}/temp/temp11/.token
echotest "$(help_find_dot_token)"

# HOMEKEEPING!
rm -rf ${ABSROOT}/temp/temp11/
rm -rf ${ABSROOT}/temp/temp12/

