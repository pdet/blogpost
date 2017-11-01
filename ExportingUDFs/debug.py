import pymonetdb
conn = pymonetdb.connect(database='demo') #Open Database connection
c = conn.cursor()
sql = 'select mean_deviation(i) from integers;'
c.debug(sql, 'mean_deviation') #Console Debugging
