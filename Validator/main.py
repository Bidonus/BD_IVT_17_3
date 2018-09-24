import sqlite3
import os


class DB:
    connection = sqlite3.connect("./Databases/Adventures.db3.db")
    crsr = connection.cursor()

    def cleaning(self):
        self.connection.commit()
        self.connection.close()

    def validate(self):
        error = 0
        bad_query = ""

        for query in os.listdir("./Queries/"):

            command = open("./Queries/" + query).read()

            try:
                self.crsr.executescript(command)
            except:
                error += 1
                bad_query = query
        error = 0
        if error == 0:
            print("All Queries are good, perfect!")
        else:
            self.cleaning()
            print("Bad query")
            raise SyntaxError("Bad SQL query. Troubles in " + bad_query + " file")

        self.cleaning()
