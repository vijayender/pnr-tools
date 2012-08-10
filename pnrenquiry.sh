#!/bin/bash

pnr=$1
pnrname=/tmp/pnr-dont-use-this-name-ever-never
opnrname=$pnrname"o"

function pnr_find ()
{
    xmllint --xpath "$1" $pnrname
}

post="lccp_pnrno1="$pnr"&submit=Wait+For+PNR+Enquiry%21"
url="http://www.indianrail.gov.in/cgi_bin/inet_pnrstat_cgi.cgi"
curl --retry 2 --connect-timeout 5 -m7 -d "$post" "$url"  > $opnrname
(cat $opnrname | tidy -asxhtml -numeric -quiet | sed -e 's/xmlns/smlns/g'  > $pnrname) 2>/dev/null

book_path="//table[@id='center_table']/tr[2]/td[2]/b/text()"
curr_path="//table[@id='center_table']/tr[2]/td[3]/b/text()"
chart_path="//table[@id='center_table']/tr[3]/td[2]/text()"

if [[ -n $2 ]]
then
    echo `pnr_find $curr_path`
    exit
fi

echo -------------------------------------------
echo Booking status :`pnr_find "$book_path"`
echo Current status :`pnr_find "$curr_path"`
echo "Chart status   ":`pnr_find "$chart_path"`
echo -------------------------------------------
