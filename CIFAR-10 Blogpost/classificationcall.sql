--Classification
COPY LOADER INTO classification FROM classification ((SELECT  numpyimage , id_label, id_image, classificationmodel.id, classificationmodel.model_path, classificationmodel.name
  from classificationmodel, cifar10numpy inner join train_set on (train_set.id = cifar10numpy.id_image) 
  inner join cifar10 on (cifar10.id = cifar10numpy.id_image) where train_set.train = false));
  -- and classificationmodel.id = 2));
