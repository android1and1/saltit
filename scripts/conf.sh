#!/bin/bash
### conf.sh : "configuration file of package:saltit(salt it)"
###
###
# run 'saltit --refresh' will using new conf (override old one)

# Root of all
curdir=$(cd $(dirname $0) && pwd -P)
export SALTIT_ROOT=$( dirname ${curdir})

#model of all
export MODEL_DIR="${SALTIT_ROOT}/share/md5s"


# SIMPLE_PASS's length should less than 3
export SIMPLE_PASS="0 00 01 02 03 1 2 3 11 22 33 12 21 13 31 23 32"

# PACKAGE = encoded package's name(after run saltit script)
# format %L is constant str:'L'
# format %y%m%d means 'year' 'month' 'day',all digit.
export PACKAGE_POSTFIX="%L%y%m%d"
# show status for invoker(s).
export SUCCESS="INIT SUCCESSFULLY"
# clean works.
unset curdir
