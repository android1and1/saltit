#!/bin/bash
# filename test_base
project_dir=$( cd $( dirname $0 ) && cd ../../ && pwd -P )
. $project_dir/conf/abs.conf

. ${FUNCPATH}/base

huali
iisr "15 -ne 0"
huali
iisl "abc" "abc"
huali
itistime="2015 09 10"
iisl "$itistime" "2015 *"
huali
iisl "$itistime" "2015 09 *"
huali
iisl "$itistime" "2015*10"

