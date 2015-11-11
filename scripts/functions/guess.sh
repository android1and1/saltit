#!/bin/bash
# filename: guess.sh 
# for guess which simple pass the encoder was used.
# refact by Alan,2015-11-11.
function guess(){
	# $1 is a token-file,made after client encoded some files.
	for i in 0 00 01 02 03 10 11 12 13 20 21 22 23 30 31 32 33 
	do
		letbe=`openssl enc -d -aes256 -in $1 -kfile ${ABSROOT}/share/md5s/md5sum_"$i" 2>/dev/null`
		if [[ ${letbe} == 'okay' ]]
		then
			echo $i
			break
		fi
	done
}
