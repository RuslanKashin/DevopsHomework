#!/bin/bash
# display command line options

HOSTS=("192.168.0.1" "173.194.222.113" "87.250.250.242")
PORT=80
LOGFILE=result.log

touch $LOGFILE

for (( a=0; a<5; a++ ))
do
	for host in ${HOSTS[@]} 
	do
	    curl $host:$PORT
	    ((result = $?))
		echo $(date):" "$host" result - "$result >> $LOGFILE
	done
done
