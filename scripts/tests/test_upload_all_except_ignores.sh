#!/bin/bash
# filename:test_upload_all_except_ignores.sh

# first of first,include abs root(directory) name.
# get a global variable -- "FUNCPATH"

project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf

. ${FUNCPATH}/base 2>/dev/null

# disable each func's debug info.
DEBUG=0
	
# first ,client(programer) forgot append the dir-argument
echotest "1st test,forget \$1 argument."
upload_all_except_ignores

# it will return and show why it failure
# try again.
huali

# second time,client forgot the real path name,he input
# a no exists directory.
echotest "2nd test:give a no-exists dir name."
upload_all_except_ignores ${ABSROOT}/temp/nothisdir 

# and it failure.try again
huali

# make a temprary dir
TEMPD="$ABSROOT""/uploads"
mkdir -p "$TEMPD"	
touch "$TEMPD""/.token"
touch "$TEMPD""/"{a,b,c,d,A,B,C,D}.txt
touch "$TEMPD"/.ignores 
echo "a.txt A.txt" > "$TEMPD""/.ignores"
 
# real test...

echotest "3rd test:real files,has .token,no .done"
upload_all_except_ignores "$TEMPD"

huali

#because the 3rd test pass,means:at last func will append a '.done' to the directory,
# so invoke func:upload_all_except_ignores will failure by checkout a '.done' token file.
# the 4th test
echotest "the 4th test:because last test leave a .done token file,this time will lost."
upload_all_except_ignores "$TEMPD"

# yes,it not work again,but if we remove the ./.done?
# not forget 'huali'
huali

# the 5th test
echotest "the 5th test,remove .done,then invoke again(will work)."
rm "$TEMPD""/.done"
upload_all_except_ignores "$TEMPD"
 
# do homekeeping
rm -rf "$TEMPD"
