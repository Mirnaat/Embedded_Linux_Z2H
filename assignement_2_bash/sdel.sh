#!/bin/bash

 if [ ! -d ~/TRASH ]
 then
	mkdir ~/TRASH
 fi

 files=`echo -n $(ls ~/TRASH)`
 current_time=$(date +%H)
 for i in $files
	do
	echo $i
	file_time=$(date -r ~/TRASH/$i +%H)
	if(( file_time < (current_time-(48)) ))
	then
		 rm ~/TRASH/$i
	fi
 done

 if [ $# != 0 ]
 then
	for f in $*
	do 
		tar czf $f.tar.gz  $f
		mv $f.tar.gz ~/TRASH
	done
 fi
