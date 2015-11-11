#!/bin/bash
# filename:test_guess.sh
# test function scripts/functions/guess.sh(guess)

# first of first,include abs root(directory) name.
# then start 'Our Quartet'
# get some global variable -- "FUNCPATH" "ABSROOT" "include_all" "echotest" ..
project_dir=$( cd  $( dirname $0 ) &&  cd ../../ && pwd -P )
. $project_dir/conf/abs.conf
. ${FUNCPATH}/base 2>/dev/null

# story start.
# client receive something about secret contents,all are regular files,
# but one is special,it is a token(file).

SOME=$(guess ${ABSROOT}/share/okaies/encoded_okay_03)
iisr "$SOME -ne 00"
iisr "$SOME -eq 03"
