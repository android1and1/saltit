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

# 3rd test(real test)
echotest "3rd test:real files,has .token,no .done"
# make a temprary dir
TEMPD="$ABSROOT""/iwantupload"
mkdir -p "$TEMPD"	
touch "$TEMPD""/.token"
touch "$TEMPD""/"{a,b,c,d,A,B,C,D}.txt
touch "$TEMPD"/.ignores 
echo "a.txt A.txt" > "$TEMPD""/.ignores"
upload_all_except_ignores "$TEMPD"
huali

# the 4th test
echotest "the 4th test:last test leave a .done token file,so,func:checkvalidor will says it not a good dir."
checkvalidor "$TEMPD"
iisr "$? -eq 20"
# yes,it not work again,but if we remove the ./.done?
rm "$TEMPD"/.done
checkvalidor "$TEMPD"
iisr "$? -eq 0"
# not forget 'huali'
huali

# the 5th test
echotest "the '5TH TEST',remove .done,then invoke again(will work)."
echo ''>"$TEMPD""/.ignores"

# check filelist each name contains whole path,or not?
upresults=$( upload_all_except_ignores "$TEMPD")
echotest "\$upresults==${upresults}"

# 6th test 
#echotest "the 6th test,output whole path."
# rm "$TEMPD""/.done"
# upload_all_except_ignores "$TEMP"

# do homekeeping
rm -rf "$TEMPD"
