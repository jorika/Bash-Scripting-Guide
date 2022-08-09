#!/bin/bash

lsblk | grep sd | cut -c 1-3  > .temp 2>/dev/null
readarray list < .temp
i=0

for VARNAME in "${list[@]}"
do

#echo Working on $VARNAME...
smartctl -H /dev/$VARNAME | grep PASSED >> .disk_temp
done


VARB=$(cat .disk_temp | wc -l)
# change number of the drives
if [[ $VARB -eq 24 ]]
then
    echo "PASSED"
else
    echo "FAILED"
fi
rm -rf .disk_temp
