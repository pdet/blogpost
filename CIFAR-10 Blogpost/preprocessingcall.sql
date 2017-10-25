COPY LOADER INTO cifar10numpy FROM preprocessing( (SELECT id,image FROM cifar10) ) ;
