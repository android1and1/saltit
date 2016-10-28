#!/bin/bash
# filename : test_add2arbi.sh

# first of first,include abs root(directory) name.
# then start 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf

. ${FUNCPATH}/base 2>/dev/null

# include ours
. fuchanpin/functions/base

# 1st
echotest "1st test,invoke add2arbi once."
add2arbi
iisr "$ordernum -eq 1"
iisr "${#records[@]} -eq 1"
huali

# 2nd
echotest "2nd test,invoke add2arbi 12 times,see what\'s output?"
for i in {1..12}
do
	echo '-------  '"$i"'  ---------'
	add2arbi
done

echo -e "\nnow array contents:  \n"
echo "${records[@]}"
iisr "$ordernum -eq 13"
iisr "$ordernum -eq 13"

# 3rd
#echotest "3rd test,a range can reachable?"
#for i in {1..100}
#do
#	item=$(add2arbi)
#	head=$(echo $item | cut -d '+' -f 1)
#	tail=$(echo $item | cut -d '+' -f 2)
#	iisr "$head -le 10 -a $tail -le 10"
#done


# home keeping
records=()
ordernum=()
