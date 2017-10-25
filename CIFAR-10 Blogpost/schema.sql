--DO
CREATE TABLE label (
    id integer NOT NULL PRIMARY KEY,
    label varchar(30) NOT NULL
);

insert into label values (0,'airplane');
insert into label values (1,'automobile');
insert into label values (2,'bird');
insert into label values (3,'cat');
insert into label values (4,'deer');
insert into label values (5,'dog');
insert into label values (6,'frog');
insert into label values (7,'horse');
insert into label values (8,'ship');
insert into label values (9,'truck');

CREATE TABLE cifar10 (
    id integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(120) NOT NULL,
    image blob NOT NULL,
    id_label integer NOT NULL,
    CONSTRAINT FK1 FOREIGN KEY (id_label) REFERENCES label (id)
);


CREATE TABLE cifar10numpy (
    id_image integer NOT NULL PRIMARY KEY ,
    numpyimage blob NOT NULL,
    CONSTRAINT FK2 FOREIGN KEY (id_image) REFERENCES cifar10 (id)
);

CREATE TABLE trainset (
    id_image integer NOT NULL PRIMARY KEY ,
    train BOOLEAN NOT NULL,
    CONSTRAINT FK3 FOREIGN KEY (id_image) REFERENCES cifar10 (id)
);



CREATE TABLE classificationmodel (
    id integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(120) NOT NULL,
    model_path varchar(120) NOT NULL, #Future BLOB
    batch_size integer not null ,
    learning_rate float not null, 
    epoch integer not null 
);

CREATE TABLE classification (
  id_model integer not null,
  id_cifarimage integer NOT NULL,
  id_label integer not null
  );

--UNDO

DROP TABLE classification;
DROP TABLE classificationmodel;
DROP TABLE trainset;
DROP TABLE cifar10numpy;
DROP TABLE cifar10;
