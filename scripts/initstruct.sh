#!/bin/bash
# filename initstruct.sh
# descriptoion:init 'saltit' subdir,files.


#dirs defines
#ROOTDIR=basedir($0)
ROOTDIR="/home/pi/saltit"
TOOLDIR="$ROOTDIR""/tools"
UPLOADDIR="$ROOTDIR""/uploads"

# check
if test ! -d "$TOOLDIR"
then
	echo 'no found tool.'
	exit 3
fi

if test ! -d "$UPLOADDIR"
then
	mkdir ./uploads
	mkdir ./uploads/need/
	mkdir ./uploads/base/
fi


fills(){
	cd $TOOLDIR
	# fill tool dir
	for i in 1 2 3 01 02 03 00
	do
		echo $i | openssl dgst -md5 > "md5sum_""$i"
	done

	# fill okay
	echo 'okay' > okay.plain
	
	# decode 'okay'
	for i in 1 2 3 01 02 03 00
	do
		openssl enc -e -aes256 -in okay.plain -kfile "md5sum_""$i" -out okay.decoded
	done
	 
	echo '#upload prepare.' >> $UPLOADDIR/README
	rm okay.plain
	 
}
fills


touch struct_is_ok
#touch ./guess.sh
#touch ./lessthan0 # only record simplest passwd,etc:0 1 00...
