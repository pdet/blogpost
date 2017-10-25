CREATE LOADER split_set(id INT, test_size float) LANGUAGE PYTHON
{
    import numpy as np
    count = len(id)
    # generate the indices
    indices = np.arange(count)
    # shuffle the indices
    np.random.shuffle(indices)
     # assign x% of the values to the train set
    train_indices = indices[:int(count * (1-test_size[0]))]
    train_set = numpy.zeros(count, dtype=numpy.bool)
    print(train_set)
    # create a boolean array that specifies for each value if it belongs to the train/test set
    train_set[train_indices] = True
	for i in range (0,len(train_set)):
		_emit.emit( { 'id_image': int(id[i]), 'train': bool(train_set[i])})
};