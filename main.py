import sqlparse



f_contents = open("example.sql").read()

stmnt_list = split_statements(f_contents)

good_stmnts = []
for stmnt in stmnt_list:
    try:
        sqlparse.parse(stmnt)
        good_stmnts.append(stmnt)
    except sqlparse.exceptions.SQLParseError:
        print("Bad statement. Ignoring.\n'%s'" % stmnt)