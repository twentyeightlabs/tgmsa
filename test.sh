#/bin/bash

#TGMSAHOME=`pwd`
TGMSAHOME='/Users/stachu/work/tgmsa-reports'
REPORTSHOME=$TGMSAHOME/reports

#DATE=`date +"%Y-%m-%d"`
DATE="2017-11-15"
#REPORTDATE=`date +"%d-%m-%Y"`
REPORTDATE="15-11-2017"
#MDATE=`date +"%Y-%m"`
MDATE="2017-11"
#MREPORTDATE=`date +"%m-%Y"`
MREPORTDATE="11-2017"
#YDATE=`date +"%Y"`
YDATE="2017"

echo $TGMSAHOME
#for i in 8 22 28 30 200 217 219; do
for i in 28 30; do

cd $TGMSAHOME

cp html-template/report-detailed-template.html $REPORTSHOME/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.html
sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $REPORTSHOME/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.html
sed -i "s/INSERT-BOX-NUMBER/$i/g" $REPORTSHOME/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.html


done