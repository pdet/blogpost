#####################################################################################################################################
 #Return Accuracy only for Airplanes
 #####################################################################################
DOESNT WORK:
select accuracy(cifar10.id_label, classification.id_label) from cifar10
 inner join classification on (cifar10.id = classification.id_cifarimage)
 inner join label on (label.id = cifar10.id_label) 
 where id_model = 1 and label.label like 'cat';
#####################################################################################
select accuracy(cifar10.id_label, classification.id_label) from cifar10
 inner join classification on (cifar10.id = classification.id_cifarimage)
 where id_model = 1 and cifar10.id_label = 1;
 select accuracy(cifar10.id_label, classification.id_label) from cifar10
 inner join classification on (cifar10.id = classification.id_cifarimage)
 where id_model = 2 and cifar10.id_label = 1;
 select accuracy(cifar10.id_label, classification.id_label) from cifar10
 inner join classification on (cifar10.id = classification.id_cifarimage)
 where id_model = 3 and cifar10.id_label = 1;
 select accuracy(cifar10.id_label, classification.id_label) from cifar10
 inner join classification on (cifar10.id = classification.id_cifarimage)
 where id_model = 4 and cifar10.id_label = 1;
 select accuracy(cifar10.id_label, classification.id_label) from cifar10
 inner join classification on (cifar10.id = classification.id_cifarimage)
 where id_model = 5 and cifar10.id_label = 1;
 select accuracy(cifar10.id_label, classification.id_label) from cifar10
 inner join classification on (cifar10.id = classification.id_cifarimage)
 where id_model = 6 and cifar10.id_label = 1;
#######################################################################################################################################
#Use Multiple Models at the same time. (Ensemble Models)
select * from classification 
inner join modelaccuracy on (modelaccuracy.id_model = classification.id_model and modelaccuracy.id_label = classification.id_label)
order by id_cifarimage; 



#######################################################################################################################################
#Create Triggers to Classify One image
#Real Time Ingelligence:
-- after update on cifar10
-- for each row
-- COPY LOADER INTO classification FROM classification 
-- ((SELECT  numpyimage , id_label, id_image, classificationmodel.id, classificationmodel.model_path, classificationmodel.name   
-- 	from classificationmodel, cifar10numpy inner join train_set on (train_set.id = cifar10numpy.id_image) 
--   inner join cifar10 on (cifar10.id = cifar10numpy.id_image) where train_set.train = false and classificationmodel.id = 2));


