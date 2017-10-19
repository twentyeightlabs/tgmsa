#!/usr/bin/python

import MySQLdb
import sys
import time

def connectToDb():
    try:
        connection = MySQLdb.connect(host='127.0.0.1', user='tgmsa', passwd='password', db='accoDb')
        cursor=connection.cursor()
        cursor.execute("select * from Uzytkownik")
        data = cursor.fetchall()
        connection.close()
    except Exception as e:
        print e

    for row in data:
        print row[1], row[11]
#End connectToDb


def getTime():
    print time.asctime(time.localtime(time.time()))
#End getTime


def main():
    connectToDb()
    getTime()
#End main


main()
