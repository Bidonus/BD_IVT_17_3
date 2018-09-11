import sqlite3
import os


class DB:
    connection = sqlite3.connect("myTable.db")

    crsr = connection.cursor()

    def create_db(self):

        sql_command = """CREATE TABLE emp (  
        staff_number INTEGER PRIMARY KEY,  
        fname VARCHAR(20),  
        lname VARCHAR(30),  
        gender CHAR(1),  
        joining DATE);"""

        self.crsr.execute(sql_command)

        sql_command = """INSERT INTO emp VALUES (23, "Rishabh", "Bansal", "M", "2014-03-28");"""
        self.crsr.execute(sql_command)

        sql_command = """INSERT INTO emp VALUES (1, "Bill", "Gates", "M", "1980-10-28");"""
        self.crsr.execute(sql_command)

        sql_command = """INSERT INTO emp VALUES (42, "Jon", "SSe", "W", "1982-12-12");"""
        self.crsr.execute(sql_command)

        sql_command = """INSERT INTO emp VALUES (41, "Laas", "Reas", "M", "1988-09-12");"""
        self.crsr.execute(sql_command)

    def cleaning(self):
        self.connection.commit()
        self.connection.close()
        os.remove("myTable.db")

    def validate(self):

        error = 0
        bad_query = ""

        for query in os.listdir("./queries/"):

            command = open("./queries/" + query).read()

            try:
                self.crsr.executescript(command)
            except:
                error += 1
                bad_query = query

        if error == 0:
            print("All queries are good, perfect!")
        else:
            self.cleaning()
            print("Bad query")
            raise SyntaxError("Bad SQL query. Troubles in " + bad_query + " file")

        self.cleaning()
