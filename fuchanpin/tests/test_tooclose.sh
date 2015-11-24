#!/bin/bash
# filename : test_tooclose.sh

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
for i in {0..7}
do
	let records[$i]=$i+1
done

# 1st test
echotest "1 test:func can find too close fact?"
tooclose "4"  
iisr "$? -eq 0"
echotest "return 0 MEANS 4 is an element of this array,and  range is fit."
huali

# 2nd test
echotest "2test : func will mistake when some else be include?"
tooclose '89'
iisr "$? -eq 1"
huali

# 3rd test
echotest "3rd test:peer a small array,lt 9"
tooclose 3
iisr "$? -eq 0"
huali

# 4th test
echotest "4th test:while array is big."
for i in {8..99}
do 
	let records[$i]=$i+1
done
# now records's length=100
tooclose 4
iisr "$? -eq 1"
huali

# 5th test
echotest "5th test:"
tooclose 94
iisr "$? -eq 0"
huali

# 6th test 
echotest "6th test,a 12-length array"
for i in {12..99}
do
	unset records[$i]
done
#echo ${records[@]}

tooclose 7
iisr "$? -eq 0"

# home keeping
records=()
