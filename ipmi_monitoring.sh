#!/bin/bash
i=0
while [ true ]
do
	echo "***" >> /output.txt
	echo Number of IPMI request: $i >> /output.txt
	((i=i+1))
	date | awk '{print $4}' >> /output.txt
	START=`echo $(($(date +%s%N)/1000000))`
	ipmitool sensor >> /dev/null
	ipmitool sel elist >> /dev/null
	STOP=`echo $(($(date +%s%N)/1000000))`
	TIME=$(($STOP - $START))
	echo "The request takes $TIME milliseconds" >> /output.txt
	echo "***" >> /output.txt
done
