#!/bin/bash
# filename:test_upload_all_except_ignores.sh

# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"
cur_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $cur_dir/conf/abs.conf

. ${FUNCPATH}/base 2>/dev/null
. ${FUNCPATH}/upload_all_except_ignores.sh 2>/dev/null
	
# first ,client(programer) forgot append the dir-argument
upload_all_except_ignores

# it will return and show why it failure
# try again.
huali

# second time,client forgot the real path name,he input
# a no exists directory.
upload_all_except_ignores /home/pi/nothisdirectory/

# and it failure.try again
huali

# make a temprary dir
#TEMPD="/home/pi/Workspace/saltit/uploads"
TEMPD=`dirname ${FUNCPATH}`/uploads
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

# yes,it not work again,but if we remove the ./done?
# not forget 'huali'
huali
rm "$TEMPD""/done"
upload_all_except_ignores "$TEMPD"

 
sleep 4 
# do homekeeping
rm -rf "$TEMPD"
