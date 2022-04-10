#!/bin/bash
# display command line options

while ((1==1)) 
do
	curl https://localhost:4757
	((result=$?))
	echo $result
	
	if (($result!=0))
	then
		date >> curl.log
	else
		break;
	fi
done
