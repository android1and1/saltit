#!/bin/bash
# filename:test_tellsize.sh

# the famous 'Quartet Limited'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. $project_dir/conf/options.conf
. ${FUNCPATH}/base 2>/dev/null

# 1st test
echotest "1st test,give a big file as \$1"
thesize="$(tellsize ${FUNCPATH}/abigfile)"
#test "$thesize" = "more" && echo "::TRUE:: ""${thesize}=""more" || echo "::ERROR:: ""${thesize}=""more"
iisr "'$thesize' = 'more'"
huali

# 2nd test
echotest "2nd test,give a small file as \$1"
thesize="$(tellsize ${FUNCPATH}/checkvolidor.sh)"
#test "$thesize" = "less" && echo "::TRUE:: ""${thesize}=""less" || echo "::ERROR:: ""${thesize}=""less"
iisr "'$thesize' = 'less'"
huali

# 3nd test
echotest "3nd test,for link type."
ln -s ${FUNCPATH}/abigfile ${FUNCPATH}/link_to_abigfile
thesize="$(tellsize ${FUNCPATH}/link_to_abigfile)"
#test "$thesize" = "more" && echo "::TRUE:: ""${thesize}=""more" || echo "::ERROR:: ""${thesize}=""more"
iisr "'$thesize' = 'less'"

# home keeping
rm -rf ${FUNCPATH}/link_to_abigfile
