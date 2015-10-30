#!/bin/bash
# filename test_base
project_dir=$( cd $( dirname $0 ) && cd ../../ && pwd -P )
. $project_dir/conf/abs.conf

. ${FUNCPATH}/base

huali
iisr "$? -eq 0"
huali

