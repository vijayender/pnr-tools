#!/bin/bash

file=$1
pnr=`pdftotext $file  - | grep "PNR No" | cut -d' ' -f3`
pnr_result=$( pnrenquiry.sh $pnr )
zenity --info --text "$file\n$pnr_result"
