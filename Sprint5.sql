create schema sprint5;
use sprint5;

create table proveedor(
id int not null auto_increment,
nombre_representante_legal varchar(60),
nombre_corporativo varchar(60),
categoria varchar(30),
email varchar(30)
);

create table telefono_proveedor(
telefono varchar(12) not null primary key,
proveedor_id int not null,
nombre_contacto varchar(60) not null,
foreign key (proveedor_id) references proveedor(id)
);