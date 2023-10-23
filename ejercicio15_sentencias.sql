create database directores;
use directores;
create table despachos(numero int, capacidad int, PRIMARY KEY(numero));
create table directores(dni varchar(40), nom_apels varchar(255), dni_jefe varchar(40),despacho int,
 foreign key (despacho) references despachos(numero) on delete cascade on
update cascade, foreign key (dni_jefe ) references directores(dni) on delete cascade on
update cascade, PRIMARY KEY(dni));

INSERT INTO despachos (numero, capacidad) VALUES
(101, 5),
(102, 4),
(103, 6),
(104, 3),
(105, 5),
(106, 4),
(107, 6),
(108, 3),
(109, 5),
(110, 4);
INSERT INTO directores (dni, nom_apels, despacho) VALUES
('12345678', 'Director 1', 101),
('23456789', 'Director 2', 102),
('34567890', 'Director 3', 103),
('45678901', 'Director 4',  104),
('56789012', 'Director 5', 105),
('67890123', 'Director 6',  106),
('78901234', 'Director 7', 107),
('89012345', 'Director 8', 108),
('90123456', 'Director 9', 109);
INSERT INTO directores (dni, nom_apels, dni_jefe, despacho) VALUES
('01234567', 'Director 10', '78901234', 110);

create database piezas;
use piezas;

create table piezas(codigo int, nombre varchar(100),PRIMARY KEY(codigo));
create table proveedores(codigo int, nombre varchar(100),PRIMARY KEY(codigo));

create table suministra(codigo_pieza int,codigo_proveedor int,precio double,PRIMARY KEY(codigo_pieza,codigo_proveedor),
foreign key (codigo_pieza) references piezas(codigo) on delete cascade on update cascade,
foreign key (codigo_proveedor) references proveedores(codigo) on delete cascade on update cascade
);

-- -------------Inserts--------------

insert into piezas (codigo, nombre) values (0, 'Tuerca');
insert into piezas (codigo, nombre) values (1, 'Tornillo');
insert into piezas (codigo, nombre) values (2, 'Engranaje');
insert into piezas (codigo, nombre) values (3, 'Junta');
insert into piezas (codigo, nombre) values (4, 'Portalampara');
insert into piezas (codigo, nombre) values (5, 'Regletas');
insert into piezas (codigo, nombre) values (6, 'Sierra');
insert into piezas (codigo, nombre) values (7, 'Motores');
insert into piezas (codigo, nombre) values (8, 'Alternadores');
insert into piezas (codigo, nombre) values (9, 'Laser');

insert into proveedores (codigo, nombre) values (500, 'Lehner Inc');
insert into proveedores (codigo, nombre) values (501, 'Marks, Bechtelar and Legros');
insert into proveedores (codigo, nombre) values (502, 'Gerhold, Padberg and Strosin');
insert into proveedores (codigo, nombre) values (503, 'Smitham-Volkman');
insert into proveedores (codigo, nombre) values (504, 'Thompson-Tillman');
insert into proveedores (codigo, nombre) values (505, 'Schuppe-Parker');
insert into proveedores (codigo, nombre) values (506, 'Marvin, Paucek and Wiegand');
insert into proveedores (codigo, nombre) values (507, 'McCullough Group');
insert into proveedores (codigo, nombre) values (508, 'Moen-Reichert');
insert into proveedores (codigo, nombre) values (509, 'Abbott-Mraz');

insert into suministra (codigo_pieza, codigo_proveedor, precio) values (0, 500, 5.66);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (1, 501, 12.50);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (2, 502, 8.99);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (3, 503, 6.99);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (4, 504, 4.55);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (5, 505, 3.44);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (6, 506, 1.33);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (7, 507, 6.31);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (8, 508, 4.48);
insert into suministra (codigo_pieza, codigo_proveedor, precio) values (9, 509, 1.41);

create database proyecto_cientifico;
use proyecto_cientifico;

create table cientificos(dni varchar(8), nom_apels varchar(255), PRIMARY KEY(dni));

create table proyecto(id varchar(4), nombre varchar(255), horas int, PRIMARY KEY(id));

create table asignado_a(dni_cientifico varchar(8), id_proyecto varchar(4), foreign key (dni_cientifico) references cientificos(dni) on delete cascade on update cascade,  foreign key (id_proyecto  ) references proyecto(id) on delete cascade on update cascade, PRIMARY KEY(dni_cientifico, id_proyecto));

INSERT INTO cientificos (dni,nom_apels) VALUES
('12345678', 'Alejandro Pérez'),
('23456789', 'Isabel García'),
('34567890', 'Luis Rodríguez'),
('45678901', 'Carmen López'),
('56789012', 'Juan Martínez'),
('67890123', 'Elena Sánchez'),
('78901234', 'Carlos Fernández'),
('89012345', 'Ana Torres'),
('90123456', 'Pedro Ramírez'),
('01234567', 'Laura González');
INSERT INTO proyecto (id,nombre, horas ) VALUES
('P001', 'Desarrollo de Software de Gestión', 100),
('P002', 'Seguridad Informática en Redes', 150),
('P003', 'Inteligencia Artificial y Aprendizaje Automático', 80),
('P004', 'Desarrollo de Aplicaciones Móviles', 120),
('P005', 'Gestión de Bases de Datos Empresariales', 200),
('P006', 'Ciberseguridad y Prevención de Amenazas', 90),
('P007', 'Automatización de Procesos Empresariales', 110),
('P008', 'Realidad Virtual y Aumentada', 160),
('P009', 'Diseño de Interfaces de Usuario', 70),
('P010', 'Analítica de Datos y Big Data', 130);
INSERT INTO asignado_a ( dni_cientifico, id_proyecto) VALUES
('12345678', 'P001'),
('23456789', 'P002'),
('34567890', 'P003'),
('45678901', 'P004'),
('56789012', 'P005'),
('67890123', 'P006'),
('78901234', 'P007'),
('89012345', 'P008'),
('90123456', 'P009'),
('01234567', 'P010');

create database almacenes;
use almacenes;

create table cajeros(codigo int, nombre varchar(255),PRIMARY KEY(codigo));
create table maquinas_registradoras(codigo int, piso int,PRIMARY KEY(codigo));
create table productos(codigo int, nombre varchar(255), precio int,PRIMARY KEY(codigo));

create table suministra(codigo_cajeros int,codigo_maquinas int,codigo_productos int,PRIMARY KEY(codigo_cajeros,codigo_maquinas,codigo_productos),
foreign key (codigo_cajeros) references cajeros(codigo) on delete cascade on update cascade,
foreign key (codigo_maquinas) references maquinas_registradoras(codigo) on delete cascade on update cascade,
foreign key (codigo_productos) references productos(codigo) on delete cascade on update cascade
);

-- —---------------------------inserts--------------------------------------------

insert into cajeros (codigo, nombre) values (0, 'Aitor Menta Luengo');
insert into cajeros (codigo, nombre) values (1, 'Benito Camelas');
insert into cajeros (codigo, nombre) values (2, 'Frederico Perez');
insert into cajeros (codigo, nombre) values (3, 'Fernando Lopez Perez');
insert into cajeros (codigo, nombre) values (4, 'Ester fernandez');
insert into cajeros (codigo, nombre) values (5, 'Laia Aleman');
insert into cajeros (codigo, nombre) values (6, 'Sierra Gomez');
insert into cajeros (codigo, nombre) values (7, 'Carmen Cantera');
insert into cajeros (codigo, nombre) values (8, 'Helena Nogal');
insert into cajeros (codigo, nombre) values (9, 'Paula Almodovar');

insert into maquinas_registradoras (codigo, piso) values (500, 0);
insert into maquinas_registradoras (codigo, piso) values (501, 0);
insert into maquinas_registradoras (codigo, piso) values (502, 0);
insert into maquinas_registradoras (codigo, piso) values (503, 0);
insert into maquinas_registradoras (codigo, piso) values (504, 1);
insert into maquinas_registradoras (codigo, piso) values (505, 2);
insert into maquinas_registradoras (codigo, piso) values (506, 1);
insert into maquinas_registradoras (codigo, piso) values (507, 3);
insert into maquinas_registradoras (codigo, piso) values (508, 4);
insert into maquinas_registradoras (codigo, piso) values (509, 4);

insert into productos (codigo, nombre, precio) values (1000, 'Pan', 1);
insert into productos (codigo, nombre, precio) values (1001, 'Jamon', 3);
insert into productos (codigo, nombre, precio) values (1002, 'Leche', 7);
insert into productos (codigo, nombre, precio) values (1003, 'Huevos', 4);
insert into productos (codigo, nombre, precio) values (1004, 'Galletas', 4);
insert into productos (codigo, nombre, precio) values (1005, 'Olivas', 5);
insert into productos (codigo, nombre, precio) values (1006, 'Aceite', 10);
insert into productos (codigo, nombre, precio) values (1007, 'Lenguado', 7);
insert into productos (codigo, nombre, precio) values (1008, 'Sardinas', 2);
insert into productos (codigo, nombre, precio) values (1009, 'Calamares', 5);

insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (0, 500, 1000);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (1, 501, 1001);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (2, 502, 1002);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (3, 503, 1003);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (4, 504, 1004);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (5, 505, 1005);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (6, 506, 1006);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (7, 507, 1007);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (8, 508, 1008);
insert into suministra (codigo_cajeros, codigo_maquinas, codigo_productos) values (9, 509, 1009);

create database investigadores;
use investigadores;

create table facultad(codigo int, nombre varchar(100), PRIMARY KEY(codigo));

create table investigadores(dni varchar(8), nom_apels varchar(255), facultad int, foreign key (facultad) references facultad(codigo) on delete cascade on update cascade, PRIMARY KEY(dni));

create table equipos(num_serie varchar(4), nombre varchar(100), facultad int, foreign key (facultad) references facultad(codigo) on delete cascade on update cascade, PRIMARY KEY(num_serie));

create table reserva(dni_cientifico varchar(8), num_equipo varchar(4),  comienzo date, fin date, foreign key (dni_cientifico) references investigadores(dni) on delete cascade on update cascade,  foreign key (num_equipo) references equipos(num_serie) on delete cascade on update cascade, PRIMARY KEY(dni_cientifico, num_equipo));

INSERT INTO facultad (codigo, nombre) VALUES
(101, 'Facultad de Ciencias'),
(102, 'Facultad de Ingeniería'),
(103, 'Facultad de Medicina'),
(104, 'Facultad de Derecho'),
(105, 'Facultad de Humanidades'),
(106, 'Facultad de Economía'),
(107, 'Facultad de Arquitectura'),
(108, 'Facultad de Psicología'),
(109, 'Facultad de Química'),
(110, 'Facultad de Educación');
INSERT INTO investigadores (dni, nom_apels, facultad) VALUES
('12345678', 'María Pérez', 101),
('23456789', 'Carlos López', 102),
('34567890', 'Laura Rodríguez', 103),
('45678901', 'Antonio García', 104),
('56789012', 'Ana Martínez', 105),
('67890123', 'Pedro Sánchez', 106),
('78901234', 'Elena Fernández', 107),
('89012345', 'Juan Torres', 108),
('90123456', 'Isabel Ramírez', 109),
('01234567', 'Luis González', 110);
INSERT INTO equipos (num_serie, nombre, facultad) VALUES
('E001', 'Equipo de Laboratorio 1', 101),
('E002', 'Equipo de Investigación 2', 102),
('E003', 'Equipo de Microscopía', 103),
('E004', 'Equipo de Simulación 4', 104),
('E005', 'Equipo de Análisis de Texto', 105),
('E006', 'Equipo de Laboratorio 6', 106),
('E007', 'Equipo de Arquitectura 7', 107),
('E008', 'Equipo de Psicología Experimental', 108),
('E009', 'Equipo de Química Analítica', 109),
('E010', 'Equipo de Educación 10', 110);
INSERT INTO reserva (dni_cientifico, num_equipo, comienzo, fin) VALUES
('12345678', 'E001', '2023-10-25', '2023-10-28'),
('23456789', 'E002', '2023-11-02', '2023-11-05'),
('34567890', 'E003', '2023-11-10', '2023-11-13'),
('45678901', 'E004', '2023-11-15', '2023-11-18'),
('56789012', 'E005', '2023-11-20', '2023-11-23'),
('67890123', 'E006', '2023-11-25', '2023-11-28'),
('78901234', 'E007', '2023-12-01', '2023-12-04'),
('89012345', 'E008', '2023-12-05', '2023-12-08'),
('90123456', 'E009', '2023-12-10', '2023-12-13'),
('01234567', 'E010', '2023-12-15', '2023-12-18');
