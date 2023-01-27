import serial
import sqlite3

ser = serial.Serial("/dev/ttyUSB0")
con = sqlite3.connect("Database.db")
cur = con.cursor()

tableQuery = """
CREATE TABLE IF NOT EXISTS readings (
            v1 CHAR(25),
            v2 CHAR(25)
        );
"""

cur.execute(tableQuery)


def read():
    while 1:
        serialData = ser.readline().decode('utf-8')
        serialList = serialData.split(", ")
        methane = serialList[0]
        temperature = serialList[1]

        print(methane)
        print(temperature)

        cur.execute(f"""
        Insert into readings (v1, v2) values
        ({methane},{temperature})
        """)
        con.commit()


read()
