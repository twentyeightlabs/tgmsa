#!/usr/bin/python

import MySQLdb
import sys
import time
import datetime


def connectToDb():
    try:
        connection = MySQLdb.connect(host='127.0.0.1', user='tgmsa', passwd='password', db='accoDb')
        cursor=connection.cursor()

        query=("SELECT czasZdarzenia, idStrefaWejsciowa, nazwaStrefyWejsciowej, nazwaStrefyWyjsciowej, idStrefaWyjsciowa, idKontroler, szczegoly, nazwaKontrolera FROM Zdarzenie a WHERE (idUzytkownik = %s) AND (kodZdarzenia = 263) AND (czasZdarzenia >= %s) AND (czasZdarzenia < %s) AND (idStrefaWejsciowa = '1' OR idStrefaWyjsciowa = '1') AND (SUBSTR(CONV(HEX(szczegoly),16,2), -12, 1) !=1) ORDER BY czasZdarzenia ASC;")
        
        box_id='414'
        day_start = datetime.date(2017, 05, 10)
        day_end = datetime.date(2017, 05, 11)

        cursor.execute(query, (box_id, day_start, day_end))
        data = cursor.fetchall()

        connection.close()
        cursor.close()

    except Exception as e:
        print e

    start=data[0][0]
    end=data[-1][0]
    #print('otwarto o:', start)
    #print('zamknieto o: ', end)

#End connectToDb


def getDate():
    print time.asctime(time.localtime(time.time()))
    curr_date='2017-05-11'
    print(curr_date)
#End getTime

def getBox(box_number):
    print('numer boxu')
    

#End getBox

def main():
    #getDate()
    connectToDb()
#End main


main()
