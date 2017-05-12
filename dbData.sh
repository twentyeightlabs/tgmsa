#!/bin/bash
BOX=${1}
#DATE=`date +"%Y-%m-%d"`
DATE="2017-04-01"
DATE2=`date -d "+1 day" +"%Y-%m-%d"`
#DATE2="2017-04-02"
#echo $DATE
#echo $DATEPLUSONE
#echo $BOX
mysql <<MY_QUERY
USE accoDb
SELECT nazwaUzytkownika, czasZdarzenia FROM Zdarzenie WHERE (idUzytkownik = $BOX ) AND (kodZdarzenia = 263) AND (czasZdarzenia >= $DATE) AND (SUBSTR(CONV(HEX(szczegoly),16,2), -12, 1) !=1) ORDER BY czasZdarzenia ASC;
MY_QUERY

