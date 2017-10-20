#!/usr/bin/python

import MySQLdb
import sys
import time
import datetime


def connectToDb(box_id):
    try:
        connection = MySQLdb.connect(host='127.0.0.1', user='tgmsa', passwd='password', db='accoDb')
        cursor=connection.cursor()

        query=("SELECT czasZdarzenia, idStrefaWejsciowa, nazwaStrefyWejsciowej, nazwaStrefyWyjsciowej, idStrefaWyjsciowa, idKontroler, szczegoly, nazwaKontrolera FROM Zdarzenie a WHERE (idUzytkownik = %s) AND (kodZdarzenia = 263) AND (czasZdarzenia >= %s) AND (czasZdarzenia < %s) AND (idStrefaWejsciowa = '1' OR idStrefaWyjsciowa = '1') AND (SUBSTR(CONV(HEX(szczegoly),16,2), -12, 1) !=1) ORDER BY czasZdarzenia ASC;")
        
        #box_id='414'
        day_start = datetime.date(2017, 05, 10)
        day_end = datetime.date(2017, 05, 11)

        cursor.execute(query, (box_id, day_start, day_end))
        data = cursor.fetchall()

        connection.close()
        cursor.close()

    except Exception as e:
        print e


    if not data:
        print('Structure is empty.')
        data=('0,0')

    start=data[0][0]
    end=data[-1][0]
    print(start)
    print(end)

    worked=end-start
    print(worked)

#End connectToDb


def getDate():
    print time.asctime(time.localtime(time.time()))
    curr_date='2017-05-11'
    print(curr_date)

#End getTime


def main():
    getDate()
    tgmsa_home='/home/admin'
    report_dir=tgmsa_home+'/reports'
    print(tgmsa_home)
    print(report_dir)
    for box in range(414, 415):
        connectToDb(box)
        print(box)
#End main


main()
