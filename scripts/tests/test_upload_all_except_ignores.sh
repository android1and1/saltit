#!/bin/bash
# filename:test_upload_all_except_ignores.sh

# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"

project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf

. ${FUNCPATH}/base 2>/dev/null

# disable each func's debug info.
DEBUG=0
	
# a no exists directory.
echotest "1st test:give a no-exists dir name."
upload_all_except_ignores ${ABSROOT}/temp/nothisdir 
# and it failure.try again
huali

echotest "2nd test:real files,has .token,no .done"
# make a temprary dir
TEMPD="$ABSROOT""/temp/iwantupload"
mkdir -p "$TEMPD"	
touch "$TEMPD""/.token"
touch $TEMPD/file{1,2,3,4,5,6,7,8}.txt
touch "$TEMPD"/.ignores 
result_files=$(upload_all_except_ignores $TEMPD)
iisl "$result_files" "*file7.txt*" 
huali

# see if can exclude .ignores
echotest "3rd test:can ignore files?"
echo 'file1.txt file3.txt file5.txt file7.txt' > $TEMPD/.ignores
result_files=$(upload_all_except_ignores $TEMPD)
iisl "$result_files" "*file8.txt*" 
huali

echotest "4th test:clip more files,then see what is be ignored."
echo 'file2.txt file4.txt file8.txt' >> $TEMPD/.ignores
result_files=$(upload_all_except_ignores $TEMPD)
iisl "$result_files" "*file6.txt*" 
huali

echotest "5th test:what about .prefix files?"
echo '' > $TEMPD/.ignores
touch $TEMPD/.aline
result_files=$(upload_all_except_ignores $TEMPD)
echo ${result_files} | grep --silent ".aline"
iisr "$? -eq 1"
huali

# do homekeeping
rm -rf "$TEMPD"
