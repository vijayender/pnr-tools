# pnr-tools

It's for Indian Railway PNR numbers.
Get pnr numbers with a single on the pdf file of your ticket.

## Accompanied tools
* `pnrenquiry.sh`:
   Call it using `pnrenquiry.sh <pnr-number>`
* `pnr-gui.sh`:
   `open-with` your pdf using pnr-enquiry.sh. Uses zenity to display results
* `pnr-fetch-list.sh`
   Takes argument a `train-list` a list of pdf paths.  
   Generates a `train-list.out` your pnr results fetched
   

## Requirements
* zenity
* pdftotext
* curl
* xmllint (I guess part of 
## Installation
  Add the directory in your PATH variable  

