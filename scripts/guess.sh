#!/bin/bash
# filename: guess.sh 
# for guess which simple pass the encoder was used.

if test  $# -ne 1
# $1 is token file.
then
	echo Usage: $0 {token_file_name}
	exit 2
fi

# source conf(enviroment)
CONF_DIR=$(cd $(dirname $0) && pwd -P)
. ${CONF_DIR}/conf.sh


for i in $SIMPLE_PASS
do
	letbe=`openssl enc -d -aes256 -in $1 -kfile ${MODEL_DIR}/md5sum_"$i" 2>/dev/null`
	if [[ ${letbe} == 'okay' ]]
	then
		echo $i is key of key\.
		break
	else
		continue
	fi
done
echo 'done.'
