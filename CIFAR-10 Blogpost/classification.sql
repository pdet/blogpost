DROP loader classification;

CREATE loader classification (numpyimage blob, label integer, image_id integer, 
	model_id integer, model_path string, name string) LANGUAGE PYTHON {
import tensorflow as tf
import pickle
import numpy as np
#Restore Trained Model
sess=tf.Session()    
new_saver = tf.train.import_meta_graph(model_path[0]+name[0] +'.meta')
new_saver.restore(sess, model_path[0]+name[0])
graph = tf.get_default_graph()
images_placeholder = graph.get_tensor_by_name("images_placeholder:0")
labels_placeholder = graph.get_tensor_by_name("labels_placeholder:0")
logits = tf.get_collection("logits")[0]
xs = []
ys = []
imageid = []
modelid = []
for i in range(len(numpyimage)):
    xs.append(pickle.loads(numpyimage[i]))
    ys.append(label[i])
    imageid.append(image_id[i])
    modelid.append(1)
xs = np.array(xs)
images_test = xs.reshape(xs.shape[0], 32 * 32 * 3) 
#Actually perform the classification for the images
classifiedtype =sess.run(tf.argmax(logits, 1), feed_dict={images_placeholder:images_test})
_emit.emit( { 'id_cifarimage':image_id , 'id_model': model_id, 'id_label': classifiedtype})
};
