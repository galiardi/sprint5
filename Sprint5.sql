create schema Sprint5;

create table proveedor(
id int not null auto_increment primary key,
nombre_representante varchar(60) not null,
nombre_corporativo varchar(60) not null,
categoria varchar(30) not null,
email varchar(30) not null
);

create table telefono_proveedor(
telefono varchar(12) not null primary key,
proveedor_id int not null,
nombre_persona varchar(60) not null,
foreign key (proveedor_id) references proveedor(id)
);

create table producto (
	id_producto int not null primary key,
    nombre varchar (50) not null,
    stock int not null,
	precio int not null,
    categoria varchar (20) not null,
    id_proveedor varchar (20) not null,
    color varchar (20) not null,
    foreign key (id_proveedor) references proveedor(id)
);

create table clientes (
	id_cliente int not null auto_increment primary key,
	nombre varchar (20) not null,
    apellido varchar (20) not null,
    direccion varchar (50) not null
);

insert into proveedor
(nombre_representante, nombre_corporativo, categoria, email) values
('Zinedine Zidane', 'RealMadridCorp', 'Deportes', 'zzidane@realmadrid.com'),
('Sergio Ramos', 'Ramos Suppliers', 'Electrónica', 'sramos@realmadrid.com'),
('Karim Benzema', 'Benzema & Co.', 'Tecnología', 'kbenzema@realmadrid.com'),
('Luka Modric', 'Modric Enterprises', 'Tecnología', 'lmodric@realmadrid.com'),
('Toni Kroos', 'Kroos', 'Audio', 'tkroos@kross.com');

insert into telefono_proveedor
(telefono, id_proveedor, nombre_persona) values
('+56123456789', 1, 'Véronique Zidane'),
('+56987654321', 1, 'Manuela Riquelme')
('+56111222333', 2, 'Pilar Rubio'),
('+56444555666', 2, 'Claudia Soto')
('+56222333444', 3, 'Jessica Rojo')
('+56555666777', 3, 'Vanja Bosnic'),
('+56888999000', 4, 'Estanca Trupak') ,
('+56777888999', 4, 'Corinne Yam'),
('+56666777888', 5, 'Jessica Farber'),
('+56999000111', 5, 'Fulana Detal');

-- categoria se repite tambien en proveedor pero la mantendremos aqui para evitar un join con proveedor por cada producto cada vez que se solicite la lista de productos, lo cual sera muy frecuente en la aplicacion

insert into producto
(id_producto, nombre, stock, precio, categoria, id_proveedor, color) values
(1, 'Laptop', 50, 825000, 'Tecnología', '3', 'Silver'),
(2, 'Teléfono móvil', 100, 440000, 'Tecnología', '4', 'Black'),
(3, 'Smart TV', 30, 660000, 'Electrónica', '2', 'Gray'),
(4, 'Auriculares inalámbricos', 80, 55000, 'Electrónica', '2', 'White'),
(5, 'Impresora', 20, 110000, 'Tecnología', '3', 'Black'),
(6, 'Altavoz Bluetooth', 50, 44000, 'Audio', '5', 'Red'),
(7, 'Tablet', 40, 440000, 'Tecnología', '4', 'Gold'),
(8, 'Cámara digital', 10, 660000, 'Electrónica', '2', 'Black'),
(9, 'Reproductor de música', 60, 36500, 'Audio', '5', 'Blue'),
(10, 'Smartwatch', 30, 220000, 'Tecnología', '4', 'Silver');

insert into clientes (nombre, apellido, direccion) values
('María', 'Rodríguez', 'Avenida de los Álamos 234'),
('Laura', 'Gómez', 'Calle del Sol 123'),
('Manuel', 'López', 'Avenida de la Luna 456'),
('Ana', 'Sánchez', 'Carrera de la Esperanza 789'),
('Pedro', 'Martínez', 'Plaza Principal 101');

select * from proveedores;
select * from clientes;
select * from producto;

select * from proveedores
inner join clientes
on proveedores.id_proveedor = clientes.id_cliente
inner join producto
on producto.id_producto = proveedores.id_proveedor;

drop table producto;