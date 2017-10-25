DROP LOADER trainmodel;
CREATE loader trainmodel (numpyimage blob, label integer ,model_id integer, model_path string, model_name string, batch_size float,
learning_rate float, epoch float) LANGUAGE PYTHON 
{   
import pickle
import tensorflow as tf
import numpy as np
model_path = model_path[0]
model_name = model_name[0]
xs = []
ys = []
for i in range(len(numpyimage)):
    xs.append(pickle.loads(numpyimage[i]))
    ys.append(label[i])
xs = np.array(xs)
labels_train = np.array(ys)
# Xtr_rows becomes 50000 x 3072, This is due so it can fit the Weights Matrix.
images_train = xs.reshape(xs.shape[0], 32 * 32 * 3) 
# Parameter definitions
batch_size = int(batch_size[0])
learning_rate = float(learning_rate[0])
epoch = int(epoch[0])
# Get exactly the same result on each run
np.random.seed(1)
# Define input placeholders, since they will need to be accessed again we need to define names.
images_placeholder = tf.placeholder(tf.float32, shape=[None, 3072], name='images_placeholder')
labels_placeholder = tf.placeholder(tf.int64, shape=[None], name='labels_placeholder')
# Define variables (these are the values we want to optimize)
weights = tf.Variable(tf.zeros([3072, 10]))
biases = tf.Variable(tf.zeros([10]))
# Define the classifier's result
logits = tf.matmul(images_placeholder, weights) + biases
#Similar to the placeholdes we need to define a name for the logits in order to access them again later.
tf.add_to_collection("logits", logits)
# Define the loss function
loss = tf.reduce_mean(tf.nn.sparse_softmax_cross_entropy_with_logits(logits=logits,
  labels=labels_placeholder))
# Define the training operation
train_step = tf.train.GradientDescentOptimizer(learning_rate).minimize(loss)
with tf.Session() as sess:
  # Initialize variables
  sess.run(tf.global_variables_initializer())
 # Repeat max_steps times
  for i in range(epoch):
    # Generate input data batch
    indices = np.random.choice(images_train.shape[0], batch_size)
    images_batch = images_train[indices]
    labels_batch = labels_train[indices]
    # Perform a single training step
    sess.run(train_step, feed_dict={images_placeholder: images_batch,labels_placeholder: labels_batch})
  #Save Trained Session
  saver = tf.train.Saver()
  saver.save(sess, model_path+model_name)
  _emit.emit( { 'id':int(model_id[0]),'name': model_name, 'model_path': model_path, 'batch_size': batch_size, 'learning_rate':learning_rate, 'epoch':epoch})
};
