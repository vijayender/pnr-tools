#!/bin/bash

inp=$1
oup=$inp".out"

(echo -n `date`", " 
for file in `cat $inp`
do
    pnr=`pdftotext $file  - | grep "PNR No" | cut -d' ' -f3`
    echo -n `pnrenquiry.sh $pnr o`", "
    sleep 1
done
echo ) | tee -a $oup
echo ----------------------------------------------------------
cat $oup
