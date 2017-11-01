import pymonetdb
conn = pymonetdb.connect(database='demo')
c = conn.cursor()
sql = 'select mean_deviation(id) from tables;'
c.export(sql, 'mean_deviation') #IDE Debugging