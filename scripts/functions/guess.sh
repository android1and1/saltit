#!/bin/bash
# filename: guess.sh 
# for guess which simple pass the encoder was used.
# refact by Alan,2015-11-11 10:46:03 
function guess(){
	# $1 is a token-file,made after client encoded some files.
	for i in ${SIMPLE_PASSWORD}
	do
		letbe=`openssl enc -d -aes256 -in $1 -kfile ${ABSROOT}/share/md5s/md5sum_"$i" 2>/dev/null`
		if [[ ${letbe} == 'okay' ]]
		then
			echo $i
			break
		fi
	done
}
