#!/usr/bin/python

import MySQLdb
import sys

def main():
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

if __name__== "__main__":
    main()

print("hello")
