#!/bin/bash
# the famous 'The Quartet'.
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf
. ${FUNCPATH}/base 2>/dev/null

DEBUG=0

KEEPDIR=${ABSROOT}/temp/temp_keep
mkdir -p $KEEPDIR
bigfile=${ABSROOT}/scripts/functions/abigfile
test -f $bigfile
iisr "$? -eq 0"
if test "$(tellsize $bigfile)" = "more"
then
	echotest 'meet a big file.'
else
	echotest 'no bigger than expected.'
	exit 2
fi
split_if_ness ${ABSROOT}/scripts/functions/abigfile ${KEEPDIR}
iisr "$? -eq 0"

# 2nd
echotest "2nd test,splitted-files amount,name-mode."
find ${KEEPDIR} -type f | grep --quiet "abigfile"
iisr "$? -eq 0"
find ${KEEPDIR} -type f | grep --quiet "nobigfile"
iisr "$? -ne 0"
counts=$(find ${KEEPDIR} -type f | wc -l)
iisr "$counts -eq 4"

# 3nd
echotest "3nd test,use UPLOADS dir,default one."
split_if_ness ${ABSROOT}/scripts/functions/abigfile ${UPLOADS}
count3=$(find ${UPLOADS} -type f -name "abigfile*" | wc -l)
iisr "$count3 -eq 4"

# do house keeping.
rm -rf $KEEPDIR
rm -rf $UPLOADS/abigfile*
