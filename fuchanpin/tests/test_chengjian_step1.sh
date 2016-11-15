#!/bin/bash
# filename : test_chengjian_step1.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf

. ${FUNCPATH}/base 2>/dev/null

# include ours
. fuchanpin/functions/base

# curent directory is "saltit/"
LEVEL=1


# 1st test
echotest "1 test:func can be found?"
chengjian_step1
#iisr "${#records[@]} == 1"
iisr "$? == 0"
huali

# 2nd test
echotest "2 test:func make expression"
# now has 2 records.
chengjian_step1
iisr "${#records[@]} == 2"
huali

# 3rd
echotest "3 test:more sample,let us see difference order,i means substraction and multiplication symbol."
# // why 2*3>16??
for i in {1..11}
do
	chengjian_step1
done
huali

# 4th
echotest "4 test:if letfull() know it?"
records=()
ordernum=()
declare tempdir='temp/mytemp'
declare tempfile="$tempdir""/""sample_7.conf"
mkdir -p $tempdir
echo chengjian_step1=7 > $tempfile
letfull $tempfile
iisr "${#records[@]} == 7"
huali

# 5th
echotest "5th test:what those expressions like?show to me."
for i in ${records[@]}
do
	echo $i
done
huali

# 6th
echotest "6th test:if interaction func can handle '*' symbol to 'x' ?"
cp $tempfile $ABSROOT"/fuchanpin/"
bash fuchanpin/functions/interaction 7


# home-keep 
records=()
ordernum=()
rm -rf $ABSROOT"/fuchanpin/sample_7.conf"
rm -rf $tempdir
unset temdir
unset tempfile
