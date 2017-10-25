CREATE LOADER preprocessing(imageid integer, images blob) LANGUAGE PYTHON {
	from imread import imread_from_blob
	import numpy as np
	import pickle
	numpy_image = []
	id_image = []
	for id in imageid:
		id_image.append(id)
	for image in images:
		img_data = imread_from_blob(str(image), 'png')
		numpy_image.append(pickle.dumps(img_data))
	for i in range (0,len(numpy_image)):
		_emit.emit( { 'id_image': int(id_image[i]), 'numpyimage': numpy_image[i]})

};