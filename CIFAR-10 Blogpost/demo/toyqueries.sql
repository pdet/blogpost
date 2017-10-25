select * from cifar10 limit 5;
select * from cifar10numpy limit 5;
select * from train_set limit 5;
select * from classificationmodel;
select * from classification limit 5;

select cifar10.id as imageid, cifar10.id_label as reallabel, classification.id_label as 
classifiedlabel,classificationmodel.name as modelname  from classification 
inner join classificationmodel on (classificationmodel.id = classification.id_model) 
	inner join cifar10 on (cifar10.id = classification.id_cifarimage)  limit 5;

select accuracy(cifar10.id_label, classification.id_label) from cifar10
 inner join classification on (id = id_cifarimage) where id_model = 1;

select max(accuracy) from modelaccuracy group by id_label;

select modelaccuracy.id_model, modelaccuracy.id_label, modelaccuracy.accuracy from modelaccuracy inner join (select max(accuracy) as accuracy from modelaccuracy group by id_label) as t1 on (t1.accuracy = modelaccuracy.accuracy);

select sum(modelaccuracy.accuracy)/10 from modelaccuracy
 inner join (select max(accuracy) as accuracy from modelaccuracy group by id_label) as t1 
 on (t1.accuracy = modelaccuracy.accuracy);

select modelaccuracy.id_model, label.label, modelaccuracy.accuracy 
from modelaccuracy inner join (select max(accuracy) as accuracy from modelaccuracy group by id_label)
 as t1 on (t1.accuracy = modelaccuracy.accuracy) inner join label on (label.id = modelaccuracy.id_label) order by accuracy;

#How many deers we have in the test/set
select count(*) from train_set inner join cifar10 on (cifar10.id = train_set.id) 
where train_set.train = false and cifar10.id_label = 3;