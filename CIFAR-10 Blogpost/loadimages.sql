CREATE LOADER loadImages(folder_path string) LANGUAGE PYTHON {
import os
import csv
 # Creates a Dictionary for the Labels with the Image name as key.
d = {}
reader = csv.reader(open(folder_path+'labels.csv', 'r'))
for row in reader:
   k, v = row
   d[k] = v
id = 0
for filename in os.listdir(folder_path):
	if filename.endswith('png'):
		file = open(folder_path+filename,'rb')
		image = file.read()
		typeid = d[filename]
		_emit.emit( { 'id': id, 'name': filename, 'image': image,'id_label':int(typeid)})
		file.close()
		id = id +1
};



