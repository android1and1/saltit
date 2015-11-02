#!/bin/bash
# filename:test_upload_all_except_ignores.sh

# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf

. ${FUNCPATH}/base 2>/dev/null
	
# first ,client(programer) forgot append the dir-argument
echotest "hi"
upload_all_except_ignores

# it will return and show why it failure
# try again.
huali

# second time,client forgot the real path name,he input
# a no exists directory.
upload_all_except_ignores ${ABSROOT}/temp/nothisdir 

# and it failure.try again
huali

# make a temprary dir
TEMPD="$ABSROOT""/uploads"
mkdir -p "$TEMPD"	
touch "$TEMPD""/"{a,b,c,d,A,B,C,D}.txt
touch "$TEMPD"/.ignores 
echo "a.txt A.txt" > "$TEMPD""/.ignores"
 
# real test...
upload_all_except_ignores "$TEMPD"

# invoke the function again,see if it will work(we hope it no).
# huali not rember
huali
upload_all_except_ignores "$TEMPD"

# yes,it not work again,but if we remove the ./.done?
# not forget 'huali'
huali
rm "$TEMPD""/.done"
upload_all_except_ignores "$TEMPD"

 
sleep 4 
# do homekeeping
rm -rf "$TEMPD"
