#!/bin/bash
# filename:test_offsalteach.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null
#DEBUG=0

# first test
echotest "first test:share/ exists?"
# token file lives in share/okaies/ directory,its name like:
# encoded_okay_0
iisr "-d ${SHARE_D}"
huali

# second test
echotest "second test:done?"

# use '21' simple password as origin,encryed a file(just a word:i love you?)
# then give func:offeach as $2.

salteach ${ABSROOT}/conf/abs.conf '21'
# if above line successfully,then,the $UPLOADS has a new file(data).
# its name will be "${UPLOADS}/encoded_abs.conf.data"(details will displays in 'scripts/function/salteach.sh'
sleep 1

offsalteach "${SHARE_D}/okaies/encoded_okay_21" ${UPLOADS}/encoded_abs.conf.data
iisr "$? -eq 0"
# offsalt,the file name will be decoded_encoced_abs.conf
iisr "-f ${DOWNLOADS}/decoded_encoded_abs.conf"

# stay a while for looking for.
# at last ,do home keeping.
ls ${DOWNLOADS}
sleep 1
find ${UPLOADS} -type f -name "encoded*data" -exec rm {} \;
rm -rf ${DOWNLOADS}/*

