#/bin/bash

#TGMSAHOME=`pwd`
TGMSAHOME='/home/michal/tgmsa'
REPORTSHOME=$TGMSAHOME/reports

DATE=`date +"%Y-%m-%d"`
#DATE="2019-02-09"

REPORTDATE=`date +"%d-%m-%Y"`
#REPORTDATE="09-02-2019"

MDATE=`date +"%Y-%m"`
#MDATE="2019-02"

MREPORTDATE=`date +"%m-%Y"`
#MREPORTDATE="02-2019"

YDATE=`date +"%Y"`
#YDATE="2019"



echo $TGMSAHOME
for i in 17 18 21 27 28 31 33 35 36 39 44 51 52 59 61 62 63 64 65 66 67 71 74 76 77 83 85 87 96 101 102 103 19 110 111 113 116 124 133 134 135 140 142 143 146 147 148 149 150 151 154 155 157 158 161 162 163 164 167 168 170 172 175 176 179 180 182 189 191 192 193 196 197 198 200 203 205 207 208 209 211 212 213 215 216 217 219 220 225 226 227 229 231 233 235 238 239 241 244 249 251 253 254 255 257 258 260 263 264 266 267 269 271 273 277 279 283 285 286 287 288 289 290 292 293 295 297 299 300 301 302 326 327 328 330 331 333 334 336 338; do
#for i in $(seq 200 201); do
	cd $TGMSAHOME
	if [ ! -d $REPORTSHOME ]; then
        mkdir $REPORTSHOME
        echo test
    fi

    if [ ! -d $TGMSAHOME/reports/$YDATE ]; then
        mkdir $TGMSAHOME/reports/$YDATE
        echo test2
    fi

	if [ ! -d $TGMSAHOME/reports/$YDATE/$DATE ]; then
		mkdir $TGMSAHOME/reports/$YDATE/$DATE
	fi

	if [ ! -d $TGMSAHOME/reports/$YDATE/$MDATE ]; then
		mkdir $TGMSAHOME/reports/$YDATE/$MDATE
	fi

	if [ ! -d $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i ]; then
		mkdir $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i
	fi	

	if [ ! -d $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/DAILY ]; then
		mkdir $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/DAILY
	fi

	if [ ! -f $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.csv ]; then
		touch $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.csv
	fi

python $TGMSAHOME/main.py $i $DATE

TIMEOPEN=`cat $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE.csv|grep -i BOX-$i |cut -d ";" -f4`
echo "otwarcie w godzinach $TIMEOPEN"
TIMEOPENSEC=`echo $TIMEOPEN | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`
echo "otwarcie w sekundach $TIMEOPENSEC"

#echo $i,$TIMEOPEN >> $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE-temp.csv

#for monthly report
#sprawdzenie czy juz jest plik w tym miesiacu, jezeli nie to bedzie 0  idziemy dalej, generowane jest tylko pierwszego dnia miesiaca
PREVIOUSTIMEOPEN=`cat $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/BOX-$i.csv`
CURRENTTIMEOPEN=$((PREVIOUSTIMEOPEN+$TIMEOPENSEC))
echo $CURRENTTIMEOPEN > $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/BOX-$i.csv
echo "otwarcie: $CURRENTTIMEOPEN"
TIMEOPENHOUR=`expr $CURRENTTIMEOPEN / 60`
echo "w minutach: $TIMEOPENHOUR"
echo "w godzinach: $(($TIMEOPENHOUR / 60)):$(($TIMEOPENHOUR % 60))"
echo "BOX-$i,$(($TIMEOPENHOUR / 60)):$(($TIMEOPENHOUR % 60))" > $TGMSAHOME/reports/$YDATE/$MDATE/$MDATE-BOX-$i.csv

#monthly detailed report
cp html-template/report-detailed-template.html $REPORTSHOME/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.html
sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $REPORTSHOME/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.html
sed -i "s/INSERT-BOX-NUMBER/$i/g" $REPORTSHOME/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.html
sed -i "s/:/./g" $REPORTSHOME/$YDATE/$MDATE/BOX-$i/DAILY/report-$MDATE.csv
#end monthly detailed report


######################

done

#daily report
cp html-template/report-template.html $REPORTSHOME/$YDATE/$DATE/report-$DATE.html
sed -i "s/INSERT-DATE/$DATE/g" $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE.html
sed -i "s/:/./g" $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE.csv
sed -i "s/;/,/g" $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE.csv
#end daily report

#monthly report
cp html-template/monthly-all-box-template.html $REPORTSHOME/$YDATE/$MDATE/$MDATE.html
sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $REPORTSHOME/$YDATE/$MDATE/$MDATE.html
cat $TGMSAHOME/reports/$YDATE/$MDATE/$MDATE-BOX-*.csv > $TGMSAHOME/reports/$YDATE/$MDATE/all-data.csv
sed -i "s/:/./g" $TGMSAHOME/reports/$YDATE/$MDATE/all-data.csv
#end montrly report

#replace in main index.html
sed -i "/INSERT HERE DAILY/a <option VALUE='https://tgmsa.vipkam.pl/$YDATE/$DATE/report-$DATE.html'>$REPORTDATE</option>" $TGMSAHOME/reports/index.html

grep -rH "https://tgmsa.vipkam.pl/$YDATE/$MDATE/$MDATE.html" $TGMSAHOME/reports/index.html
if [ $? -eq 1 ]; then
	sed -i "/INSERT HERE MONTHLY/a <option VALUE='https://tgmsa.vipkam.pl/$YDATE/$MDATE/$MDATE.html'>$MREPORTDATE</option>" $TGMSAHOME/reports/index.html
fi

#end replace in main index.html
