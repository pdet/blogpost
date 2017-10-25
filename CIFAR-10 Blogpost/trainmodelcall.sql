--Generate 4 Different SoftMax Regressions
COPY LOADER INTO classificationmodel FROM trainmodel ((SELECT numpyimage, id_label ,1, '/Users/PHolanda/Desktop/CIFAR-10/Model/', 
  'SoftMax Baseline', 100, 0.005, 1000000 
  from cifar10numpy inner join train_set on (train_set.id = cifar10numpy.id_image) 
  inner join cifar10 on (cifar10.id = cifar10numpy.id_image) where train_set.train = true));

COPY LOADER INTO classificationmodel FROM trainmodel ((SELECT numpyimage, id_label ,2, '/Users/PHolanda/Desktop/CIFAR-10/Model/', 
  'SoftMax 10LR', 100, 0.05, 1000000 
  from cifar10numpy inner join train_set on (train_set.id = cifar10numpy.id_image) 
  inner join cifar10 on (cifar10.id = cifar10numpy.id_image) where train_set.train = true));

COPY LOADER INTO classificationmodel FROM trainmodel ((SELECT numpyimage, id_label ,3, '/Users/PHolanda/Desktop/CIFAR-10/Model/', 
  'SoftMax 10epoch', 100, 0.005, 10000000 
  from cifar10numpy inner join train_set on (train_set.id = cifar10numpy.id_image) 
  inner join cifar10 on (cifar10.id = cifar10numpy.id_image) where train_set.train = true));

COPY LOADER INTO classificationmodel FROM trainmodel ((SELECT numpyimage, id_label ,4, '/Users/PHolanda/Desktop/CIFAR-10/Model/', 
  'SoftMax 10batch', 1000, 0.005, 1000000 
  from cifar10numpy inner join train_set on (train_set.id = cifar10numpy.id_image) 
  inner join cifar10 on (cifar10.id = cifar10numpy.id_image) where train_set.train = true));
