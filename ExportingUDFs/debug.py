import pymonetdb
conn = pymonetdb.connect(database='demo') #Open Database connection
c = conn.cursor()
sql = 'select mean_deviation(id) from tables;'
c.debug(sql, 'mean_deviation') #Console Debugging
c.export(sql, 'mean_deviation') # IDE
