#!/usr/bin/python

import sys
import MySQLdb
import time
import datetime
import csv
import os
import pandas as pd
import maya
from contextlib import contextmanager

tgmsa_home = '/home/admin/tgmsa'
report_dir = tgmsa_home+'/reports'

@contextmanager
def db_connection(host, user, passwd, db):
    try:
        connection = MySQLdb.connect(host=host, user=user, passwd=passwd, db=db)
        cursor = connection.cursor()
        yield cursor
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        connection.close()
#End db_connection


def get_data(box_id, day_start=datetime.datetime.now()):

    day_end=day_start + datetime.timedelta(days=1)
    day_start = day_start.strftime("%Y-%m-%d")
    day_end = day_end.strftime("%Y-%m-%d")

    query=("SELECT czasZdarzenia, idStrefaWejsciowa, nazwaStrefyWejsciowej, nazwaStrefyWyjsciowej, idStrefaWyjsciowa, idKontroler, szczegoly, nazwaKontrolera FROM Zdarzenie a WHERE (idUzytkownik = %s) AND (kodZdarzenia = 263) AND (czasZdarzenia >= %s) AND (czasZdarzenia < %s) AND (idStrefaWejsciowa = '1' OR idStrefaWyjsciowa = '1') AND (SUBSTR(CONV(HEX(szczegoly),16,2), -12, 1) !=1) ORDER BY czasZdarzenia ASC;")
    with db_connection('127.0.0.1', 'tgmsa', 'password', 'accoDb') as db:
        db.execute(query, (box_id, day_start, day_end))
        data = db.fetchall() or ('0,0')
        #print(data)
        return data
#End get_data(

def get_report():
    test = pd.read_csv('/home/admin/tgmsa/reports/2017/5/10/410/box-410.csv', delimiter = ';')
    print(test.head())



def main():
    """ Funcion """   
    print(tgmsa_home)
    print(report_dir)
    for box in range(405, 417):
        data = get_data(box, day_start=datetime.date(2017, 05, 10))
        #print(datai)
        get_report()
#End main

if __name__ == "__main__":
    main()
