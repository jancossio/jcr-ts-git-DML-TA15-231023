-- biblioteca v1
create database bibliotecav1;
use bibliotecav1;

create table autores(id varchar(20),nombre varchar(40), PRIMARY KEY(id) );

create table libros(isbn varchar(20), editorial varchar(40), titulo varchar(35), anio_escritura int, PRIMARY KEY(isbn) );


create table escribir(id int auto_increment,isbn varchar(20), id_autor varchar(20), PRIMARY KEY(id),
 foreign key (isbn) references libros(isbn) on delete cascade on update cascade,
  foreign key (id_autor) references autores(id) on delete cascade on update cascade
 );

create table volumenes(id varchar(20), deteriorado boolean, isbn varchar(20),
 foreign key (isbn) references libros(isbn) on delete cascade on update cascade, PRIMARY KEY(id) );

create table personas(dni varchar(10), nombre varchar(30), apellidos varchar(40), direccion varchar(50), telefono varchar(12), cod_socio varchar(20), UNIQUE (cod_socio), PRIMARY KEY(dni) );

create table prestamos(id varchar(20), fecha_real date, fecha_prestamo date, id_volumen varchar(20), id_persona varchar(10),
 foreign key (id_volumen) references volumenes(id) on delete cascade on update cascade,
 foreign key (id_persona) references personas(dni) on delete cascade on update cascade, PRIMARY KEY(id)
 );
 INSERT INTO autores (id, nombre) VALUES
('A001', 'Juan Pérez'),
('A002', 'María Rodríguez'),
('A003', 'Luis González'),
('A004', 'Carmen Martínez'),
('A005', 'José López'),
('A006', 'Ana Sánchez'),
('A007', 'Carlos Fernández'),
('A008', 'Laura Torres'),
('A009', 'Manuel Ramírez'),
('A010', 'Isabel García');

INSERT INTO libros (isbn, editorial, titulo, anio_escritura) VALUES
('978-0061120084', 'HarperCollins', 'To Kill a Mockingbird', 1960),
('978-0062315007', 'HarperCollins', 'Go Set a Watchman', 2015),
('978-0743273565', 'Simon & Schuster', 'The Catcher in the Rye', 1951),
('978-0143111597', 'Penguin Books', 'The Great Gatsby', 1925),
('978-0060935467', 'HarperCollins', 'The Lord of the Rings', 1954),
('978-0140449266', 'Penguin Classics', 'Pride and Prejudice', 1813),
('978-0061124952', 'HarperCollins', '1984', 1949),
('978-0060721858', 'HarperCollins', 'Brave New World', 1932),
('978-0140283334', 'Penguin Classics', 'One Hundred Years of Solitude', 1967),
('978-0452284234', 'Plume', 'To the Lighthouse', 1927);

INSERT INTO escribir (isbn, id_autor) VALUES
('978-0061120084', 'A001'),
('978-0062315007', 'A001'),
('978-0062315007', 'A002'),
('978-0743273565', 'A003'),
('978-0143111597', 'A004'),
('978-0060935467', 'A005'),
('978-0140449266', 'A006'),
('978-0061124952', 'A007'),
('978-0060721858', 'A008'),
('978-0140283334', 'A009');

INSERT INTO volumenes (id, deteriorado, isbn) VALUES
('V001', false, '978-0061120084'),
('V002', false, '978-0062315007'),
('V003', true, '978-0743273565'),
('V004', false, '978-0143111597'),
('V005', false, '978-0060935467'),
('V006', false, '978-0140449266'),
('V007', true, '978-0061124952'),
('V008', false, '978-0060721858'),
('V009', false, '978-0140283334'),
('V010', true, '978-0452284234');

INSERT INTO personas (dni, nombre, apellidos, direccion, telefono, cod_socio) VALUES
('11111111A', 'Antoni', 'Garcia', 'Marques de montoliu,Tarragona', '123456789', 'S001'),
('22222222B', 'Laura', 'Fernandez', 'Carrer de la seta,Tarragona', '987654321', 'S002'),
('33333333C', 'Minerva', 'Aurona', 'Plaça imperial,Tarragona', '111223344', 'S003'),
('44444444D', 'Eloy', 'Caminos', 'Carrer de les oques,Tarragona', '555667788', 'S004'),
('55555555E', 'Emy', 'bordera', 'Bloc Xile 2o 4a,Tarragona', '888999000', 'S005'),
('66666666F', 'Alvaro', 'elisticio', 'Carrer de la vergonya,Tarragona', '222333444', 'S006'),
('77777777G', 'Mohamed', 'hemefroido', 'Font del pi,Tarragona', '666777888', 'S007'),
('88888888H', 'Mohamed', 'catenario', 'carrer misericordia,Tarragona', '444555666', 'S008'),
('99999999I', 'Silvia', 'abdul', 'carrer jojos,Tarragona', '999000111', 'S009'),
('10101010J', 'antoni', 'goriaca', 'carrer miralmar 2,Tarragona', '123123123', 'S010');

INSERT INTO prestamos (id, fecha_real, fecha_prestamo, id_volumen, id_persona) VALUES
('P001', '2023-10-15', '2023-10-20', 'V001', '11111111A'),
('P002', '2023-10-20', '2023-10-25', 'V002', '22222222B'),
('P003', '2023-10-25', '2023-10-30', 'V003', '33333333C'),
('P004', '2023-10-30', '2023-11-05', 'V004', '44444444D'),
('P005', '2023-11-05', '2023-11-10', 'V005', '55555555E'),
('P006', '2023-11-10', '2023-11-15', 'V006', '66666666F'),
('P007', '2023-11-15', '2023-11-20', 'V007', '77777777G'),
('P008', '2023-11-20', '2023-11-25', 'V008', '88888888H'),
('P009', '2023-11-25', '2023-11-30', 'V009', '99999999I'),
('P010', '2023-11-30', '2023-12-05', 'V010', '10101010J');

DELETE FROM `bibliotecav1`.`libros` WHERE (`isbn` = '978-0140283334');
UPDATE `bibliotecav1`.`libros` SET `anio_escritura` = '1943' WHERE (`isbn` = '978-0061120084');
UPDATE `bibliotecav1`.`libros` SET `editorial` = 'Anonimo' WHERE (`isbn` = '978-0743273565');

--  academia
create database academia;
use academia;

create table empresa(cif varchar(40),nombre varchar(40), telefono varchar(40),direccion varchar(40), PRIMARY KEY(cif) );
create table profesor(dni varchar(40),direccion varchar(40), nombre varchar(40),apellidos varchar(40),telefono varchar(40), PRIMARY KEY(dni) );
create table alumno(dni varchar(40),direccion varchar(40), nombre varchar(40),edad int,telefono varchar(40),cif_empresa varchar(40),
foreign key (cif_empresa) references empresa(cif) on delete cascade on update cascade, PRIMARY KEY(dni) );

create table curso(cod_curso int,fecha_inicio date,fecha_final date,dni_profesor varchar(40), PRIMARY KEY(cod_curso),
foreign key (dni_profesor) references profesor(dni) on delete cascade on update cascade );

create table cursar(dni_alumno varchar(40),codigo_curso int, PRIMARY KEY(dni_alumno,codigo_curso),
foreign key (dni_alumno) references alumno(dni) on delete cascade on update cascade,
foreign key (codigo_curso) references curso(cod_curso) on delete cascade on update cascade );
 
 create table edicion(codigo int,codigo_curso int,programa varchar(400),horas_duracion int, PRIMARY KEY(codigo),
 foreign key (codigo_curso) references curso(cod_curso) on delete cascade on update cascade );


-- ------------------------------inserts-------------------------------------------

insert into empresa (cif, nombre, telefono, direccion) values ('BCR', 'Weissnat, Torp and Abshire', '785 133 3192', '8856 Hanson Trail');
insert into empresa (cif, nombre, telefono, direccion) values ('RCO', 'Gerhold, Cummings and Sporer', '310 228 2553', '79 Eastlawn Parkway');
insert into empresa (cif, nombre, telefono, direccion) values ('VEX', 'Oberbrunner, Mayert and Morissette', '199 447 5071', '887 Kingsford Junction');
insert into empresa (cif, nombre, telefono, direccion) values ('AMA', 'Roob, Kessler and Farrell', '147 757 2329', '0 Novick Place');
insert into empresa (cif, nombre, telefono, direccion) values ('WAT', 'Vandervort, Adams and Feeney', '340 308 3241', '2415 Northwestern Junction');
insert into empresa (cif, nombre, telefono, direccion) values ('OEC', 'Sauer LLC', '628 801 3025', '914 Sage Lane');
insert into empresa (cif, nombre, telefono, direccion) values ('NPH', 'Flatley Inc', '902 812 6622', '800 Carioca Street');
insert into empresa (cif, nombre, telefono, direccion) values ('KDQ', 'Medhurst Group', '273 152 8488', '81833 Marquette Place');
insert into empresa (cif, nombre, telefono, direccion) values ('TDP', 'Stehr LLC', '200 703 8988', '81566 Aberg Lane');
insert into empresa (cif, nombre, telefono, direccion) values ('YUX', 'Kulas, Kshlerin and Olson', '668 474 2704', '75936 Nevada Point');

insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('IMO', '971 Magdeline Street', 'Gretta', 'Embury', '323 949 5874');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('ART', '3 Ridge Oak Plaza', 'Crosby', 'Doncom', '573 382 7130');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('PNC', '75703 Luster Parkway', 'Mikey', 'Piccop', '925 383 7608');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('CGP', '801 Paget Pass', 'Normie', 'Esp', '795 763 4742');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('TLP', '05 Manitowish Street', 'Romeo', 'Ellar', '679 631 7821');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('TCT', '4403 Superior Park', 'Chantal', 'Capelle', '852 597 6170');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('SCW', '03 Messerschmidt Junction', 'Josefina', 'Emmanuele', '561 495 4900');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('VLK', '86 Arkansas Street', 'Cristy', 'Wahncke', '170 645 8330');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('UCE', '6 Hollow Ridge Lane', 'Daniel', 'Kedward', '477 458 1587');
insert into profesor (dni, direccion, nombre, apellidos, telefono) values ('CQF', '392 Canary Court', 'Melanie', 'Cutcliffe', '584 465 0665');

insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('MRG', '5 Steensland Trail', 'Dill', '19', '609 669 0145','BCR');
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('GCI', '484 School Plaza', 'Florry', '22', '916 534 7530','RCO');
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('YLC', '9930 Katie Pass', 'Erny', '22', '966 491 6463','VEX');
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('KWJ', '58 Pine View Crossing', 'Fanni', '23', '135 638 9781','AMA');
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('LIB', '00434 Surrey Parkway', 'Viviana', 34, '373 312 1239','WAT');
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('BNM', '4547 Marquette Point', 'Tyson', '20', '445 739 3428','OEC');
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('NVK', '66148 Goodland Way', 'Jacynth', '44', '189 678 9733','NPH');
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('MYT', '9 Granby Junction', 'Erick', '37', '411 473 4022',"KDQ");
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('KUM', '07 Lakeland Pass', 'Ximenez', '35', '287 842 9591',"TDP");
insert into alumno (dni, direccion, nombre, edad, telefono, cif_empresa) values ('KGL', '3668 Laurel Junction', 'Neala', '23', '261 507 4156','YUX');

insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (66, str_to_date('12/12/2022', '%m/%d/%Y'), str_to_date('07/03/2023', '%m/%d/%Y'), 'IMO');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (150, str_to_date('3/29/2023', '%m/%d/%Y'), str_to_date('6/21/2023', '%m/%d/%Y'), 'ART');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (0, str_to_date('8/2/2023', '%m/%d/%Y'), str_to_date('3/19/2023', '%m/%d/%Y'), 'PNC');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (6609, str_to_date('1/20/2023', '%m/%d/%Y'), str_to_date('1/16/2023', '%m/%d/%Y'), 'CGP');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (384, str_to_date('4/12/2023', '%m/%d/%Y'), str_to_date('2/4/2023', '%m/%d/%Y'), 'TCT');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (189, str_to_date('3/30/2023', '%m/%d/%Y'), str_to_date('6/20/2023', '%m/%d/%Y'), 'TLP');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (1335, str_to_date('5/1/2023', '%m/%d/%Y'), str_to_date('7/30/2023', '%m/%d/%Y'), 'SCW');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (637, str_to_date('3/24/2023', '%m/%d/%Y'), str_to_date('4/25/2023', '%m/%d/%Y'), 'VLK');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (230, str_to_date('12/18/2022', '%m/%d/%Y'), str_to_date('3/29/2023', '%m/%d/%Y'), 'UCE');
insert into curso (cod_curso, fecha_inicio, fecha_final, dni_profesor) values (6, str_to_date('5/28/2023', '%m/%d/%Y'), str_to_date('2/1/2023', '%m/%d/%Y'), 'CQF');

insert into cursar (dni_alumno, codigo_curso) values ('MRG', 66);
insert into cursar (dni_alumno, codigo_curso) values ('GCI', 150);
insert into cursar (dni_alumno, codigo_curso) values ('YLC', 0);
insert into cursar (dni_alumno, codigo_curso) values ('KWJ', 6609);
insert into cursar (dni_alumno, codigo_curso) values ('LIB', 384);
insert into cursar (dni_alumno, codigo_curso) values ('BNM', 189);
insert into cursar (dni_alumno, codigo_curso) values ('NVK', 1335);
insert into cursar (dni_alumno, codigo_curso) values ('MYT', 637);
insert into cursar (dni_alumno, codigo_curso) values ('KUM', 230);
insert into cursar (dni_alumno, codigo_curso) values ('KGL', 6);

insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (100, 66, 'Formate en la programacion de Java Angular', 300);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (101, 150, 'Drainage of Sigmoid Colon, Open Approach, Diagnostic', 280);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (102, 0, 'Removal of Nonaut Sub from R Patella, Open Approach', 180);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (103, 6609, 'MRI of Bi Breast using Oth Contrast', 100);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (104, 384, 'Insert Infusion Dev in Epididymis/Sperm Cord, Via Opening', 350);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (105, 189, 'Insertion of Intralum Dev into L Pulm Vein, Perc Approach', 200);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (106, 1335, 'Dilate R Brach Art, Bifurc, w 4+ Intralum Dev, Perc Endo', 400);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (107, 637, 'Removal of Synth Sub from Male Perineum, Open Approach', 125);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (108, 230, 'Repair Left Vertebral Vein, Percutaneous Approach', 275);
insert into edicion (codigo, codigo_curso, programa, horas_duracion) values (109, 6, 'Insertion of Intralum Dev into L Pulm Vein, Perc Approach', 400);


UPDATE `academia`.`empresa` SET `nombre` = 'TSystems' WHERE (`cif` = 'OEC');
UPDATE `academia`.`empresa` SET `nombre` = 'Apple' WHERE (`cif` = 'TDP');
DELETE FROM `academia`.`empresa` WHERE (`cif` = 'VEX');

DELETE FROM `academia`.`alumno` WHERE (`dni` = 'KUM');
DELETE FROM `academia`.`alumno` WHERE (`dni` = 'KGL');

-- provincias

create database provincias;
use provincias;

create table comunidad(nombre varchar(40),poblacion bigint, superficie int, primary key(nombre));
create table provincia(cp int(2),nombre varchar(40),poblacion bigint, superficie int, primary key(cp));
create table localidad(id_localidad int,nombre varchar(40),poblacion bigint,cp_provincia int,nombre_comunidad varchar(40),capital_provincia int, primary key(id_localidad),
foreign key (cp_provincia) references provincia(cp) on delete cascade on update cascade,
foreign key (capital_provincia) references provincia(cp) on delete cascade on update cascade,
foreign key (nombre_comunidad) references comunidad(nombre) on delete cascade on update cascade
 );

INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Nueva York', 8000000, 468484);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('California', 39000000, 423968);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Texas', 29000000, 695662);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Florida', 21000000, 170312);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Illinois', 13000000, 149955);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Pennsylvania', 13000000, 119280);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Ohio', 11600000, 116098);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Georgia', 10600000, 153910);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Michigan', 10000000, 250487);
INSERT INTO comunidad (nombre, poblacion, superficie) VALUES ('Arizona', 7000000, 295234);

INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (01, 'Nueva York', 2000000, 54556);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (02, 'Los Ángeles', 4000000, 1214);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (03, 'Houston', 2300000, 2314);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (04, 'Miami', 700000, 1456);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (05, 'Chicago', 2700000, 606);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (06, 'Filadelfia', 1600000, 368);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (07, 'Cleveland', 1300000, 459);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (08, 'Atlanta', 550000, 133);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (09, 'Detroit', 670000, 370);
INSERT INTO provincia (cp, nombre, poblacion, superficie) VALUES (10, 'Phoenix', 1600000, 1341);

INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (1, 'New York City', 8500000, 01, 'Nueva York', 01);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (2, 'Los Angeles', 3900000, 02, 'California', 02);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (3, 'Houston', 2300000, 03, 'Texas', 03);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (4, 'Miami', 400000, 04, 'Florida', 04);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (5, 'Chicago', 2700000, 05, 'Illinois', 05);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (6, 'Philadelphia', 1500000, 06, 'Pennsylvania', 06);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (7, 'Cleveland', 400000, 07, 'Ohio', 07);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (8, 'Atlanta', 500000, 08, 'Georgia', 08);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (9, 'Detroit', 670000, 09, 'Michigan', 09);
INSERT INTO localidad (id_localidad, nombre, poblacion, cp_provincia, nombre_comunidad, capital_provincia) VALUES (10, 'Phoenix', 1700000, 10, 'Arizona', 10);

DELETE FROM `provincias`.`provincia` WHERE (`cp` = '5');
DELETE FROM `provincias`.`provincia` WHERE (`cp` = '8');
UPDATE `provincias`.`provincia` SET `nombre` = 'Campo claro' WHERE (`cp` = '2');

-- guerras

create database guerras;
use guerras;

create table guerra(id int auto_increment, nombre varchar(40), ano_inicio date,ano_final date, primary key(id)
);
create table bando(nombre varchar(40), ganador boolean, id_guerra int, foreign key (id_guerra ) references guerra(id)  on delete cascade on update cascade , primary key(nombre));

create table pais(id int auto_increment,nombre varchar(40),existente boolean,ano_inicio date,ano_final date, primary key(id));

create table participa(id int auto_increment, bando varchar(40),id_pais int, entrada_bando date, salida_bando date, primary key(id),
foreign key (bando) references bando(nombre)  on delete cascade on update cascade,
foreign key (id_pais) references pais(id)  on delete cascade on update cascade
);


-- ------------------------------------------insert-------------------------------------------

insert into guerra (id, nombre, ano_inicio, ano_final) values (1, 'Primera Guerra Mundial', str_to_date('1/14/1914', '%m/%d/%Y'), str_to_date('5/28/1918', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (2, 'Guerra civil espaniola', str_to_date('6/1/1936', '%m/%d/%Y'), str_to_date('4/14/1939', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (3, 'Segunda Guerra Mundial', str_to_date('9/9/1939', '%m/%d/%Y'), str_to_date('1/21/1945', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (4, 'Guerra fria', str_to_date('6/30/1947', '%m/%d/%Y'), str_to_date('8/24/1991', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (5, 'Guerra Vietnam', str_to_date('3/2/1964', '%m/%d/%Y'), str_to_date('5/18/1975', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (6, 'Invasion Irak', str_to_date('9/7/2003', '%m/%d/%Y'), str_to_date('4/4/2003', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (7, 'Revolucion Francesa', str_to_date('10/19/1789', '%m/%d/%Y'), str_to_date('11/5/1799', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (8, 'Revolucion Rusa', str_to_date('5/10/1917', '%m/%d/%Y'), str_to_date('1/6/1991', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (9, 'Guerra Cien Anios', str_to_date('6/14/1337', '%m/%d/%Y'), str_to_date('10/11/1453', '%m/%d/%Y'));
insert into guerra (id, nombre, ano_inicio, ano_final) values (10, 'Guerra independencia cubana', str_to_date('4/24/1895', '%m/%d/%Y'), str_to_date('11/27/1898', '%m/%d/%Y'));

insert into bando (nombre, ganador, id_guerra) values ('Triple Entente', true, 1);
insert into bando (nombre, ganador, id_guerra) values ('Bando Nacional', true, 2);
insert into bando (nombre, ganador, id_guerra) values ('El eje', false, 3);
insert into bando (nombre, ganador, id_guerra) values ('Bloque Occidental', true, 4);
insert into bando (nombre, ganador, id_guerra) values ('Vietnam del Sur', false, 5);
insert into bando (nombre, ganador, id_guerra) values ('Los talibanes', true, 6);
insert into bando (nombre, ganador, id_guerra) values ('Bando revolucionario', true, 7);
insert into bando (nombre, ganador, id_guerra) values ('Los bolcheviques', true, 8);
insert into bando (nombre, ganador, id_guerra) values ('Casa de Valois', true, 9);
insert into bando (nombre, ganador, id_guerra) values ('Bando Cubano-Americano', true, 10);

insert into pais (id, nombre, existente, ano_inicio, ano_final) values (101, 'Indonesia', true, str_to_date('1/5/2023', '%m/%d/%Y'), str_to_date('3/30/2023', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (102, 'China', true, str_to_date('3/8/2023', '%m/%d/%Y'), str_to_date('5/30/2023', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (103, 'Sweden', false, str_to_date('7/9/2023', '%m/%d/%Y'), str_to_date('3/30/2023', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (104, 'South Africa', true, str_to_date('7/26/2023', '%m/%d/%Y'), str_to_date('8/15/2023', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (105, 'France', true, str_to_date('12/27/2022', '%m/%d/%Y'), str_to_date('3/17/2023', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (106, 'China', false, str_to_date('5/10/2023', '%m/%d/%Y'), str_to_date('8/1/2023', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (107, 'Greece', true, str_to_date('2/7/2023', '%m/%d/%Y'), str_to_date('11/23/2022', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (108, 'Ukraine', true, str_to_date('5/2/2023', '%m/%d/%Y'), str_to_date('10/23/2022', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (109, 'Indonesia', false, str_to_date('7/30/2023', '%m/%d/%Y'), str_to_date('2/14/2023', '%m/%d/%Y'));
insert into pais (id, nombre, existente, ano_inicio, ano_final) values (110, 'China', false, str_to_date('11/20/2022', '%m/%d/%Y'), str_to_date('7/15/2023', '%m/%d/%Y'));

insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (201, 'Triple Entente', 101,  str_to_date('9/6/2023', '%m/%d/%Y'),  str_to_date('2/3/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (202, 'Bando Nacional', 102,  str_to_date('8/9/2023', '%m/%d/%Y'),  str_to_date('3/30/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (203, 'El eje', 103,  str_to_date('2/17/2023', '%m/%d/%Y'),  str_to_date('9/6/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (204, 'Bloque Occidental', 104,  str_to_date('5/14/2023', '%m/%d/%Y'),  str_to_date('3/16/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (205, 'Vietnam del Sur', 105,  str_to_date('4/5/2023', '%m/%d/%Y'),  str_to_date('4/18/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (206, 'Los talibanes', 106,  str_to_date('7/17/2023', '%m/%d/%Y'),  str_to_date('1/21/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (207, 'Bando revolucionario', 107,  str_to_date('10/6/2023', '%m/%d/%Y'),  str_to_date('3/18/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (208, 'Los bolcheviques', 108,  str_to_date('11/7/2022', '%m/%d/%Y'),  str_to_date('3/29/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (209, 'Casa de Valois', 109,  str_to_date('3/12/2023', '%m/%d/%Y'),  str_to_date('3/12/2023', '%m/%d/%Y'));
insert into participa (id, bando, id_pais, entrada_bando, salida_bando) values (210, 'Bando Cubano-Americano', 110,  str_to_date('4/16/2023', '%m/%d/%Y'),  str_to_date('12/23/2022', '%m/%d/%Y'));


DELETE FROM `guerras`.`pais` WHERE (`id` = '109');
DELETE FROM `guerras`.`pais` WHERE (`id` = '103');
UPDATE `guerras`.`pais` SET `nombre` = 'Spain' WHERE (`id` = '101');
UPDATE `guerras`.`pais` SET `nombre` = 'Cuba' WHERE (`id` = '107');

DELETE FROM `guerras`.`guerra` WHERE (`id` = '6');
DELETE FROM `guerras`.`guerra` WHERE (`id` = '8');
UPDATE `guerras`.`guerra` SET `ano_final` = '1975-04-30' WHERE (`id` = '5');
UPDATE `guerras`.`guerra` SET `ano_final` = '1799-11-09' WHERE (`id` = '7');

DELETE FROM `guerras`.`participa` WHERE (`id` = '209');

-- alamcen estanteria
CREATE DATABASE almacenDeEstanteria;
USE almacenDeEstanteria;
CREATE TABLE estanteria (
	letra VARCHAR(40) PRIMARY KEY
);
CREATE TABLE almacen (
	numero INT PRIMARY KEY,
	descripcion VARCHAR(255),
	direccion VARCHAR(255)
);
CREATE TABLE modelo (
	nombre VARCHAR(40) PRIMARY KEY
);
CREATE TABLE pieza (
	letra  VARCHAR(40),
	nombre_modelo VARCHAR(40),
	precio_venta DOUBLE,
	PRIMARY KEY (letra),
	FOREIGN KEY (nombre_modelo) REFERENCES modelo(nombre)
);
CREATE TABLE secompone (
	id INT AUTO_INCREMENT PRIMARY KEY,
	letra_pieza1  VARCHAR(40),
	letra_pieza2  VARCHAR(40),
	FOREIGN KEY (letra_pieza1) REFERENCES pieza(letra),
	FOREIGN KEY (letra_pieza2) REFERENCES pieza(letra)
);
CREATE TABLE guarda (
	id INT AUTO_INCREMENT PRIMARY KEY,
	letra_pieza  VARCHAR(40),
	letra_estanteria  VARCHAR(40),
	FOREIGN KEY (letra_pieza) REFERENCES pieza(letra),
	FOREIGN KEY (letra_estanteria) REFERENCES estanteria(letra)
);
CREATE TABLE contiene (
	id INT AUTO_INCREMENT PRIMARY KEY,
	almacen_id INT,
	letra_estanteria  VARCHAR(40),
	FOREIGN KEY (almacen_id) REFERENCES almacen(numero),
	FOREIGN KEY (letra_estanteria) REFERENCES estanteria(letra)
);

INSERT INTO estanteria (letra) VALUES
('A'),
('B'),
('C'),
('D'),
('E'),
('F'),
('G'),
('H'),
('I'),
('J');
INSERT INTO almacen (numero, descripcion, direccion) VALUES
(1, 'Almacén Tarragona', 'Dirección 1'),
(2, 'Almacén Reus', 'Dirección 2'),
(3, 'Almacén Valls', 'Dirección 3'),
(4, 'Almacén Vimbodi', 'Dirección 4'),
(5, 'Almacén Castello', 'Dirección 5'),
(6, 'Almacén Barcelona', 'Dirección 6'),
(7, 'Almacén Viladecans', 'Dirección 7'),
(8, 'Almacén Riudoms', 'Dirección 8'),
(9, 'Almacén Pallaresos', 'Dirección 9'),
(10, 'Almacén Vendrell', 'Dirección 10');
INSERT INTO modelo (nombre) VALUES
('Llave thor'),
('Tornillo 5mm'),
('Tuerca 3mm'),
('Tornillo 45mm'),
('Tuerca 5mm'),
('Tuerca 6mm'),
('Tornillo 7mm'),
('Tuerca 8mm'),
('Visagra 9mm'),
('Tuerca 10mm');
INSERT INTO pieza (letra, nombre_modelo, precio_venta) VALUES
('P1', 'Llave thor', 19.99),
('P2', 'Tornillo 5mm', 24.99),
('P3', 'Tuerca 3mm', 14.99),
('P4', 'Tuerca 3mm', 29.99),
('P5', 'Tuerca 10mm', 9.99),
('P6', 'Tuerca 10mm', 34.99),
('P7', 'Tuerca 10mm', 17.99),
('P8', 'Tuerca 6mm', 39.99),
('P9', 'Llave thor', 12.99),
('P10','Visagra 9mm', 49.99);
INSERT INTO secompone (letra_pieza1, letra_pieza2) VALUES
('P1', 'P2'),
('P2', 'P3'),
('P3', 'P4'),
('P4', 'P5'),
('P5', 'P6'),
('P6', 'P7'),
('P7', 'P8'),
('P8', 'P9'),
('P9', 'P10'),
('P10', 'P1');
INSERT INTO guarda (letra_pieza, letra_estanteria) VALUES
('P1', 'A'),
('P2', 'B'),
('P3', 'C'),
('P4', 'D'),
('P5', 'E'),
('P6', 'F'),
('P7', 'G'),
('P8', 'H'),
('P9', 'I'),
('P10', 'J');
INSERT INTO contiene (almacen_id, letra_estanteria) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F'),
(7, 'G'),
(8, 'H'),
(9, 'I'),
(10, 'J');

UPDATE `almacenDeEstanteria`.`guarda` SET `letra_pieza` = 'P1' WHERE (`id` = '10');
UPDATE `almacenDeEstanteria`.`guarda` SET `letra_estanteria` = 'A' WHERE (`id` = '20');
DELETE FROM `almacenDeEstanteria`.`guarda` WHERE (`id` = '19');

-- biblioteca v2
create database bibliotecav2;
use bibliotecav2;

create table socio(dni varchar(40), cod_socio varchar(40), UNIQUE (cod_socio), direccion varchar(40), nombre varchar(40),apellidos varchar(40), PRIMARY KEY(dni) );

create table telefono(numero varchar(12),  dni_socio varchar(10), foreign key (dni_socio ) references socio (dni) on delete cascade on update cascade, PRIMARY KEY(numero) );

create table obra(id varchar(20),  anio_creacion int, nombre varchar(24), resumen varchar(250), PRIMARY KEY(id) );
create table articulo(cod_articulo varchar(40),deteriorado boolean, resumen_deterioro varchar(250), id_obra varchar(20), foreign key (id_obra) references obra(id) on delete cascade on update cascade, PRIMARY KEY(cod_articulo) );

create table prestamo(id varchar(20),  fecha_prestamo date, fecha_tope date, entregado boolean, fecha_entrega date, dni_socio varchar(10), cod_articulo varchar(40), foreign key (dni_socio) references socio (dni) on delete cascade on update cascade, foreign key (cod_articulo ) references articulo(cod_articulo ) on delete cascade on update cascade, PRIMARY KEY(id) );




create table autor(nombre varchar(12),  pais varchar(36), PRIMARY KEY(nombre) );

create table crea(nombre_autor varchar(12),  id_obra varchar(20), foreign key (nombre_autor) references autor(nombre) on delete cascade on update cascade,
foreign key (id_obra ) references obra(id) on delete cascade on update cascade );

create table cd(id varchar(12),  num_canciones int, PRIMARY KEY(id),cod_obra varchar(20),  foreign key (cod_obra) references obra(id) on delete cascade on update cascade);

create table libro(id varchar(12),   num_paginas int, PRIMARY KEY(id), cod_obra varchar(20),  foreign key (cod_obra) references obra(id) on delete cascade on update cascade);

create table pelicula(id varchar(12),  duracion int, PRIMARY KEY(id),  cod_obra varchar(20),  foreign key (cod_obra) references obra(id) on delete cascade on update cascade );



-- -----------------------------------INSERTS-------------------------------------

insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('12345678P', 'AAJA', '86 Chive Crossing', 'Nevsa', 'Schnieder');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('98765432L', 'PHJH', '3528 Vermont Way', 'Thibaud', 'Todarello');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('10293847K', 'DTNH', '076 Morning Court', 'Kassie', 'Dowdall');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('01928374G', 'KSAT', '1 Shopko Hill', 'Boyd', 'Dendle');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('56473829X', 'YMRW', '253 Manufacturers Alley', 'Revkah', 'Butland');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('01928374J', 'SKJU', '5876 Anderson Road', 'Giuditta', 'Luxen');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('10299384Z', 'AGGQ', '85702 Hermina Lane', 'Ursola', 'Kreuzer');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('99227733Y', 'KBMG', '3064 Stephen Drive', 'Kirsten', 'Roper');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('83334859F', 'Z13', '37793 Dexter Terrace', 'Robina', 'Gerb');
insert into socio (dni, cod_socio, direccion, nombre, apellidos) values ('91123473U', 'CZEE', '607 Onsgard Terrace', 'Giovanni', 'Aiskrigg');

insert into telefono (numero, dni_socio) values ('856-874-1619', '12345678P');
insert into telefono (numero, dni_socio) values ('482-897-7997', '98765432L');
insert into telefono (numero, dni_socio) values ('523-670-3242', '10293847K');
insert into telefono (numero, dni_socio) values ('964-618-4597', '01928374G');
insert into telefono (numero, dni_socio) values ('204-213-3446', '56473829X');
insert into telefono (numero, dni_socio) values ('895-455-0859', '01928374J');
insert into telefono (numero, dni_socio) values ('683-820-9617', '10299384Z');
insert into telefono (numero, dni_socio) values ('156-852-5897', '99227733Y');
insert into telefono (numero, dni_socio) values ('943-374-7258', '83334859F');
insert into telefono (numero, dni_socio) values ('211-140-5298', '91123473U');

insert into obra (id, anio_creacion, nombre, resumen) values ('AAA', 1967, 'Icon', 'Revision of Autol Sub in Pancreat Duct, Open Approach');
insert into obra (id, anio_creacion, nombre, resumen) values ('ABA', 1986, 'Seas Beneath', 'Supplement L Renal Art with Nonaut Sub, Perc Endo Approach');
insert into obra (id, anio_creacion, nombre, resumen) values ('CBC', 1998, 'Quo Vadis, Baby?', 'Drainage of Head, Percutaneous Approach, Diagnostic');
insert into obra (id, anio_creacion, nombre, resumen) values ('OPD', 2001, 'Love Happy', 'Release Right Abdomen Tendon, Percutaneous Approach');
insert into obra (id, anio_creacion, nombre, resumen) values ('PDF', 2014, 'Father and Guns', 'Dilation of Jejunum with Intraluminal');
insert into obra (id, anio_creacion, nombre, resumen) values ('LPM', 2007, 'Shit Year', 'Drainage of Right Lacrimal Bone, Perc Endo Approach, Diagn');
insert into obra (id, anio_creacion, nombre, resumen) values ('DKB', 2009, 'Aliens in the Attic', 'Occlusion of Sigmoid Colon with Intralum Dev, Via Opening');
insert into obra (id, anio_creacion, nombre, resumen) values ('BCN', 2011, 'La hora de los hornos', 'Release Pelvic Subcu/Fascia, Extern Approach');
insert into obra (id, anio_creacion, nombre, resumen) values ('TGN', 2003, 'Steel Toes', 'Insertion of Int Fix into L Ankle Jt, Perc Endo Approach');
insert into obra (id, anio_creacion, nombre, resumen) values ('SNW', 2002, 'Croods, The', 'Dilation of Left Large Intestine with Intralum Dev, Endo');

insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('AFAF', true, 'Reattachment of Right Inguinal Region, Open Approach', 'AAA');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('KIKO', false, 'Insert of Intramed Fix into L Humeral Shaft, Perc Approach', 'ABA');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('POIL', true, 'CT Scan of Kidney Transplant using Oth Contrast', 'CBC');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('ASDF', true, 'Occlusion of Duodenum, Percutaneous Endoscopic Approach', 'OPD');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('WDSA', false, 'Excision of Left Axillary Artery, Open Approach, Diagnostic', 'PDF');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('STLD', false, 'Fusion of L Metacarpocarp Jt with Int Fix, Perc Approach', 'LPM');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('MUNI', false, 'Repair Left Patella, Open Approach', 'DKB');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('TFGS', false, 'Resection of Aortic Body, Percutaneous Endoscopic Approach', 'BCN');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('FODS', true, 'Removal of Nonaut Sub from R Low Femur, Perc Approach', 'TGN');
insert into articulo (cod_articulo, deteriorado, resumen_deterioro, id_obra) values ('SOSO', false, 'Replacement of R Acetabulum with Nonaut Sub, Open Approach', 'SNW');

insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('AHGA', str_to_date('8/15/2023', '%m/%d/%Y'), str_to_date('10/3/2023', '%m/%d/%Y'), true, str_to_date('9/10/2023', '%m/%d/%Y'), '12345678P', 'AFAF');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('PHDT', str_to_date('6/18/2022', '%m/%d/%Y'), str_to_date('10/13/2023', '%m/%d/%Y'), true, str_to_date('8/18/2023', '%m/%d/%Y'), '98765432L', 'KIKO');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('Glenn', str_to_date('1/21/2023', '%m/%d/%Y'), str_to_date('2/26/2023', '%m/%d/%Y'), true, str_to_date('2/8/2023', '%m/%d/%Y'), '10293847K', 'POIL');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('PZTN', str_to_date('4/12/2023', '%m/%d/%Y'), str_to_date('6/11/2023', '%m/%d/%Y'), false, null, '01928374G', 'ASDF');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('IJNH', str_to_date('1/22/2023', '%m/%d/%Y'), str_to_date('2/17/2023', '%m/%d/%Y'), true, str_to_date('2/11/2023', '%m/%d/%Y'), '56473829X', 'WDSA');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('TYUY', str_to_date('6/5/2023', '%m/%d/%Y'), str_to_date('8/21/2023', '%m/%d/%Y'), true, str_to_date('7/6/2023', '%m/%d/%Y'), '01928374J', 'STLD');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('OPPE', str_to_date('6/9/2023', '%m/%d/%Y'), str_to_date('10/16/2023', '%m/%d/%Y'), false, null, '10299384Z', 'MUNI');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('HUHI', str_to_date('10/8/2022', '%m/%d/%Y'), str_to_date('12/16/2023', '%m/%d/%Y'), false, null, '99227733Y', 'TFGS');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('YAIG', str_to_date('5/14/2023', '%m/%d/%Y'), str_to_date('6/10/2023', '%m/%d/%Y'), true, str_to_date('5/15/2023', '%m/%d/%Y'), '83334859F', 'FODS');
insert into prestamo (id, fecha_prestamo, fecha_tope, entregado, fecha_entrega, dni_socio, cod_articulo) values ('POLO', str_to_date('1/15/2023', '%m/%d/%Y'), str_to_date('5/17/2023', '%m/%d/%Y'), false, null, '91123473U', 'SOSO');

insert into autor (nombre, pais) values ('Brew', 'Chile');
insert into autor (nombre, pais) values ('Tildi', 'China');
insert into autor (nombre, pais) values ('Viole', 'Bosnia and Herzegovina');
insert into autor (nombre, pais) values ('Towney', 'Indonesia');
insert into autor (nombre, pais) values ('Emlyn', 'United States');
insert into autor (nombre, pais) values ('Tawnya', 'Canada');
insert into autor (nombre, pais) values ('Blinnie', 'Philippines');
insert into autor (nombre, pais) values ('Orsa', 'Peru');
insert into autor (nombre, pais) values ('Aharon', 'China');
insert into autor (nombre, pais) values ('Gerard', 'Philippines');

insert into crea (nombre_autor, id_obra) values ('Brew', 'AAA');
insert into crea (nombre_autor, id_obra) values ('Tildi', 'ABA');
insert into crea (nombre_autor, id_obra) values ('Viole', 'CBC');
insert into crea (nombre_autor, id_obra) values ('Towney', 'OPD');
insert into crea (nombre_autor, id_obra) values ('Emlyn', 'PDF');
insert into crea (nombre_autor, id_obra) values ('Tawnya', 'LPM');
insert into crea (nombre_autor, id_obra) values ('Blinnie', 'DKB');
insert into crea (nombre_autor, id_obra) values ('Orsa', 'BCN');
insert into crea (nombre_autor, id_obra) values ('Aharon', 'TGN');
insert into crea (nombre_autor, id_obra) values ('Gerard', 'SNW');

insert into cd (id, num_canciones, cod_obra) values ('PHA', 20, 'AAA');
insert into cd (id, num_canciones, cod_obra) values ('BRB', 56, 'ABA');
insert into cd (id, num_canciones, cod_obra) values ('USC', 48, 'CBC');
insert into cd (id, num_canciones, cod_obra) values ('IED', 30, 'OPD');
insert into cd (id, num_canciones, cod_obra) values ('GREF', 54, 'PDF');
insert into cd (id, num_canciones, cod_obra) values ('USG', 56, 'LPM');
insert into cd (id, num_canciones, cod_obra) values ('AOH', 36, 'DKB');
insert into cd (id, num_canciones, cod_obra) values ('PFI', 5, 'BCN');
insert into cd (id, num_canciones, cod_obra) values ('BFJ', 820, 'TGN');
insert into cd (id, num_canciones, cod_obra) values ('MXK', 175, 'SNW');

insert into libro (id, num_paginas, cod_obra) values ('AUZ', 20, 'AAA');
insert into libro (id, num_paginas, cod_obra) values ('HNY', 56, 'ABA');
insert into libro (id, num_paginas, cod_obra) values ('MVX', 48, 'CBC');
insert into libro (id, num_paginas, cod_obra) values ('INW', 30, 'OPD');
insert into libro (id, num_paginas, cod_obra) values ('PLV', 54, 'PDF');
insert into libro (id, num_paginas, cod_obra) values ('GHU', 56, 'LPM');
insert into libro (id, num_paginas, cod_obra) values ('UST', 36, 'DKB');
insert into libro (id, num_paginas, cod_obra) values ('IDS', 5, 'BCN');
insert into libro (id, num_paginas, cod_obra) values ('USR', 820, 'TGN');
insert into libro (id, num_paginas, cod_obra) values ('PTQ', 175, 'SNW');

insert into pelicula (id, duracion, cod_obra) values ('ARJ', 20, 'AAA');
insert into pelicula (id, duracion, cod_obra) values ('ESP', 56, 'ABA');
insert into pelicula (id, duracion, cod_obra) values ('USO', 48, 'CBC');
insert into pelicula (id, duracion, cod_obra) values ('UZN', 30, 'OPD');
insert into pelicula (id, duracion, cod_obra) values ('PYM', 54, 'PDF');
insert into pelicula (id, duracion, cod_obra) values ('BRL', 56, 'LPM');
insert into pelicula (id, duracion, cod_obra) values ('ECK', 36, 'DKB');
insert into pelicula (id, duracion, cod_obra) values ('LKI', 5, 'BCN');
insert into pelicula (id, duracion, cod_obra) values ('RUH', 820, 'TGN');
insert into pelicula (id, duracion, cod_obra) values ('JPG', 175, 'SNW');

DELETE FROM `bibliotecav2`.`obra` WHERE (`id` = 'CBC');
DELETE FROM `bibliotecav2`.`obra` WHERE (`id` = 'AAA');
UPDATE `bibliotecav2`.`obra` SET `nombre` = 'Happy New Year' WHERE (`id` = 'LPM');

-- contratos

 create database contratos;
use contratos;

create table categoria(nombre varchar(40),primary key(nombre));
create table contrato(cod_contrato int,fecha_inicio date,fecha_final date,nombre_categoria varchar(40), primary key(cod_contrato),
foreign key (nombre_categoria) references categoria(nombre)  on delete cascade on update cascade
);
create table empleado(dni varchar(40),numSS varchar(40),cod_trabajador int, nombre varchar(40),apellidos varchar(40),direccion varchar(40),cod_contrato int,primary key(dni),
foreign key (cod_contrato) references contrato(cod_contrato)  on delete cascade on update cascade
);

create table departamento(cod_departamento int,nombre varchar(40),dni_coordinador varchar(40), primary key(cod_departamento),
foreign key (dni_coordinador) references empleado(dni)  on delete cascade on update cascade
);


create table supervisa(id int auto_increment,supervisor varchar(40),supervisado varchar(40), primary key(id),
foreign key (supervisor) references empleado(dni)  on delete cascade on update cascade,
foreign key (supervisado) references empleado(dni)  on delete cascade on update cascade
);

create table pertenece(id int auto_increment,dni_empleado varchar(40),cod_departamento int, primary key(id),
foreign key (dni_empleado) references empleado(dni)  on delete cascade on update cascade,
foreign key (cod_departamento) references departamento(cod_departamento)  on delete cascade on update cascade
);

create table nomina(id int auto_increment,fecha date,salario double, primary key(id));

create table genera(id int auto_increment,cod_contrato int, id_nomina int, primary key(id),
foreign key (id_nomina) references nomina(id)  on delete cascade on update cascade,
foreign key (cod_contrato) references contrato(cod_contrato)  on delete cascade on update cascade
);


INSERT INTO categoria (nombre) VALUES ('Junior');
INSERT INTO categoria (nombre) VALUES ('Midle');
INSERT INTO categoria (nombre) VALUES ('Senior');
INSERT INTO categoria (nombre) VALUES ('Capataz');
INSERT INTO categoria (nombre) VALUES ('Limpiador');
INSERT INTO categoria (nombre) VALUES ('Analista');
INSERT INTO categoria (nombre) VALUES ('Marketing');
INSERT INTO categoria (nombre) VALUES ('Asesor');
INSERT INTO categoria (nombre) VALUES ('Jardinero');
INSERT INTO categoria (nombre) VALUES ('SEO');

INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (1, '2023-01-01', '2023-12-31', 'Junior');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (2, '2023-02-01', '2023-11-30', 'Junior');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (3, '2023-03-01', '2023-10-31', 'Senior');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (4, '2023-04-01', '2023-09-30', 'Limpiador');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (5, '2023-05-01', '2023-08-31', 'Marketing');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (6, '2023-06-01', '2023-07-31', 'Marketing');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (7, '2023-07-01', '2023-06-30', 'Marketing');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (8, '2023-08-01', '2023-05-31', 'Marketing');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (9, '2023-09-01', '2023-04-30', 'Marketing');
INSERT INTO contrato (cod_contrato, fecha_inicio, fecha_final, nombre_categoria) VALUES (10, '2023-10-01', '2023-03-31', 'Marketing');

INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI1', 'SS1', 1, 'Empleado 1', 'Apellido 1', 'Direccion 1', 1);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI2', 'SS2', 2, 'Empleado 2', 'Apellido 2', 'Direccion 2', 2);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI3', 'SS3', 3, 'Empleado 3', 'Apellido 3', 'Direccion 3', 3);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI4', 'SS4', 4, 'Empleado 4', 'Apellido 4', 'Direccion 4', 4);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI5', 'SS5', 5, 'Empleado 5', 'Apellido 5', 'Direccion 5', 5);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI6', 'SS6', 6, 'Empleado 6', 'Apellido 6', 'Direccion 6', 6);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI7', 'SS7', 7, 'Empleado 7', 'Apellido 7', 'Direccion 7', 7);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI8', 'SS8', 8, 'Empleado 8', 'Apellido 8', 'Direccion 8', 8);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI9', 'SS9', 9, 'Empleado 9', 'Apellido 9', 'Direccion 9', 9);
INSERT INTO empleado (dni, numSS, cod_trabajador, nombre, apellidos, direccion, cod_contrato) VALUES ('DNI10', 'SS10', 10, 'Empleado 10', 'Apellido 10', 'Direccion 10', 10);

INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (1, 'Departamento 1', 'DNI1');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (2, 'Departamento 2', 'DNI2');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (3, 'Departamento 3', 'DNI3');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (4, 'Departamento 4', 'DNI4');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (5, 'Departamento 5', 'DNI5');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (6, 'Departamento 6', 'DNI6');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (7, 'Departamento 7', 'DNI7');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (8, 'Departamento 8', 'DNI8');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (9, 'Departamento 9', 'DNI9');
INSERT INTO departamento (cod_departamento, nombre, dni_coordinador) VALUES (10, 'Departamento 10', 'DNI10');

INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI1', 'DNI2');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI2', 'DNI3');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI3', 'DNI4');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI4', 'DNI5');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI5', 'DNI6');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI6', 'DNI7');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI7', 'DNI8');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI8', 'DNI9');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI9', 'DNI10');
INSERT INTO supervisa (supervisor, supervisado) VALUES ('DNI10', 'DNI1');

INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI1', 1);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI2', 2);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI3', 3);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI4', 4);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI5', 5);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI6', 6);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI7', 7);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI8', 8);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI9', 9);
INSERT INTO pertenece (dni_empleado, cod_departamento) VALUES ('DNI10', 10);

INSERT INTO nomina (fecha, salario) VALUES ('2023-01-31', 2500.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-02-28', 2600.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-03-31', 2700.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-04-30', 2800.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-05-31', 2900.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-06-30', 3000.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-07-31', 3100.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-08-31', 3200.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-09-30', 3300.00);
INSERT INTO nomina (fecha, salario) VALUES ('2023-10-31', 3400.00);

INSERT INTO genera (cod_contrato, id_nomina) VALUES (1, 1);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (2, 2);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (3, 3);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (4, 4);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (5, 5);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (6, 6);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (7, 7);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (8, 8);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (9, 9);
INSERT INTO genera (cod_contrato, id_nomina) VALUES (10, 10);

UPDATE `contratos`.`departamento` SET `nombre` = 'Recursos humanos' WHERE (`cod_departamento` = '3');
DELETE FROM `contratos`.`departamento` WHERE (`cod_departamento` = '7');
DELETE FROM `contratos`.`departamento` WHERE (`cod_departamento` = '8');
UPDATE `contratos`.`departamento` SET `nombre` = 'Marketing' WHERE (`cod_departamento` = '1');

-- vuelos
create database losVuelos;
use losVuelos;

create table tarjeta_embarque (
    id_tarj_emb int auto_increment primary key,num_reserva int,fecha date
);
create table cliente (
    dni varchar(20) primary key,nombre varchar(255),apellidos varchar(255),direccion varchar(255),telefono varchar(20),tarjeta varchar(20),id_tarj_emb int,
    foreign key (id_tarj_emb) references tarjeta_embarque(id_tarj_emb)  on delete cascade on update cascade
);
create table aeropuerto (
    codigo_aerop varchar(20) primary key,nombre varchar(255),localidad varchar(255)
);
create table vuelo (
    codigo varchar(20) primary key,fecha date,hora_salida time,hora_llegada time,codigo_aerop_lleg varchar(20),codigo_aerop_sal varchar(20), 
    foreign key (codigo_aerop_lleg) references aeropuerto(codigo_aerop)  on delete cascade on update cascade,
foreign key (codigo_aerop_sal) references aeropuerto(codigo_aerop) on delete cascade on update cascade
);
create table avion (
    codigo varchar(20) primary key,num_plazas int,codigo_vuelo varchar(20),
    foreign key (codigo_vuelo) references vuelo(codigo) on delete cascade on update cascade
);
create table asiento (
    fila varchar(20),columna varchar(20),plaza varchar(20),dni_cliente varchar(20),id_tarj_emb int, codigo_avion varchar(20),
    foreign key (dni_cliente) references cliente(dni)  on delete cascade on update cascade,
    foreign key (id_tarj_emb) references tarjeta_embarque(id_tarj_emb)  on delete cascade on update cascade,
	foreign key (codigo_avion) references avion(codigo)  on delete cascade on update cascade   
);

insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (1, 101, str_to_date('1/14/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (2, 102, str_to_date('1/16/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (3, 103, str_to_date('1/18/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (4, 104, str_to_date('8/25/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (5, 105, str_to_date('4/26/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (6, 106, str_to_date('9/19/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (7, 107, str_to_date('2/20/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (8, 108, str_to_date('2/5/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (9, 109, str_to_date('2/16/2023', '%m/%d/%Y'));
insert into tarjeta_embarque (id_tarj_emb, num_reserva, fecha) values (10, 110, str_to_date('2/6/2023', '%m/%d/%Y'));

insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('78993704A', 'Adélaïde', 'Westnedge', '99 Texas Drive', '802 141 1892', '3759641465', 1);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('14737924B', 'Anaé', 'Laycock', '2046 Redwing Street', '890 919 9343', '3914554155', 2);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('14861075C', 'Simplifiés', 'Wrettum', '1 5th Trail', '432 167 5458', '2832482391', 3);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('83574094D', 'Réservés', 'Southerns', '6 Anderson Avenue', '387 940 6276', '8872493115', 4);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('18916848F', 'Torbjörn', 'Posselwhite', '790 Tennessee Avenue', '478 224 0007', '2716987570', 5);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('21291454E', 'Régine', 'Edlin', '6 Pepper Wood Crossing', '211 813 0379', '2346879174', 6);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('48358739J', 'Angélique', 'Ingyon', '95546 Armistice Avenue', '352 648 2713', '1035391456', 7);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('57629531H', 'Cloé', 'Kilbride', '841 Boyd Drive', '333 926 1257', '4403999326', 8);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('81915718N', 'Lucrèce', 'Lots', '5710 Victoria Crossing', '564 612 5682', '7185846434', 9);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta, id_tarj_emb) values ('66211027K', 'Léonie', 'Cecil', '18476 Shasta Avenue', '238 703 4974', '5927677598', 10);

insert into aeropuerto (codigo_aerop, nombre, localidad) values ('UHPP', 'Yelizovo Airport', '31 Granby Point');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('LZPP', 'Piešťany Airport', '7 Hooker Hill');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('DIGA', 'Gagnoa Airport', '13906 Di Loreto Crossing');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('ZUAL', 'Ngari Gunsa Airport', '4741 Pierstorff Court');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('KOLF', 'L M Clayton Airport', '06 Muir Junction');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('KBMG', 'Monroe County Airport', '764 Dayton Terrace');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('ME16', 'Loring International Airport', '8 Messerschmidt Court');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('LHMC', 'Miskolc Airport', '514 Fulton Street');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('CYXJ', 'Fort St John Airport', '1679 Forest Run Center');
insert into aeropuerto (codigo_aerop, nombre, localidad) values ('SNKI', 'Cachoeiro do Itapemirim Airport', '4369 Raven Street');

insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('KCOI', str_to_date('1/22/2023', '%m/%d/%Y'), '4:24:00', '4:24:00', 'UHPP', 'SNKI');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('FZEA', str_to_date('9/5/2023', '%m/%d/%Y'), '7:37:00', '9:48:00', 'LZPP', 'UHPP');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('CAU8', str_to_date('8/20/2023', '%m/%d/%Y'), '1:26:00', '4:34:00', 'DIGA', 'LZPP');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('PADM', str_to_date('4/5/2023', '%m/%d/%Y'), '8:32:00', '5:00:00', 'CYXJ', 'LHMC');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('WIOP', str_to_date('5/16/2023', '%m/%d/%Y'), '2:42:00', '5:45:00', 'KOLF', 'LHMC');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('URKA', str_to_date('11/23/2022', '%m/%d/%Y'), '10:52:00', '12:59:00', 'CYXJ', 'SNKI');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('AAGA', str_to_date('9/18/2023', '%m/%d/%Y'), '11:28:00', '10:31:00', 'KBMG', 'CYXJ');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('PATA', str_to_date('9/6/2023', '%m/%d/%Y'), '9:33:00', '7:33:00', 'ME16', 'DIGA');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('ZGOW', str_to_date('12/20/2022', '%m/%d/%Y'), '3:24:00', '6:17:00', 'KOLF', 'ZUAL');
insert into vuelo (codigo, fecha, hora_salida, hora_llegada, codigo_aerop_sal, codigo_aerop_lleg) values ('FMMY', str_to_date('2/14/2023', '%m/%d/%Y'), '1:49:00', '6:19:00', 'SNKI', 'LZPP');

insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAA', 90, 'KCOI');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAB', 80, 'FZEA');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAC', 85, 'CAU8');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAD', 87, 'PADM');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAF', 83, 'WIOP');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAG', 75, 'URKA');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAH', 70, 'AAGA');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAI', 77, 'PATA');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('AAAJ', 73, 'ZGOW');
insert into avion (codigo, num_plazas, codigo_vuelo) values ('OTIS', 82, 'FMMY');

insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('1', '1', 'Z71', '78993704A', 1, 'AAAA');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('2', '2', 'CYGT', '14737924B', 2, 'AAAB');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('3', '3', 'KALW', '14861075C', 3, 'AAAC');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('4', '1', 'OPSU', '83574094D', 4, 'AAAD');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('5', '2', 'AYQA', '18916848F', 5, 'AAAF');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('6', '3', 'HLLQ', '21291454E', 6, 'AAAG');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('7', '3', 'EGNJ', '48358739J', 7, 'AAAH');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('8', '2', 'SARA', '57629531H', 8, 'AAAI');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('9', '1', 'RORS', '81915718N', 9, 'AAAJ');
insert into asiento (fila, columna, plaza, dni_cliente, id_tarj_emb, codigo_avion) values ('10', '3', 'KEFK', '66211027K', 10, 'OTIS');

DELETE FROM `losVuelos`.`vuelo` WHERE (`codigo` = 'FZEA');
DELETE FROM `losVuelos`.`vuelo` WHERE (`codigo` = 'PATA');
UPDATE `losVuelos`.`vuelo` SET `fecha` = '2023-10-23' WHERE (`codigo` = 'CAU8');
UPDATE `losVuelos`.`vuelo` SET `hora_salida` = '14:45:00' WHERE (`codigo` = 'AAGA');

--  recetas

create database receta;
use receta;

create table receta(id int auto_increment,titulo varchar(40),resumen varchar(40), dificultad int, PRIMARY KEY(id) );
create table alimento(id int auto_increment,nombre varchar(40), PRIMARY KEY(id) );

create table ingrediente(id int auto_increment,unidades int,gramos int,litros double,id_alimento int, PRIMARY KEY(id) ,
foreign key (id_alimento) references alimento(id) on delete cascade on update cascade);

create table utensilio(id int auto_increment,nombre varchar(40), primary key(id));

create table procedimiento(id int auto_increment,Descripcion varchar(40),minutos int,id_utensilio int, id_ingrediente int, primary key(id),
foreign key (id_utensilio) references utensilio(id) on delete cascade on update cascade,
foreign key (id_ingrediente) references ingrediente(id) on delete cascade on update cascade
);

create table Incluir(id int auto_increment,id_receta int, id_procedimiento int, PRIMARY KEY(id) ,
foreign key (id_receta) references receta(id) on delete cascade on update cascade,
foreign key (id_procedimiento) references procedimiento(id) on delete cascade on update cascade
);
insert into receta (titulo, resumen, dificultad) values ('pollo asado', 'una deliciosa receta de pollo', 3);
insert into receta (titulo, resumen, dificultad) values ('pasta carbonara', 'clásica pasta italiana', 2);
insert into receta (titulo, resumen, dificultad) values ('ensalada césar', 'refrescante y saludable', 2);
insert into receta (titulo, resumen, dificultad) values ('tarta de manzana', 'postre casero', 1);
insert into receta (titulo, resumen, dificultad) values ('sushi de salmón', 'sushi japonés', 3);
insert into receta (titulo, resumen, dificultad) values ('hamburguesa casera', 'una hamburguesa sabrosa', 2);
insert into receta (titulo, resumen, dificultad) values ('sopa de tomate', 'perfecta para el invierno', 2);
insert into receta (titulo, resumen, dificultad) values ('pescado al horno', 'pescado fresco', 1);
insert into receta (titulo, resumen, dificultad) values ('tacos de carne', 'comida mexicana', 3);
insert into receta (titulo, resumen, dificultad) values ('risotto de champiñones', 'plato italiano', 2);
insert into alimento (nombre) values ('pollo');
insert into alimento (nombre) values ('pasta');
insert into alimento (nombre) values ('lechuga');
insert into alimento (nombre) values ('manzanas');
insert into alimento (nombre) values ('salmón');
insert into alimento (nombre) values ('carne molida');
insert into alimento (nombre) values ('tomates');
insert into alimento (nombre) values ('pescado');
insert into alimento (nombre) values ('tortillas');
insert into alimento (nombre) values ('champiñones');
insert into ingrediente (unidades, gramos, litros, id_alimento) values (2, 200, 0, 1);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (1, 250, 0, 2);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (2, 100, 0, 3);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (4, 300, 0, 4);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (3, 150, 0, 5);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (2, 200, 0, 6);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (3, 120, 0, 7);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (2, 250, 0, 8);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (4, 200, 0, 9);
insert into ingrediente (unidades, gramos, litros, id_alimento) values (2, 180, 0, 10);
insert into utensilio (nombre) values ('horno');
insert into utensilio (nombre) values ('sartén');
insert into utensilio (nombre) values ('cuchillo');
insert into utensilio (nombre) values ('bandeja para horno');
insert into utensilio (nombre) values ('olla');
insert into utensilio (nombre) values ('batidora');
insert into utensilio (nombre) values ('cacerola');
insert into utensilio (nombre) values ('parrilla');
insert into utensilio (nombre) values ('tenedor');
insert into utensilio (nombre) values ('tabla de cortar');
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('hornear el pollo', 30, 1, 1);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('cocinar la pasta', 20, 2, 2);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('lavar y cortar la lechuga', 10, 3, 3);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('pelar y cortar las manzanas', 15, 4, 4);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('preparar el salmón', 25, 5, 5);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('cocinar la carne molida', 15, 6, 6);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('picar los tomates', 10, 7, 7);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('hornear el pescado', 25, 8, 8);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('preparar las tortillas', 20, 9, 9);
insert into procedimiento (descripcion, minutos, id_utensilio, id_ingrediente) values ('saltear los champiñones', 15, 10, 10);

UPDATE `receta`.`alimento` SET `nombre` = 'fresas' WHERE (`id` = '4');
DELETE FROM `receta`.`alimento` WHERE (`id` = '5');
DELETE FROM `receta`.`alimento` WHERE (`id` = '6');
DELETE FROM `receta`.`alimento` WHERE (`id` = '7');

-- futbol

create database futbol;
use futbol;

create table liga(id varchar(40), nombre varchar(40), PRIMARY KEY(id) );

create table arbitro(codigo varchar(40), nombre varchar(40), apellido varchar(40), edad int, PRIMARY KEY(codigo) );

create table temporada(id varchar(12),  dni_socio varchar(10), fecha_inicio date,  fecha_final date, id_liga varchar(40), foreign key (id_liga  ) references liga(id) on delete cascade on update cascade, PRIMARY KEY(id) );

create table entrenador(codigo varchar(20),  nombre varchar(40), apellidos varchar(40), edad int, PRIMARY KEY(codigo) );

create table equipo(cod_equipo varchar(12),   nombre varchar(40), cod_entrenador varchar(12), foreign key (cod_entrenador ) references entrenador(codigo) on delete cascade on update cascade, PRIMARY KEY(cod_equipo) );

create table partido(codigo varchar(20), num_goles_visitante int,  num_goles_local int, cod_arbitro varchar(40), cod_eq_local varchar(12), cod_eq_visitante varchar(12),  id_temporada varchar(12),
 foreign key (cod_arbitro) references arbitro(codigo) on delete cascade on update cascade,
 foreign key (cod_eq_local) references equipo(cod_equipo) on delete cascade on update cascade,
 foreign key (cod_eq_visitante) references equipo(cod_equipo)on delete cascade on update cascade,
 foreign key (id_temporada ) references temporada(id) on delete cascade on update cascade, PRIMARY KEY(codigo) );

create table jugador(codigo varchar(12),  nombre varchar(20), apellidos varchar(20), edad int, posicion varchar(20), cod_equipo varchar(12),
 foreign key (cod_equipo) references equipo(cod_equipo) on delete cascade on update cascade, PRIMARY KEY(codigo) );

-- ----------------------------------------------------------------------------------------------------------------

insert into liga (id, nombre) values ('HAHM', 'Primera Division Masculina');
insert into liga (id, nombre) values ('EGPF', 'Segunda Division Masculina');
insert into liga (id, nombre) values ('UKLC', 'Primera Federacion Masculina');
insert into liga (id, nombre) values ('DA14', 'Segunda Federacion Masculina');
insert into liga (id, nombre) values ('UUUU', 'Tercera Federacion Masculina');
insert into liga (id, nombre) values ('YLIS', 'Primera Division Femenina');
insert into liga (id, nombre) values ('GNUB', 'Segunda Division Femenina');
insert into liga (id, nombre) values ('WAWS', 'Primera Federacion Femenina');
insert into liga (id, nombre) values ('KGLW', 'Segunda Federacion Femenina');
insert into liga (id, nombre) values ('CZPB', 'Tercera Federacion Femenina');

insert into arbitro (codigo, nombre, apellido, edad) values ('AAAA', 'Shirl', 'Hassent', 31);
insert into arbitro (codigo, nombre, apellido, edad) values ('AAAB', 'Ruth', 'Cleugh', 27);
insert into arbitro (codigo, nombre, apellido, edad) values ('ACAA', 'Antonetta', 'Justice', 34);
insert into arbitro (codigo, nombre, apellido, edad) values ('AADA', 'Biron', 'Graysmark', 44);
insert into arbitro (codigo, nombre, apellido, edad) values ('AAAE', 'Gabriel', 'Gussin', 53);
insert into arbitro (codigo, nombre, apellido, edad) values ('AAAF', 'Farrah', 'Allder', 60);
insert into arbitro (codigo, nombre, apellido, edad) values ('AGAA', 'Deonne', 'Frith', 57);
insert into arbitro (codigo, nombre, apellido, edad) values ('WWAW', 'Umeko', 'Folshom', 58);
insert into arbitro (codigo, nombre, apellido, edad) values ('AYAY', 'Arielle', 'Jukubczak', 39);
insert into arbitro (codigo, nombre, apellido, edad) values ('ZAZE', 'Neysa', 'Guise', 40);

insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('CYYL', 'Flin', str_to_date('5/21/2023', '%m/%d/%Y'),  str_to_date('3/17/2023', '%m/%d/%Y'), 'HAHM');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('SNBO', 'Dan', str_to_date('12/25/2022', '%m/%d/%Y'), str_to_date('10/24/2022', '%m/%d/%Y'), 'EGPF');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('HABC', 'Anica', str_to_date('3/25/2023', '%m/%d/%Y'), str_to_date('8/4/2023', '%m/%d/%Y'), 'UKLC');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('VLSV', 'Bobbette', str_to_date('7/23/2023', '%m/%d/%Y'), str_to_date('1/3/2023', '%m/%d/%Y'), 'DA14');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('ZUXC', 'Georg', str_to_date('3/18/2023', '%m/%d/%Y'), str_to_date('11/20/2022', '%m/%d/%Y'), 'EGPF');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('FZGN', 'Crysta', str_to_date('8/6/2023', '%m/%d/%Y'), str_to_date('12/4/2022', '%m/%d/%Y'), 'YLIS');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('SSWS', 'Page', str_to_date('12/29/2022', '%m/%d/%Y'), str_to_date('7/2/2023', '%m/%d/%Y'), 'GNUB');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('KWVI', 'Kennith', str_to_date('5/15/2023', '%m/%d/%Y'), str_to_date('5/30/2023', '%m/%d/%Y'), 'WAWS');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('KEAR', 'Carlie', str_to_date('11/2/2022', '%m/%d/%Y'), str_to_date('10/16/2023', '%m/%d/%Y'), 'KGLW');
insert into temporada (id, dni_socio, fecha_inicio, fecha_final, id_liga) values ('PAKW', 'Lottie', str_to_date('1/27/2023', '%m/%d/%Y'), str_to_date('7/20/2023', '%m/%d/%Y'), 'CZPB');

insert into entrenador (codigo, nombre, apellidos, edad) values ('EDACO', 'Bernadina', 'Laidlow', 31);
insert into entrenador (codigo, nombre, apellidos, edad) values ('KTCCP', 'Algernon', 'Vasyukhin', 23);
insert into entrenador (codigo, nombre, apellidos, edad) values ('AYBHQ', 'Hube', 'Tattersall', 24);
insert into entrenador (codigo, nombre, apellidos, edad) values ('OYAAR', 'Isac', 'Mawd', 34);
insert into entrenador (codigo, nombre, apellidos, edad) values ('CYYRS', 'Winna', 'Barbier', 51);
insert into entrenador (codigo, nombre, apellidos, edad) values ('ZAZAT', 'Lurette', 'Shaw', 46);
insert into entrenador (codigo, nombre, apellidos, edad) values ('AYQAU', 'Elianore', 'Kindall', 47);
insert into entrenador (codigo, nombre, apellidos, edad) values ('SAZTV', 'Anetta', 'Boggas', 38);
insert into entrenador (codigo, nombre, apellidos, edad) values ('KHSGW', 'Milt', 'Huggan', 49);
insert into entrenador (codigo, nombre, apellidos, edad) values ('WMPRX', 'Gill', 'Niesing', 30);

insert into equipo (cod_equipo, nombre, cod_entrenador) values ('SBSPR', 'Betis', 'EDACO');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('ZMDNF', 'Barcelona', 'KTCCP');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('DEDED', 'Real MAdrid', 'AYBHQ');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('CYHTA', 'Manchester City', 'OYAAR');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('SUPUB', 'Liverpool', 'CYYRS');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('ENZVC', 'Chelsea', 'ZAZAT');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('CNH2D', 'Bayern Munich', 'AYQAU');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('SAWPF', 'Juventus', 'SAZTV');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('KWLDG', 'Inter Milan', 'KHSGW');
insert into equipo (cod_equipo, nombre, cod_entrenador) values ('OERYH', 'Ajax', 'WMPRX');

insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('GQNHAA', 1, 1, 'AAAA', 'ENZVC', 'SBSPR', 'CYYL');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('KLEWAB', 1, 2, 'AAAB', 'CNH2D', 'ZMDNF', 'SNBO');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('LEASAC', 1, 3, 'ACAA', 'SAWPF', 'DEDED', 'HABC');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('SAVBAE', 7, 4, 'AADA', 'SAWPF', 'CYHTA', 'VLSV');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('LFDHFAF', 5, 3, 'AAAE', 'KWLDG', 'SUPUB', 'ZUXC');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('KCDAZA', 2, 1, 'AAAF', 'OERYH', 'ENZVC', 'FZGN');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('LFOHYA', 0, 1, 'AGAA', 'SBSPR', 'CNH2D', 'SSWS');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('HKWJXA', 3, 3, 'WWAW', 'ZMDNF', 'SAWPF', 'KWVI');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('YUYUWA', 1, 0, 'AYAY', 'DEDED', 'KWLDG', 'KEAR');
insert into partido (codigo, num_goles_visitante, num_goles_local, cod_arbitro, cod_eq_local, cod_eq_visitante, id_temporada) values ('VCCCVA', 4, 2, 'ZAZE', 'CYHTA', 'OERYH', 'PAKW');

insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('FMAASG', 'Tonie', 'Warrier', 21, 'Portero', 'SBSPR');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('HAABGL', 'Pepe', 'Nyland', 22, 'Delantero', 'ZMDNF');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('VNACMN', 'Ailey', 'Slyvester', 23, 'Delantero', 'DEDED');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('UHADNN', 'Mechelle', 'Blyde', 34, 'Defensa', 'CYHTA');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('KAAELB', 'Harp', 'Higbin', 28, 'Centro-Campista', 'SUPUB');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('ZJAFSY', 'Glennis', 'Kristof', 31, 'Defensa', 'ENZVC');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('KEAGIB', 'Holden', 'Tilte', 27, 'Defensa', 'CNH2D');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('KDAHAY', 'Mellicent', 'Levings', 28, 'Delantero', 'SAWPF');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('OIAIAH', 'Timoteo', 'Cowdroy', 33, 'Portero', 'KWLDG');
insert into jugador (codigo, nombre, apellidos, edad, posicion, cod_equipo) values ('AGAJRC', 'Jessalin', 'Plaxton', 30, 'Defensa', 'OERYH');



DELETE FROM `futbol`.`equipo` WHERE (`cod_equipo` = 'ENZVC');
DELETE FROM `futbol`.`equipo` WHERE (`cod_equipo` = 'CNH2D');
UPDATE `futbol`.`equipo` SET `cod_entrenador` = 'AYBHQ' WHERE (`cod_equipo` = 'OERYH');
UPDATE `futbol`.`equipo` SET `cod_entrenador` = 'EDACO' WHERE (`cod_equipo` = 'SUPUB');

DELETE FROM `futbol`.`temporada` WHERE (`id` = 'CYYL');
DELETE FROM `futbol`.`temporada` WHERE (`id` = 'FZGN');

-- accidentes

create database accidentes;
use accidentes;

create table localidad (id int auto_increment , nombre varchar(40),primary key(id));

create table pais (id int auto_increment, nombre varchar(40),primary key(id));

create table accidente (id int auto_increment , nombre varchar(40), coordenada_x double, coordenada_y double,primary key(id));

create table rio (id int auto_increment, longitud decimal, accidente_id int,primary key(id),
foreign key (accidente_id) references accidente(id)on delete cascade on update cascade);

create table lago (id int auto_increment, extension decimal, accidente_id int,primary key(id),
foreign key (accidente_id) references accidente(id)on delete cascade on update cascade);

create table montaña (id int auto_increment , altura decimal, accidente_id int,primary key(id),
foreign key (accidente_id) references accidente(id)on delete cascade on update cascade);

create table pasa (id int auto_increment, id_rio int, id_localidad int, primary key(id),
foreign key (id_rio) references rio(id)on delete cascade on update cascade,
foreign key (id_localidad) references localidad(id)on delete cascade on update cascade);

create table pertenece (id int auto_increment , id_accidente int, id_pais int,primary key(id),
foreign key (id_accidente) references accidente(id)on delete cascade on update cascade,
foreign key (id_pais) references pais(id)on delete cascade on update cascade);


insert into localidad (nombre) values ('barcelona');
insert into localidad (nombre) values ('racoon city');
insert into localidad (nombre) values ('vilafranca del mansplaining');
insert into localidad (nombre) values ('reus');
insert into localidad (nombre) values ('gotham');
insert into localidad (nombre) values ('silent hill');
insert into localidad (nombre) values ('malaga');
insert into localidad (nombre) values ('alicante');
insert into localidad (nombre) values ('murcia');
insert into localidad (nombre) values ('tarragona');
insert into pais (nombre) values ('españa');
insert into pais (nombre) values ('francia');
insert into pais (nombre) values ('uganda');
insert into pais (nombre) values ('narnia');
insert into pais (nombre) values ('reino unido');
insert into pais (nombre) values ('portugal');
insert into pais (nombre) values ('holanda');
insert into pais (nombre) values ('suiza');
insert into pais (nombre) values ('austria');
insert into pais (nombre) values ('belgica');
insert into accidente (nombre, coordenada_x, coordenada_y) values ('monte rostmore', 40.123, -3.456);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('la torre ennfiel', 45.678, -1.234);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('la mussara', 38.890, -2.345);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('aneto', 41.567, -4.321);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('barranc de la febro', 47.123, -1.789);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('cataratas del francoli', 39.345, -0.987);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('presa huber', 42.678, -3.567);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('mar muerto', 44.123, -0.678);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('montaña siurana', 37.890, -2.345);
insert into accidente (nombre, coordenada_x, coordenada_y) values ('arenas movedizas', 40.567, -1.234);
insert into rio (longitud, accidente_id) values (120.5, 1);
insert into rio (longitud, accidente_id) values (150.2, 2);
insert into rio (longitud, accidente_id) values (95.8, 3);
insert into rio (longitud, accidente_id) values (180.3, 4);
insert into rio (longitud, accidente_id) values (70.7, 5);
insert into rio (longitud, accidente_id) values (88.9, 6);
insert into rio (longitud, accidente_id) values (120.1, 7);
insert into rio (longitud, accidente_id) values (65.4, 8);
insert into rio (longitud, accidente_id) values (132.6, 9);
insert into rio (longitud, accidente_id) values (145.7, 10);
insert into lago (extension, accidente_id) values (2500.5, 1);
insert into lago (extension, accidente_id) values (1800.2, 2);
insert into lago (extension, accidente_id) values (3400.8, 3);
insert into lago (extension, accidente_id) values (4100.3, 4);
insert into lago (extension, accidente_id) values (2000.7, 5);
insert into lago (extension, accidente_id) values (1200.9, 6);
insert into lago (extension, accidente_id) values (3100.1, 7);
insert into lago (extension, accidente_id) values (2500.4, 8);
insert into lago (extension, accidente_id) values (1800.6, 9);
insert into lago (extension, accidente_id) values (3400.7, 10);
insert into montaña (altura, accidente_id) values (2800.5, 1);
insert into montaña (altura, accidente_id) values (3500.2, 2);
insert into montaña (altura, accidente_id) values (3900.8, 3);
insert into montaña (altura, accidente_id) values (4200.3, 4);
insert into montaña (altura, accidente_id) values (3100.7, 5);
insert into montaña (altura, accidente_id) values (2400.9, 6);
insert into montaña (altura, accidente_id) values (3300.1, 7);
insert into montaña (altura, accidente_id) values (2900.4, 8);
insert into montaña (altura, accidente_id) values (2700.6, 9);
insert into montaña (altura, accidente_id) values (3100.7, 10);
insert into pasa (id_rio, id_localidad) values (1, 1);
insert into pasa (id_rio, id_localidad) values (2, 2);
insert into pasa (id_rio, id_localidad) values (3, 3);
insert into pasa (id_rio, id_localidad) values (4, 4);

UPDATE `accidentes`.`accidente` SET `nombre` = 'barranc de les oques' WHERE (`id` = '5');
DELETE FROM `accidentes`.`accidente` WHERE (`id` = '7');
DELETE FROM `accidentes`.`accidente` WHERE (`id` = '10');

-- empresa software

create database empresa_software;
use empresa_software;

create table empresa(cif varchar(30),nombre varchar(30),direccion varchar(30),cod_interno varchar(30), PRIMARY KEY(cif) );
create table proyecto(id int auto_increment,fecha_inicio date,fecha_fin date, fecha_prev_fin date, PRIMARY KEY(id));
create table solicita(id int auto_increment,cif varchar(30), id_proyecto int,  PRIMARY KEY(id),
foreign key (id_proyecto) references proyecto(id) on delete cascade on update cascade,  
foreign key (cif) references empresa(cif) on delete cascade on update cascade
);
create table profesion(cod_profesion int auto_increment,nombre varchar(30), primary key(cod_profesion) );
create table trabajador(cod_trabajador int,dni varchar(30),nombre varchar(30),apellidos varchar(30), primary key(cod_trabajador));

create table info_proyecto_trabajador(id int auto_increment, cod_trabajador int, cod_profesion int, horas_trabajadas int, primary key(id),
foreign key (cod_trabajador) references trabajador(cod_trabajador) on delete cascade on update cascade,
foreign key (cod_profesion) references profesion(cod_profesion) on delete cascade on update cascade
);
create table trabaja(id int auto_increment, id_info_proyecto_trabajador int,id_proyecto int, primary key(id),
foreign key (id_info_proyecto_trabajador) references info_proyecto_trabajador(id) on delete cascade on update cascade,
foreign key (id_proyecto) references proyecto(id) on delete cascade on update cascade
);


insert into empresa (cif, nombre, direccion, cod_interno) values ('MMTP', 'Gabtune', '06205 Ridge Oak Park', 'SSUMA');
insert into empresa (cif, nombre, direccion, cod_interno) values ('AYUZ', 'Rhynoodle', '521 Ridgeview Place', 'LIMEB');
insert into empresa (cif, nombre, direccion, cod_interno) values ('KDFW', 'Shuffledrive', '80383 Miller Place', 'CZBDC');
insert into empresa (cif, nombre, direccion, cod_interno) values ('CYXH', 'Eare', '48597 Doe Crossing Center', 'AAAAD');
insert into empresa (cif, nombre, direccion, cod_interno) values ('KVPZ', 'Quinu', '108 La Follette Point', 'KBGDE');
insert into empresa (cif, nombre, direccion, cod_interno) values ('SAZO', 'Kazu', '5 Charing Cross Court', 'FWCDF');
insert into empresa (cif, nombre, direccion, cod_interno) values ('YJLC', 'Oba', '451 Starling Lane', 'ZSSHG');
insert into empresa (cif, nombre, direccion, cod_interno) values ('SBIT', 'Fiveclub', '1104 Sachs Way', 'BBBBH');
insert into empresa (cif, nombre, direccion, cod_interno) values ('FCOD', 'Fliptune', '82 Dawn Trail', 'LFCYI');
insert into empresa (cif, nombre, direccion, cod_interno) values ('SNAR', 'Eabox', '765 Scofield Avenue', 'OINZJ');

insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (1, str_to_date('1/25/2023', '%m/%d/%Y'), str_to_date('10/28/2022', '%m/%d/%Y'), str_to_date('9/13/2023', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (2, str_to_date('9/30/2023', '%m/%d/%Y'), str_to_date('6/30/2023', '%m/%d/%Y'), str_to_date('8/8/2023', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (3, str_to_date('5/18/2023', '%m/%d/%Y'), str_to_date('9/28/2023', '%m/%d/%Y'), str_to_date('5/13/2023', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (4, str_to_date('10/26/2022', '%m/%d/%Y'), str_to_date('6/28/2023', '%m/%d/%Y'), str_to_date('7/28/2023', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (5, str_to_date('11/2/2022', '%m/%d/%Y'), str_to_date('6/10/2023', '%m/%d/%Y'), str_to_date('12/7/2022', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (6, str_to_date('1/13/2023', '%m/%d/%Y'), str_to_date('10/19/2022', '%m/%d/%Y'), str_to_date('1/14/2023', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (7, str_to_date('11/14/2022', '%m/%d/%Y'), str_to_date('6/2/2023', '%m/%d/%Y'), str_to_date('10/26/2022', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (8, str_to_date('11/3/2022', '%m/%d/%Y'), str_to_date('12/14/2022', '%m/%d/%Y'), str_to_date('11/5/2022', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (9, str_to_date('6/20/2023', '%m/%d/%Y'), str_to_date('8/14/2023', '%m/%d/%Y'), str_to_date('11/15/2022', '%m/%d/%Y'));
insert into proyecto (id, fecha_inicio, fecha_fin, fecha_prev_fin) values (10, str_to_date('11/13/2022', '%m/%d/%Y'), str_to_date('10/23/2022', '%m/%d/%Y'), str_to_date('10/20/2022', '%m/%d/%Y'));

insert into solicita (id, cif, id_proyecto) values (101, 'MMTP', 1);
insert into solicita (id, cif, id_proyecto) values (102, 'AYUZ', 2);
insert into solicita (id, cif, id_proyecto) values (103, 'KDFW', 3);
insert into solicita (id, cif, id_proyecto) values (104, 'CYXH', 4);
insert into solicita (id, cif, id_proyecto) values (105, 'KVPZ', 5);
insert into solicita (id, cif, id_proyecto) values (106, 'SAZO', 6);
insert into solicita (id, cif, id_proyecto) values (107, 'YJLC', 7);
insert into solicita (id, cif, id_proyecto) values (108, 'SBIT', 8);
insert into solicita (id, cif, id_proyecto) values (109, 'FCOD', 9);
insert into solicita (id, cif, id_proyecto) values (110, 'SNAR', 10);

insert into profesion (cod_profesion, nombre) values (701, 'Manager');
insert into profesion (cod_profesion, nombre) values (702, 'Programador Junior');
insert into profesion (cod_profesion, nombre) values (703, 'Programador');
insert into profesion (cod_profesion, nombre) values (704, 'Programador');
insert into profesion (cod_profesion, nombre) values (705, 'Programador Junior');
insert into profesion (cod_profesion, nombre) values (706, 'Programador');
insert into profesion (cod_profesion, nombre) values (707, 'analista');
insert into profesion (cod_profesion, nombre) values (708, 'analista');
insert into profesion (cod_profesion, nombre) values (709, 'Jefe de proyecto');
insert into profesion (cod_profesion, nombre) values (710, 'Jefe de proyecto');

insert into profesion (cod_profesion, nombre) values (201, 'Analista');
insert into profesion (cod_profesion, nombre) values (202, 'Manager');
insert into profesion (cod_profesion, nombre) values (203, 'Jefe de proyecto');
insert into profesion (cod_profesion, nombre) values (204, 'Programador');
insert into profesion (cod_profesion, nombre) values (205, 'Programador Senior');
insert into profesion (cod_profesion, nombre) values (206, 'Programador Junior');
insert into profesion (cod_profesion, nombre) values (207, 'Ingeniero de software');
insert into profesion (cod_profesion, nombre) values (208, 'Supervisorde proyecto');
insert into profesion (cod_profesion, nombre) values (209, 'Analista Junior');
insert into profesion (cod_profesion, nombre) values (210, 'Analista Senior');

insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (301, '3364718728', 'Robinette', 'Strelitzer');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (302, '3053545551', 'Nikolaos', 'Drewry');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (303, '3484419343', 'Ludvig', 'Du Plantier');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (304, '2888826208', 'Nickolas', 'Sercombe');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (305, '9567012900', 'Garrett', 'Nowlan');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (306, '2465576573', 'Hilde', 'Janaszewski');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (307, '6582224501', 'Martita', 'Morshead');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (308, '8273823008', 'Mignon', 'Nazareth');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (309, '4024780409', 'Caryl', 'Delle');
insert into trabajador (cod_trabajador, dni, nombre, apellidos) values (310, '4941906921', 'Alejandrina', 'Noton');

insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (501, 301, 201, 21);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (502, 302, 202, 201);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (503, 303, 203, 300);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (504, 304, 204, 224);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (505, 305, 205, 325);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (506, 306, 206, 106);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (507, 307, 207, 227);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (508, 308, 208, 138);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (509, 309, 209, 169);
insert into info_proyecto_trabajador (id, cod_trabajador, cod_profesion, horas_trabajadas) values (510, 310, 210, 210);

insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (901, 501, 1);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (902, 502, 2);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (903, 503, 3);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (904, 504, 4);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (905, 505, 5);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (906, 506, 6);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (907, 507, 7);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (908, 508, 8);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (909, 509, 9);
insert into trabaja (id, id_info_proyecto_trabajador, id_proyecto) values (910, 510, 10);

DELETE FROM `empresa_software`.`proyecto` WHERE (`id` = '1');
DELETE FROM `empresa_software`.`proyecto` WHERE (`id` = '2');
DELETE FROM `empresa_software`.`proyecto` WHERE (`id` = '3');
UPDATE `empresa_software`.`proyecto` SET `id` = '1' WHERE (`id` = '7');

-- empresa comida
create database empresa_comida;
use empresa_comida;

create table empleado(dni varchar(10), nombre varchar(40), codss varchar(20), UNIQUE (codss), telf_movil varchar(12), UNIQUE (telf_movil ),telf_fijo varchar(12), UNIQUE (telf_fijo), PRIMARY KEY(dni) );

create table pinche(dni varchar(10), fecha_nacimiento date, foreign key (dni) references empleado(dni) on delete cascade on update cascade, PRIMARY KEY(dni) );

create table cocinero(dni varchar(10), anios_servicio int, foreign key (dni) references empleado(dni) on delete cascade on update cascade, PRIMARY KEY(dni) );

create table tipo_plato(id_tipo varchar(20),  nombre varchar(40), PRIMARY KEY(id_tipo) );

create table plato(nombre varchar(30), precio decimal, descripcion varchar(70), PRIMARY KEY(nombre) );

create table es(id_tipo varchar(20), nombre_plato varchar(30),  foreign key (id_tipo) references tipo_plato(id_tipo) on delete cascade on update cascade,
 foreign key (nombre_plato ) references plato(nombre) on delete cascade on update cascade);

create table puede_cocinar(dni_empleado varchar(10), nombre_plato varchar(30),  foreign key (dni_empleado) references empleado(dni) on delete cascade on update cascade,  foreign key (nombre_plato) references plato(nombre) on delete cascade on update cascade);

create table unidades(id varchar(20), unidades int, gramos int, litros int, PRIMARY KEY(id) );

create table ingrediente(nombre varchar(30), PRIMARY KEY(nombre) );

create table necesita(id_unidad varchar(20), nombre_plato varchar(30), ingrediente varchar(30),  foreign key (id_unidad) references unidades(id) on delete cascade on update cascade,  
foreign key (ingrediente) references ingrediente(nombre) on delete cascade on update cascade,
foreign key (nombre_plato) references plato(nombre) on delete cascade on update cascade);

create table estanteria(codigo varchar(30), PRIMARY KEY(codigo) );

create table almacen(numero int auto_increment, descripcion varchar(300), nombre varchar(200), PRIMARY KEY(numero) );

create table esta(id_unidad varchar(20), nombre_ingrediente varchar(30), cod_estanteria varchar(30),  
foreign key (id_unidad) references unidades(id) on delete cascade on update cascade,  
foreign key (nombre_ingrediente ) references ingrediente(nombre) on delete cascade on update cascade,
 foreign key (cod_estanteria  ) references estanteria(codigo) on delete cascade on update cascade);

create table esta_almacen(num_almacen int, cod_estanteria varchar(30),  foreign key (num_almacen) references almacen(numero) on delete cascade on update cascade,  foreign key (cod_estanteria) references estanteria(codigo) on delete cascade on update cascade);

insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('1234567890', 'juan pérez', 'abc123', '555-555-555', '666-666-666');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('9876543210', 'maría rodríguez', 'xyz789', '727-777-777', '888-888-888');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('5678901234', 'pedro sánchez', 'def456', '999-999-999', '111-111-111');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('1357924680', 'ana lópez', 'ghi789', '333-333-333', '444-424-444');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('0246813579', 'luis martínez', 'jkl123', '222-222-222', '777-777-777');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('9876123450', 'sofía torres', 'mno456', '888-888-888', '555-555-555');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('2345678901', 'carlos gonzález', 'pqr789', '666-666-666', '999-999-999');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('3456789012', 'lorena pérez', 'stu123', '777-777-777', '333-333-333');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('4567890123', 'javier lópez', 'vwx456', '111-111-111', '222-222-222');
insert into empleado (dni, nombre, codss, telf_movil, telf_fijo) values ('5678901200', 'lucía garcía', 'yza789', '555-525-555', '444-444-444');
insert into pinche (dni, fecha_nacimiento) values ('1234567890', '1995-03-15');
insert into pinche (dni, fecha_nacimiento) values ('9876543210', '1992-08-25');
insert into pinche (dni, fecha_nacimiento) values ('5678901234', '1998-12-10');
insert into pinche (dni, fecha_nacimiento) values ('1357924680', '2000-05-20');
insert into pinche (dni, fecha_nacimiento) values ('0246813579', '1997-11-05');
insert into pinche (dni, fecha_nacimiento) values ('9876123450', '1993-04-30');
insert into pinche (dni, fecha_nacimiento) values ('2345678901', '1991-06-15');
insert into pinche (dni, fecha_nacimiento) values ('3456789012', '1994-10-01');
insert into pinche (dni, fecha_nacimiento) values ('4567890123', '1996-09-08');
insert into cocinero (dni, anios_servicio) values ('1234567890', 5);
insert into cocinero (dni, anios_servicio) values ('9876543210', 8);
insert into cocinero (dni, anios_servicio) values ('5678901234', 3);
insert into cocinero (dni, anios_servicio) values ('1357924680', 2);
insert into cocinero (dni, anios_servicio) values ('0246813579', 6);
insert into cocinero (dni, anios_servicio) values ('9876123450', 4);
insert into cocinero (dni, anios_servicio) values ('2345678901', 7);
insert into cocinero (dni, anios_servicio) values ('3456789012', 1);
insert into cocinero (dni, anios_servicio) values ('4567890123', 9);
insert into tipo_plato (id_tipo, nombre) values ('entrante', 'entrante');
insert into tipo_plato (id_tipo, nombre) values ('principal', 'principal');
insert into tipo_plato (id_tipo, nombre) values ('postre', 'postre');
insert into tipo_plato (id_tipo, nombre) values ('ensalada', 'ensalada');
insert into tipo_plato (id_tipo, nombre) values ('sopa', 'sopa');
insert into tipo_plato (id_tipo, nombre) values ('pasta', 'pasta');
insert into tipo_plato (id_tipo, nombre) values ('carne', 'carne');
insert into tipo_plato (id_tipo, nombre) values ('pescado', 'pescado');
insert into tipo_plato (id_tipo, nombre) values ('vegetariano', 'vegetariano');
insert into tipo_plato (id_tipo, nombre) values ('vegano', 'vegano');
insert into plato (nombre, precio, descripcion) values ('ensalada césar', 10.99, 'ensalada fresca con pollo a la parrilla');
insert into plato (nombre, precio, descripcion) values ('lasaña', 12.99, 'lasaña de carne con queso fundido');
insert into plato (nombre, precio, descripcion) values ('tiramisú', 5.99, 'postre italiano de café y mascarpone');
insert into plato (nombre, precio, descripcion) values ('gazpacho', 4.99, 'sopa fría de tomate, pepino y pimiento');
insert into plato (nombre, precio, descripcion) values ('spaghetti carbonara', 11.99, 'pasta con huevo, queso y panceta');
insert into plato (nombre, precio, descripcion) values ('chuleta de cerdo', 13.99, 'chuleta de cerdo a la parrilla');
insert into plato (nombre, precio, descripcion) values ('salmón a la parrilla', 15.99, 'salmón fresco con hierbas a la parrilla');
insert into plato (nombre, precio, descripcion) values ('hamburguesa vegetariana', 9.99, 'hamburguesa de garbanzos y verduras');
insert into plato (nombre, precio, descripcion) values ('veggie bowl', 8.99, 'bol de verduras y arroz');
insert into plato (nombre, precio, descripcion) values ('tarta de manzana', 6.99, 'tarta casera con manzanas frescas');
insert into es (id_tipo, nombre_plato) values ('entrante', 'ensalada césar');
insert into es (id_tipo, nombre_plato) values ('principal', 'lasaña');
insert into es (id_tipo, nombre_plato) values ('postre', 'tiramisú');
insert into es (id_tipo, nombre_plato) values ('entrante', 'gazpacho');
insert into es (id_tipo, nombre_plato) values ('principal', 'spaghetti carbonara');
insert into es (id_tipo, nombre_plato) values ('principal', 'chuleta de cerdo');
insert into es (id_tipo, nombre_plato) values ('principal', 'salmón a la parrilla');
insert into es (id_tipo, nombre_plato) values ('vegetariano', 'hamburguesa vegetariana');
insert into es (id_tipo, nombre_plato) values ('vegetariano', 'veggie bowl');
insert into es (id_tipo, nombre_plato) values ('postre', 'tarta de manzana');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('1234567890', 'ensalada césar');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('9876543210', 'lasaña');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('5678901234', 'tiramisú');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('1357924680', 'gazpacho');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('0246813579', 'spaghetti carbonara');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('9876123450', 'chuleta de cerdo');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('2345678901', 'salmón a la parrilla');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('3456789012', 'hamburguesa vegetariana');
insert into puede_cocinar (dni_empleado, nombre_plato) values ('4567890123', 'veggie bowl');
insert into unidades (id, unidades, gramos, litros) values ('1', 1, 0, 0);
insert into unidades (id, unidades, gramos, litros) values ('2', 0, 1, 0);
insert into unidades (id, unidades, gramos, litros) values ('3', 0, 0, 1);
insert into unidades (id, unidades, gramos, litros) values ('4', 0, 0, 1);
insert into unidades (id, unidades, gramos, litros) values ('5', 0, 0, 1);
insert into unidades (id, unidades, gramos, litros) values ('6', 0, 0, 1);
insert into unidades (id, unidades, gramos, litros) values ('7', 0, 0, 1);
insert into unidades (id, unidades, gramos, litros) values ('8', 0, 0, 1);
insert into ingrediente (nombre) values ('lechuga');
insert into ingrediente (nombre) values ('pollo');
insert into ingrediente (nombre) values ('queso');
insert into ingrediente (nombre) values ('tomate');
insert into ingrediente (nombre) values ('carne');
insert into ingrediente (nombre) values ('pasta');
insert into ingrediente (nombre) values ('pescado');
insert into ingrediente (nombre) values ('verduras');
insert into ingrediente (nombre) values ('arroz');
insert into ingrediente (nombre) values ('manzana');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('1', 'ensalada césar','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('2', 'lasaña','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('3', 'lasaña','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('4', 'tiramisú','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('1', 'tiramisú','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('2', 'gazpacho','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('3', 'gazpacho','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('4', 'spaghetti carbonara','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('1', 'spaghetti carbonara','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('2', 'chuleta de cerdo','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('3', 'chuleta de cerdo','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('4', 'salmón a la parrilla','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('1', 'salmón a la parrilla','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('2', 'hamburguesa vegetariana','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('3', 'hamburguesa vegetariana','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('4', 'veggie bowl','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('1', 'veggie bowl','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('2', 'tarta de manzana','lechuga');
insert into necesita (id_unidad, nombre_plato,ingrediente) values ('3', 'tarta de manzana','lechuga');
insert into estanteria (codigo) values ('estanteria_01');
insert into estanteria (codigo) values ('estanteria_02');
insert into estanteria (codigo) values ('estanteria_03');
insert into estanteria (codigo) values ('estanteria_04');
insert into estanteria (codigo) values ('estanteria_05');
insert into estanteria (codigo) values ('estanteria_06');
insert into estanteria (codigo) values ('estanteria_07');
insert into estanteria (codigo) values ('estanteria_08');
insert into estanteria (codigo) values ('estanteria_09');
insert into estanteria (codigo) values ('estanteria_10');
insert into almacen (numero, descripcion, nombre) values (1, 'almacen tarragona 1', 'tarragona');
insert into almacen (numero, descripcion, nombre) values (2, 'almacen tarragona 2', 'reus');
insert into almacen (numero, descripcion, nombre) values (3, 'almacen tarragona 3', 'salou');
insert into almacen (numero, descripcion, nombre) values (4, 'almacen tarragona 4', 'cambrils');
insert into almacen (numero, descripcion, nombre) values (5, 'almacen tarragona 5', 'vila-seca');
insert into almacen (numero, descripcion, nombre) values (6, 'almacen tarragona 6', 'el vendrell');
insert into almacen (numero, descripcion, nombre) values (7, 'almacen tarragona 7', 'calafell');
insert into almacen (numero, descripcion, nombre) values (8, 'almacen tarragona 8', 'tortosa');
insert into almacen (numero, descripcion, nombre) values (9, 'almacen tarragona 9', 'amposta');
insert into almacen (numero, descripcion, nombre) values (10, 'almacen tarragona 10', 'reus');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('1', 'lechuga', 'estanteria_01');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('2', 'pollo', 'estanteria_01');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('3', 'queso', 'estanteria_02');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('4', 'tomate', 'estanteria_01');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('1', 'carne', 'estanteria_02');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('2', 'pasta', 'estanteria_03');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('3', 'pescado', 'estanteria_01');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('4', 'verduras', 'estanteria_02');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('1', 'arroz', 'estanteria_03');
insert into esta (id_unidad, nombre_ingrediente, cod_estanteria) values ('1', 'manzana', 'estanteria_01');
insert into esta_almacen (num_almacen, cod_estanteria) values (1, 'estanteria_01');
insert into esta_almacen (num_almacen, cod_estanteria) values (2, 'estanteria_02');
insert into esta_almacen (num_almacen, cod_estanteria) values (3, 'estanteria_03');
insert into esta_almacen (num_almacen, cod_estanteria) values (4, 'estanteria_04');
insert into esta_almacen (num_almacen, cod_estanteria) values (5, 'estanteria_05');
insert into esta_almacen (num_almacen, cod_estanteria) values (6, 'estanteria_06');
insert into esta_almacen (num_almacen, cod_estanteria) values (7, 'estanteria_07');
insert into esta_almacen (num_almacen, cod_estanteria) values (8, 'estanteria_08');
insert into esta_almacen (num_almacen, cod_estanteria) values (9, 'estanteria_09');
insert into esta_almacen (num_almacen, cod_estanteria) values (10, 'estanteria_10');

UPDATE `empresa_comida`.`empleado` SET `nombre` = 'Jordi ganés' WHERE (`dni` = '1357924680');
DELETE FROM `empresa_comida`.`empleado` WHERE (`dni` = '5678901234');
DELETE FROM `empresa_comida`.`empleado` WHERE (`dni` = '9876123450');

-- red social
create database red_social;
use red_social;

create table usuario(id int auto_increment,contraseña varchar(40),nombre varchar(40),apellidos varchar(40),url_foto varchar(40),celebridad boolean, PRIMARY KEY(id) );

create table contactar(id int auto_increment,id_usuario1 int, id_usuario2 int,comentario varchar(400), PRIMARY KEY(id) ,
foreign key (id_usuario1) references usuario(id) on delete cascade on update cascade,
foreign key (id_usuario2) references usuario(id) on delete cascade on update cascade
);

create table bloquear(id int auto_increment,id_usuario1 int, id_usuario2 int, PRIMARY KEY(id) ,
foreign key (id_usuario1) references usuario(id) on delete cascade on update cascade,
foreign key (id_usuario2) references usuario(id) on delete cascade on update cascade
);
create table grupo(id int auto_increment,nombre varchar(40), PRIMARY KEY(id));

create table pertenecer(id int auto_increment,id_grupo int, id_usuario int, PRIMARY KEY(id) ,
foreign key (id_usuario) references usuario(id) on delete cascade on update cascade,
foreign key (id_grupo) references grupo(id) on delete cascade on update cascade
);

create table comentario(id int auto_increment,texto varchar(40),url varchar(40) ,id_usuario int, PRIMARY KEY(id) ,
foreign key (id_usuario) references usuario(id) on delete cascade on update cascade
);

create table ver_comentario(id int auto_increment,id_usuario int, id_comentario int, PRIMARY KEY(id) ,
foreign key (id_usuario) references usuario(id)on delete cascade on update cascade,
foreign key (id_comentario) references comentario(id) on delete cascade on update cascade
);

create table ver_comentario_grupo(id int auto_increment,id_grupo int, id_comentario int, PRIMARY KEY(id) ,
foreign key (id_grupo) references grupo(id) on delete cascade on update cascade,
foreign key (id_comentario) references comentario(id) on delete cascade on update cascade
);

create table telefono(numero varchar(40) ,id_usuario int, PRIMARY KEY(numero) ,
foreign key (id_usuario) references usuario(id)on delete cascade on update cascade
);


-- ---------------------------------------------------------------------------------------------------------

insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (1, 'mfruser0', 'Mervin', 'Fruser', 'http://dummyimage.com/168x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (2, 'oprodrick1', 'Olympe', 'Prodrick', 'http://dummyimage.com/200x100.png/', false);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (3, 'wkezor2', 'Wyatt', 'Kezor', 'http://dummyimage.com/248x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (4, 'mwombwell3', 'Meade', 'Wombwell', 'http://dummyimage.com/241x100.png/', false);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (5, 'mcurryer4', 'Michele', 'Curryer', 'http://dummyimage.com/161x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (6, 'skarlicek5', 'Sergeant', 'Karlicek', 'http://dummyimage.com/100x100.png/', false);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (7, 'lrubinsohn6', 'Lanny', 'Rubinsohn', 'http://dummyimage.com/130x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (8, 'gstagge7', 'Gerhardt', 'Stagge', 'http://dummyimage.com/182x100.png/', false);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (9, 'teleshenar8', 'Teresita', 'Eleshenar', 'http://dummyimage.com/134x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, url_foto, celebridad) values (10, 'fboyford9', 'Fernande', 'Boyford', 'http://dummyimage.com/168x100.png/', false);

insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1001, 1, 10, 'Ankylosis ear ossicl NEC');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1002, 2, 1, 'Portal hypertension');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1003, 3, 2, 'Anaphyl react d/t vaccin');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1004, 4, 3, 'Inj head/neck vessel NOS');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1005, 5, 4, 'Normal delivery');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1006, 6, 5, 'Shotgun accident');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1007, 7, 6, 'Superf inj foot/toe NEC');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1008, 8, 7, 'Lymphoid mal NEC spleen');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1009, 9, 8, 'Comp tp organ-stem cell');
insert into contactar (id, id_usuario1, id_usuario2, comentario) values (1010, 10, 9, 'P/p coag def-del w p/p');

insert into bloquear (id, id_usuario1, id_usuario2) values (2001, 1, 6);
insert into bloquear (id, id_usuario1, id_usuario2) values (2002, 2, 7);
insert into bloquear (id, id_usuario1, id_usuario2) values (2003, 3, 8);
insert into bloquear (id, id_usuario1, id_usuario2) values (2004, 4, 9);
insert into bloquear (id, id_usuario1, id_usuario2) values (2005, 5, 10);
insert into bloquear (id, id_usuario1, id_usuario2) values (2006, 6, 1);
insert into bloquear (id, id_usuario1, id_usuario2) values (2007, 7, 2);
insert into bloquear (id, id_usuario1, id_usuario2) values (2008, 8, 3);
insert into bloquear (id, id_usuario1, id_usuario2) values (2009, 9, 4);
insert into bloquear (id, id_usuario1, id_usuario2) values (2010, 10, 5);

insert into grupo (id, nombre) values (1901, 'Jacobs-Keeling');
insert into grupo (id, nombre) values (1902, 'Powlowski, Harber and Gleason');
insert into grupo (id, nombre) values (1903, 'Rutherford-Roob');
insert into grupo (id, nombre) values (1904, 'Crist-Stoltenberg');
insert into grupo (id, nombre) values (1905, 'Erdman-Grant');
insert into grupo (id, nombre) values (1906, 'Lynch-Quitzon');
insert into grupo (id, nombre) values (1907, 'Franecki, Hackett and Koelpin');
insert into grupo (id, nombre) values (1908, 'Braun LLC');
insert into grupo (id, nombre) values (1909, 'Sawayn, Casper and Mraz');
insert into grupo (id, nombre) values (1910, 'Moen Group');

insert into pertenecer (id, id_grupo, id_usuario) values (1501, 1901, 1);
insert into pertenecer (id, id_grupo, id_usuario) values (1502, 1902, 2);
insert into pertenecer (id, id_grupo, id_usuario) values (1503, 1903, 3);
insert into pertenecer (id, id_grupo, id_usuario) values (1504, 1904, 4);
insert into pertenecer (id, id_grupo, id_usuario) values (1505, 1905, 5);
insert into pertenecer (id, id_grupo, id_usuario) values (1506, 1906, 6);
insert into pertenecer (id, id_grupo, id_usuario) values (1057, 1907, 7);
insert into pertenecer (id, id_grupo, id_usuario) values (1058, 1908, 8);
insert into pertenecer (id, id_grupo, id_usuario) values (1509, 1909, 9);
insert into pertenecer (id, id_grupo, id_usuario) values (1510, 1910, 10);

insert into comentario (id, texto, url, id_usuario) values (1701, 'Pulmon TB NOS-histo', 'http://dummyimage.com/130x100.png/', 1);
insert into comentario (id, texto, url, id_usuario) values (1702, 'Arthropathy NEC-forearm', 'http://dummyimage.com/144x100.png/', 2);
insert into comentario (id, texto, url, id_usuario) values (1703, 'Injury abducens nerve', 'http://dummyimage.com/182x100.png/', 3);
insert into comentario (id, texto, url, id_usuario) values (1704, 'Adv eff arsenic anti-inf', 'http://dummyimage.com/127x100.png/', 4);
insert into comentario (id, texto, url, id_usuario) values (1705, 'Vasa previa-antepartum', 'http://dummyimage.com/162x100.png/', 5);
insert into comentario (id, texto, url, id_usuario) values (1706, 'Contact/exposure mold', 'http://dummyimage.com/153x100.png/', 6);
insert into comentario (id, texto, url, id_usuario) values (1707, 'Paratyphoid fever c', 'http://dummyimage.com/207x100.png/', 7);
insert into comentario (id, texto, url, id_usuario) values (1708, 'Run water w/o sub fall', 'http://dummyimage.com/236x100.png/', 8);
insert into comentario (id, texto, url, id_usuario) values (1709, 'Dorsal root injury', 'http://dummyimage.com/135x100.png/', 9);
insert into comentario (id, texto, url, id_usuario) values (1710, 'Contact/exp algae bloom', 'http://dummyimage.com/105x100.png/', 10);

insert into ver_comentario (id, id_usuario, id_comentario) values (2101, 1, 1701);
insert into ver_comentario (id, id_usuario, id_comentario) values (2102, 2, 1702);
insert into ver_comentario (id, id_usuario, id_comentario) values (2103, 3, 1703);
insert into ver_comentario (id, id_usuario, id_comentario) values (2104, 4, 1704);
insert into ver_comentario (id, id_usuario, id_comentario) values (2105, 5, 1705);
insert into ver_comentario (id, id_usuario, id_comentario) values (2106, 6, 1706);
insert into ver_comentario (id, id_usuario, id_comentario) values (2107, 7, 1707);
insert into ver_comentario (id, id_usuario, id_comentario) values (2108, 8, 1708);
insert into ver_comentario (id, id_usuario, id_comentario) values (2109, 9, 1709);
insert into ver_comentario (id, id_usuario, id_comentario) values (2110, 10, 1710);

insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (1, 1901, 1701);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (2, 1902, 1702);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (3, 1903, 1703);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (4, 1904, 1704);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (5, 1905, 1705);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (6, 1906, 1706);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (7, 1907, 1707);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (8, 1908, 1708);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (9, 1909, 1709);
insert into ver_comentario_grupo (id, id_grupo, id_comentario) values (10, 1910, 1710);

insert into telefono (numero, id_usuario) values ('737 482 5415', 1);
insert into telefono (numero, id_usuario) values ('920 540 6613', 2);
insert into telefono (numero, id_usuario) values ('982 257 9095', 3);
insert into telefono (numero, id_usuario) values ('232 246 4685', 4);
insert into telefono (numero, id_usuario) values ('798 691 7545', 5);
insert into telefono (numero, id_usuario) values ('789 102 6429', 6);
insert into telefono (numero, id_usuario) values ('741 823 8917', 7);
insert into telefono (numero, id_usuario) values ('465 491 4166', 8);
insert into telefono (numero, id_usuario) values ('230 280 6273', 9);
insert into telefono (numero, id_usuario) values ('546 266 1198', 10);


UPDATE `red_social`.`usuario` SET `apellidos` = 'Prats' WHERE (`id` = '4');
DELETE FROM `red_social`.`usuario` WHERE (`id` = '7');
DELETE FROM `red_social`.`usuario` WHERE (`id` = '8');
DELETE FROM `red_social`.`usuario` WHERE (`id` = '9');

-- platos

create database platos;
use platos;

create table plato (id int auto_increment , nombre varchar(40),descripcion varchar(40),primary key(id));
create table primero(id int auto_increment, id_plato int, primary key(id),
foreign key (id_plato) references plato(id) on delete cascade on update cascade
);
create table segundo(id int auto_increment, id_plato int, primary key(id),
foreign key (id_plato) references plato(id) on delete cascade on update cascade
);
create table postre(id int auto_increment, id_plato int, primary key(id),
foreign key (id_plato) references plato(id) on delete cascade on update cascade
);
create table menu (id int auto_increment , fecha date,num_consumidores int,primary key(id));

create table dia (id int auto_increment , fecha date,temperatura int, primary key(id));

create table consume(id int auto_increment, id_plato int, id_menu int, id_dia int, primary key(id),
foreign key (id_plato) references plato(id) on delete cascade on update cascade,
foreign key (id_menu) references menu(id) on delete cascade on update cascade,
foreign key (id_dia) references dia(id) on delete cascade on update cascade
);

insert into plato (nombre, descripcion) values
    ('Berenjenas a la plancha', 'descripción del plato 1'),
    ('Arroz negro', 'descripción del plato 2'),
    ('Consomé', 'descripción del plato 3'),
    ('Estofado', 'descripción del plato 4'),
    ('pollo a la plancha', 'descripción del plato 5'),
    ('Verduras', 'descripción del plato 6'),
    ('Ensalada cesar', 'descripción del plato 7'),
    ('risotto', 'descripción del plato 8'),
    ('calamares a la romana', 'descripción del plato 9'),
    ('hamburguesa vegetal', 'descripción del plato 10');

insert into primero (id_plato) values
    (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

insert into segundo (id_plato) values
    (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

insert into postre (id_plato) values
    (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

insert into menu (fecha, num_consumidores) values
    ('2023-10-23', 50),
    ('2023-10-24', 45),
    ('2023-10-25', 60),
    ('2023-10-26', 55),
    ('2023-10-27', 48),
    ('2023-10-28', 70),
    ('2023-10-29', 52),
    ('2023-10-30', 58),
    ('2023-10-31', 46),
    ('2023-11-01', 63);

insert into dia (fecha, temperatura) values
    ('2023-10-23', 25),
    ('2023-10-24', 26),
    ('2023-10-25', 24),
    ('2023-10-26', 27),
    ('2023-10-27', 23),
    ('2023-10-28', 28),
    ('2023-10-29', 22),
    ('2023-10-30', 26),
    ('2023-10-31', 25),
    ('2023-11-01', 29);

insert into consume (id_plato, id_menu, id_dia) values
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10);
    
	UPDATE `platos`.`plato` SET `descripcion` = 'Asado de verduras' WHERE (`id` = '6');
DELETE FROM `platos`.`plato` WHERE (`id` = '2');
DELETE FROM `platos`.`plato` WHERE (`id` = '3');
DELETE FROM `platos`.`plato` WHERE (`id` = '4');

-- twitter

create database twitter;
use twitter;

create table usuario(id int auto_increment,contraseña varchar(40),nombre varchar(40),apellidos varchar(40),email varchar(40),url_foto varchar(40),celebridad boolean, PRIMARY KEY(id) );

create table bloquear(id int auto_increment,id_usuario1 int, id_usuario2 int, PRIMARY KEY(id) ,
foreign key (id_usuario1) references usuario(id) on delete cascade on update cascade
,
foreign key (id_usuario2) references usuario(id) on delete cascade on update cascade

);

create table seguir(id int auto_increment,id_usuario1 int, id_usuario2 int, PRIMARY KEY(id) ,
foreign key (id_usuario1) references usuario(id) on delete cascade on update cascade
,
foreign key (id_usuario2) references usuario(id) on delete cascade on update cascade

);

create table tweet(id int auto_increment,texto varchar(40),url varchar(40) ,id_usuario int, PRIMARY KEY(id) ,
foreign key (id_usuario) references usuario(id) on delete cascade on update cascade

);

create table retweetea(id int auto_increment,id_tweet int,id_usuario int, PRIMARY KEY(id) ,
foreign key (id_usuario) references usuario(id) on delete cascade on update cascade
,
foreign key (id_tweet) references tweet(id) on delete cascade on update cascade

);

create table comunidad(id int auto_increment,nombre varchar(40),url_imagen varchar(40), PRIMARY KEY(id) );

create table pertenecer(id int auto_increment,id_comunidad int,id_usuario int, PRIMARY KEY(id) ,
foreign key (id_usuario) references usuario(id) on delete cascade on update cascade
,
foreign key (id_comunidad) references comunidad(id) on delete cascade on update cascade

);

create table ver_tweet(id int auto_increment,id_comunidad int,id_tweet int, PRIMARY KEY(id) ,
foreign key (id_tweet) references tweet(id) on delete cascade on update cascade
,
foreign key (id_comunidad) references comunidad(id) on delete cascade on update cascade

);

create table mensaje(id int auto_increment,usuario_envia int, usuario_recibe int,texto varchar(40),fecha date,leido boolean, PRIMARY KEY(id) ,
foreign key (usuario_envia) references usuario(id) on delete cascade on update cascade
,
foreign key (usuario_recibe) references usuario(id) on delete cascade on update cascade

);

-- ---------------------------------------------------------------------------------------------------------

insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (1, 'Hydralazine Hydrochloride', 'Darren', 'Perris', 'dperris0@lulu.com', 'http://dummyimage.com/116x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (2, 'good lubricating plus', 'Glen', 'Carleman', 'gcarleman1@netscape.com', 'http://dummyimage.com/246x100.png/', false);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (3, 'Equate nicotine', 'Lalo', 'Kulvear', 'lkulvear2@ifeng.com', 'http://dummyimage.com/162x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (4, 'PHOMA EXIGUA VAR EXIGUA', 'Katerina', 'Stickney', 'kstickney3@microsoft.com', 'http://dummyimage.com/170x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (5, 'No7 Cool Vanilla', 'Pepita', 'Consadine', 'pconsadine4@printfriendly.com', 'http://dummyimage.com/190x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (6, 'HONEYDEW MELON', 'Kristien', 'Foxall', 'kfoxall5@yellowpages.com', 'http://dummyimage.com/249x100.png/', false);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (7, 'Safeguard', 'Amye', 'Tripet', 'atripet6@last.fm', 'http://dummyimage.com/170x100.png/', false);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (8, 'Potassium Chloride in Sodium Chloride', 'Ted', 'Swinerd', 'tswinerd7@weibo.com', 'http://dummyimage.com/113x100.png/', false);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (9, 'THERA Calazinc Body Shield', 'Crosby', 'Stannas', 'cstannas8@infoseek.co.jp', 'http://dummyimage.com/113x100.png/', true);
insert into usuario (id, contraseña, nombre, apellidos, email, url_foto, celebridad) values (10, 'lisinopril', 'Earle', 'Tuffley', 'etuffley9@arizona.edu', 'http://dummyimage.com/137x100.png/', false);

insert into bloquear (id, id_usuario1, id_usuario2) values (101, 1, 10);
insert into bloquear (id, id_usuario1, id_usuario2) values (102, 2, 9);
insert into bloquear (id, id_usuario1, id_usuario2) values (103, 3, 8);
insert into bloquear (id, id_usuario1, id_usuario2) values (104, 4, 7);
insert into bloquear (id, id_usuario1, id_usuario2) values (105, 5, 6);
insert into bloquear (id, id_usuario1, id_usuario2) values (106, 6, 5);
insert into bloquear (id, id_usuario1, id_usuario2) values (107, 7, 4);
insert into bloquear (id, id_usuario1, id_usuario2) values (108, 8, 3);
insert into bloquear (id, id_usuario1, id_usuario2) values (109, 9, 2);
insert into bloquear (id, id_usuario1, id_usuario2) values (110, 10, 1);

insert into seguir (id, id_usuario1, id_usuario2) values (201, 1, 6);
insert into seguir (id, id_usuario1, id_usuario2) values (202, 2, 7);
insert into seguir (id, id_usuario1, id_usuario2) values (203, 3, 8);
insert into seguir (id, id_usuario1, id_usuario2) values (204, 4, 9);
insert into seguir (id, id_usuario1, id_usuario2) values (205, 5, 10);
insert into seguir (id, id_usuario1, id_usuario2) values (206, 6, 1);
insert into seguir (id, id_usuario1, id_usuario2) values (207, 7, 2);
insert into seguir (id, id_usuario1, id_usuario2) values (208, 8, 3);
insert into seguir (id, id_usuario1, id_usuario2) values (209, 9, 4);
insert into seguir (id, id_usuario1, id_usuario2) values (210, 10, 5);

insert into tweet (id, texto, url, id_usuario) values (3001, 'Epilepsy NEC w intr epil', 'http://dummyimage.com/240x100.png/', 1);
insert into tweet (id, texto, url, id_usuario) values (3002, 'Nystagmus NEC', 'http://dummyimage.com/211x100.png/', 2);
insert into tweet (id, texto, url, id_usuario) values (3003, 'Cryst arthrop NEC-hand', 'http://dummyimage.com/226x100.png/', 3);
insert into tweet (id, texto, url, id_usuario) values (3004, 'Rflx sym dystrph lwr lmb', 'http://dummyimage.com/145x100.png/', 4);
insert into tweet (id, texto, url, id_usuario) values (3005, 'Hpt B chrn coma wo dlta', 'http://dummyimage.com/114x100.png/', 5);
insert into tweet (id, texto, url, id_usuario) values (3006, 'Premat rupt memb aff NB', 'http://dummyimage.com/191x100.png/', 6);
insert into tweet (id, texto, url, id_usuario) values (3007, 'Wtrcraft stair fall-psgr', 'http://dummyimage.com/117x100.png/', 7);
insert into tweet (id, texto, url, id_usuario) values (3008, 'Ankylosis-ankle', 'http://dummyimage.com/134x100.png/', 8);
insert into tweet (id, texto, url, id_usuario) values (3009, 'Inf mcrg rstn macrolides', 'http://dummyimage.com/203x100.png/', 9);
insert into tweet (id, texto, url, id_usuario) values (3010, 'Cns TB NEC-oth test', 'http://dummyimage.com/154x100.png/', 10);

insert into retweetea (id, id_tweet, id_usuario) values (501, 3001, 1);
insert into retweetea (id, id_tweet, id_usuario) values (502, 3002, 2);
insert into retweetea (id, id_tweet, id_usuario) values (503, 3003, 3);
insert into retweetea (id, id_tweet, id_usuario) values (504, 3004, 4);
insert into retweetea (id, id_tweet, id_usuario) values (505, 3005, 5);
insert into retweetea (id, id_tweet, id_usuario) values (506, 3006, 6);
insert into retweetea (id, id_tweet, id_usuario) values (507, 3007, 7);
insert into retweetea (id, id_tweet, id_usuario) values (508, 3008, 8);
insert into retweetea (id, id_tweet, id_usuario) values (509, 3009, 9);
insert into retweetea (id, id_tweet, id_usuario) values (510, 3010, 10);

insert into comunidad (id, nombre, url_imagen) values (401, 'Nienow-Beier', 'http://dummyimage.com/167x100.png/');
insert into comunidad (id, nombre, url_imagen) values (402, 'Block, Welch and Price', 'http://dummyimage.com/174x100.png/');
insert into comunidad (id, nombre, url_imagen) values (403, 'D''Amore and Sons', 'http://dummyimage.com/110x100.png/');
insert into comunidad (id, nombre, url_imagen) values (404, 'Kling, Kutch and Bernier', 'http://dummyimage.com/207x100.png/');
insert into comunidad (id, nombre, url_imagen) values (405, 'Veum, Schmitt and Gislason', 'http://dummyimage.com/223x100.png/');
insert into comunidad (id, nombre, url_imagen) values (406, 'Littel, Anderson and Glover', 'http://dummyimage.com/190x100.png/');
insert into comunidad (id, nombre, url_imagen) values (407, 'Champlin Group', 'http://dummyimage.com/140x100.png/');
insert into comunidad (id, nombre, url_imagen) values (408, 'Ferry, Hudson and Zulauf', 'http://dummyimage.com/135x100.png/');
insert into comunidad (id, nombre, url_imagen) values (409, 'Treutel, Windler and Sanford', 'http://dummyimage.com/114x100.png/');
insert into comunidad (id, nombre, url_imagen) values (410, 'Goodwin and Sons', 'http://dummyimage.com/211x100.png/');

insert into pertenecer (id, id_comunidad, id_usuario) values (601, 401, 1);
insert into pertenecer (id, id_comunidad, id_usuario) values (602, 402, 2);
insert into pertenecer (id, id_comunidad, id_usuario) values (603, 403, 3);
insert into pertenecer (id, id_comunidad, id_usuario) values (604, 404, 4);
insert into pertenecer (id, id_comunidad, id_usuario) values (605, 405, 5);
insert into pertenecer (id, id_comunidad, id_usuario) values (606, 406, 6);
insert into pertenecer (id, id_comunidad, id_usuario) values (607, 407, 7);
insert into pertenecer (id, id_comunidad, id_usuario) values (608, 408, 8);
insert into pertenecer (id, id_comunidad, id_usuario) values (609, 409, 9);
insert into pertenecer (id, id_comunidad, id_usuario) values (610, 410, 10);

insert into ver_tweet (id, id_comunidad, id_tweet) values (701, 401, 3001);
insert into ver_tweet (id, id_comunidad, id_tweet) values (702, 402, 3002);
insert into ver_tweet (id, id_comunidad, id_tweet) values (703, 403, 3003);
insert into ver_tweet (id, id_comunidad, id_tweet) values (704, 404, 3004);
insert into ver_tweet (id, id_comunidad, id_tweet) values (705, 405, 3005);
insert into ver_tweet (id, id_comunidad, id_tweet) values (706, 406, 3006);
insert into ver_tweet (id, id_comunidad, id_tweet) values (707, 407, 3007);
insert into ver_tweet (id, id_comunidad, id_tweet) values (708, 408, 3008);
insert into ver_tweet (id, id_comunidad, id_tweet) values (709, 409, 3009);
insert into ver_tweet (id, id_comunidad, id_tweet) values (710, 410, 3010);

insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (901, 1, 7, 'Mal neo breast low-inner', str_to_date('2/2/2023', '%m/%d/%Y'), false);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (902, 2, 8, 'TB ovary & tube-histo dx', str_to_date('8/16/2023', '%m/%d/%Y'), false);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (903, 3, 9, 'Cl skul base fx-brf coma', str_to_date('12/18/2022', '%m/%d/%Y'), true);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (904, 4, 10, 'Lambert-Eaton synd neopl', str_to_date('4/13/2023', '%m/%d/%Y'), false);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (905, 5, 1, 'Venous compl NEC-postpar', str_to_date('11/27/2022', '%m/%d/%Y'), true);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (906, 6, 2, 'Recur bilat inguin hern', str_to_date('3/13/2023', '%m/%d/%Y'), false);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (907, 7, 3, 'Panniculitis, site NEC', str_to_date('11/6/2022', '%m/%d/%Y'), true);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (908, 8, 4, 'Rheumatic chorea NOS', str_to_date('3/21/2023', '%m/%d/%Y'), true);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (909, 9, 5, 'Climact arthritis-up/arm', str_to_date('4/19/2023', '%m/%d/%Y'), false);
insert into mensaje (id, usuario_envia, usuario_recibe, texto, fecha, leido) values (910, 10, 6, 'Iridocyclitis NOS', str_to_date('1/3/2023', '%m/%d/%Y'), true);


DELETE FROM `twitter`.`mensaje` WHERE (`id` = '904');
DELETE FROM `twitter`.`mensaje` WHERE (`id` = '908');
UPDATE `twitter`.`mensaje` SET `texto` = 'Perdon, te envie esto por error' WHERE (`id` = '901');

DELETE FROM `twitter`.`tweet` WHERE (`id` = '3006');
DELETE FROM `twitter`.`tweet` WHERE (`id` = '3003');
UPDATE `twitter`.`tweet` SET `texto` = 'Esta bien, pero mejor el comic' WHERE (`id` = '3007');
UPDATE `twitter`.`tweet` SET `texto` = 'Odio lo morado' WHERE (`id` = '3008');

DELETE FROM `twitter`.`comunidad` WHERE (`id` = '404');
DELETE FROM `twitter`.`comunidad` WHERE (`id` = '406');

-- horario escolar

create database horario_escolar;
use horario_escolar;

create table profesor(dni varchar(20), nombre varchar(20), direccion varchar(80), telefono varchar(12), email varchar(30), num_seg_soc varchar(20), cod_profesor varchar(20), UNIQUE (cod_profesor),  PRIMARY KEY(dni) );

create table clase(id varchar(20), dia_semana int, hora int,  PRIMARY KEY(id) );

create table aula(codigo varchar(20), nombre varchar(20),  num_aula int, superficie int,  PRIMARY KEY(codigo) );

create table ciclo(id varchar(20), nombre varchar(20),  PRIMARY KEY(id) );
create table centro(cod_centro int auto_increment,nombre varchar(40),primary key(cod_centro));
create table asignatura(nombre varchar(40),cod_centro int, codigo_europeo int, cod_aula varchar(20), id_clase varchar(20), id_ciclo varchar(20), primary key(nombre),
foreign key (cod_centro) references centro(cod_centro) on delete cascade on update cascade,
foreign key (cod_aula) references aula(codigo) on delete cascade on update cascade,
foreign key (id_clase) references clase(id) on delete cascade on update cascade,
foreign key (id_ciclo) references ciclo(id) on delete cascade on update cascade
);

create table requiere(id int auto_increment,nombre_asignatura1 varchar(40),nombre_asignatura2 varchar(40),primary key(id),
foreign key (nombre_asignatura1) references asignatura(nombre) on delete cascade on update cascade,
foreign key (nombre_asignatura2) references asignatura(nombre) on delete cascade on update cascade
);

create table tutela(id int auto_increment,nombre_asignatura varchar(40),dni_profesor varchar(20),primary key(id),
foreign key (nombre_asignatura) references asignatura(nombre) on delete cascade on update cascade,
foreign key (dni_profesor) references profesor(dni) on delete cascade on update cascade
);

create table ciclo_superior(id int auto_increment,id_ciclo varchar(20),primary key(id),
foreign key (id_ciclo) references ciclo(id) on delete cascade on update cascade
);

create table ciclo_medio(id int auto_increment,id_ciclo varchar(20),primary key(id),
foreign key (id_ciclo) references ciclo(id) on delete cascade on update cascade
);

create table iniciacion_profesional(id int auto_increment,id_ciclo varchar(20),primary key(id),
foreign key (id_ciclo) references ciclo(id) on delete cascade on update cascade
);

insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('155-44-0425', 'Mignonne Labram', '26731 Elgar Alley', '719-807-7653', 'mlabram0@alibaba.com', '698-18-6077', 1);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('459-62-1573', 'Daryn Faragan', '8287 Glendale Trail', '882-708-4405', 'dfaragan1@trellian.com', '153-73-2067', 2);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('620-73-2866', 'Camilla Audibert', '398 Monument Point', '772-886-0667', 'caudibert2@creativecommons.org', '309-84-6137', 3);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('681-35-9662', 'De Dunne', '3 Veith Place', '509-247-4404', 'ddunne3@fotki.com', '515-99-7445', 4);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('575-10-5210', 'Curtis Perkin', '430 Linden Trail', '500-962-5968', 'cperkin4@rediff.com', '143-67-7318', 5);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('742-40-7660', 'Wenona Smallridge', '08 Saint Paul Avenue', '112-538-6391', 'wsmallridge5@umich.edu', '572-09-3427', 6);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('421-99-8937', 'Pearline Berkeley', '09499 Bultman Terrace', '627-783-5218', 'pberkeley6@weebly.com', '396-26-8363', 7);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('456-92-3574', 'Opalina Bridgnell', '46 Lyons Place', '658-506-6202', 'obridgnell7@walmart.com', '626-55-9062', 8);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('659-13-3653', 'Orville Ridel', '274 Maryland Pass', '692-229-5426', 'oridel8@hc360.com', '483-74-6072', 9);
insert into profesor (dni, nombre, direccion, telefono, email, num_seg_soc, cod_profesor) values ('348-99-4960', 'Gerhardine Ivanov', '407 Sommers Trail', '412-957-9689', 'givanov9@cargocollective.com', '587-98-0155', 10);

insert into clase (id, dia_semana, hora) values (1, 2, 2);
insert into clase (id, dia_semana, hora) values (2, 5, 5);
insert into clase (id, dia_semana, hora) values (3, 5, 1);
insert into clase (id, dia_semana, hora) values (4, 3, 2);
insert into clase (id, dia_semana, hora) values (5, 6, 3);
insert into clase (id, dia_semana, hora) values (6, 3, 3);
insert into clase (id, dia_semana, hora) values (7, 1, 3);
insert into clase (id, dia_semana, hora) values (8, 5, 5);
insert into clase (id, dia_semana, hora) values (9, 5, 4);
insert into clase (id, dia_semana, hora) values (10, 4, 6);

insert into aula (codigo, nombre, num_aula, superficie) values (1, 'Fabaceae', 58, 6);
insert into aula (codigo, nombre, num_aula, superficie) values (2, 'Rosaceae', 33, 6);
insert into aula (codigo, nombre, num_aula, superficie) values (3, 'Pteridaceae', 16, 12);
insert into aula (codigo, nombre, num_aula, superficie) values (4, 'Cladoniaceae', 12, 6);
insert into aula (codigo, nombre, num_aula, superficie) values (5, 'Anacardiaceae', 5, 8);
insert into aula (codigo, nombre, num_aula, superficie) values (6, 'Poaceae', 55, 8);
insert into aula (codigo, nombre, num_aula, superficie) values (7, 'Polygonaceae', 11, 5);
insert into aula (codigo, nombre, num_aula, superficie) values (8, 'Hymenophyllaceae', 20, 11);
insert into aula (codigo, nombre, num_aula, superficie) values (9, 'Polygonaceae', 52, 9);
insert into aula (codigo, nombre, num_aula, superficie) values (10, 'Scrophulariaceae', 5, 7);


insert into ciclo (id, nombre) values (1, 'DAW');
insert into ciclo (id, nombre) values (2, 'DAM');
insert into ciclo (id, nombre) values (3, 'Integracion Social');
insert into ciclo (id, nombre) values (4, 'Marketing');
insert into ciclo (id, nombre) values (5, 'Sistemas');
insert into ciclo (id, nombre) values (6, 'Audiovisuales');
insert into ciclo (id, nombre) values (7, 'Turismo');
insert into ciclo (id, nombre) values (8, 'Chapa y pintura');
insert into ciclo (id, nombre) values (9, 'Mecanica');
insert into ciclo (id, nombre) values (10, 'Aeromodelismo');

insert into centro (cod_centro, nombre) values (1, 'IES San pedro');
insert into centro (cod_centro, nombre) values (2, 'IES San pablo');
insert into centro (cod_centro, nombre) values (3, 'Vidal i barraquer');
insert into centro (cod_centro, nombre) values (4, 'CEP Tarragona');
insert into centro (cod_centro, nombre) values (5, 'IES Reus');
insert into centro (cod_centro, nombre) values (6, 'IES Torreforta');
insert into centro (cod_centro, nombre) values (7, 'Ies Lichen');
insert into centro (cod_centro, nombre) values (8, 'CEP Penstemon');
insert into centro (cod_centro, nombre) values (9, 'IES Sandwort');
insert into centro (cod_centro, nombre) values (10, 'IES Bryum Moss');

insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Matematicas', 6, 40, 10, 2, 1);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Lengua', 7, 43, 2, 6, 9);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Base de datos', 10, 38, 8, 10, 3);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Historia 1', 9, 41, 2, 5, 8);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Historia 2', 9, 37, 4, 1, 1);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Historia 4', 5, 52, 9, 8, 3);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Historia 3', 6, 60, 4, 3, 10);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Marketing', 3, 11, 5, 4, 6);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Age', 3, 12, 8, 3, 2);
insert into asignatura (nombre, cod_centro, codigo_europeo, cod_aula, id_clase, id_ciclo) values ('Fol', 2, 16, 6, 1, 4);

insert into requiere (id, nombre_asignatura1, nombre_asignatura2) values (1, 'Matematicas', 'Base de datos');
insert into requiere (id, nombre_asignatura1, nombre_asignatura2) values (2, 'Lengua', 'Matematicas');
insert into requiere (id, nombre_asignatura1, nombre_asignatura2) values (3, 'Historia 1', 'Matematicas');
insert into requiere (id, nombre_asignatura1, nombre_asignatura2) values (4, 'Fol', 'Matematicas');

insert into tutela (id,nombre_asignatura,dni_profesor) values (1,'Matematicas','155-44-0425');
insert into tutela (id,nombre_asignatura,dni_profesor) values (2,'Lengua','155-44-0425');
insert into tutela (id,nombre_asignatura,dni_profesor) values (3,'Base de datos','155-44-0425');
insert into tutela (id,nombre_asignatura,dni_profesor) values (4,'Historia 1','620-73-2866');
insert into tutela (id,nombre_asignatura,dni_profesor) values (5,'Historia 2','421-99-8937');
insert into tutela (id,nombre_asignatura,dni_profesor) values (6,'Historia 4','456-92-3574');
insert into tutela (id,nombre_asignatura,dni_profesor) values (7,'Historia 3','659-13-3653');
insert into tutela (id,nombre_asignatura,dni_profesor) values (8,'Marketing','348-99-4960');
insert into tutela (id,nombre_asignatura,dni_profesor) values (9,'Age','459-62-1573');
insert into tutela (id,nombre_asignatura,dni_profesor) values (10,'Fol','681-35-9662');

insert into ciclo_superior (id,id_ciclo) values (1,1);
insert into ciclo_superior (id,id_ciclo) values (2,1);
insert into ciclo_superior (id,id_ciclo) values (3,3);
insert into ciclo_superior (id,id_ciclo) values (4,4);
insert into ciclo_superior (id,id_ciclo) values (5,5);
insert into ciclo_superior (id,id_ciclo) values (6,8);
insert into ciclo_superior (id,id_ciclo) values (7,2);
insert into ciclo_superior (id,id_ciclo) values (8,2);
insert into ciclo_superior (id,id_ciclo) values (9,2);
insert into ciclo_superior (id,id_ciclo) values (10,1);

insert into ciclo_medio (id,id_ciclo) values (1,5);
insert into ciclo_medio (id,id_ciclo) values (2,6);
insert into ciclo_medio (id,id_ciclo) values (3,7);
insert into ciclo_medio (id,id_ciclo) values (4,8);
insert into ciclo_medio (id,id_ciclo) values (5,9);
insert into ciclo_medio (id,id_ciclo) values (6,3);
insert into ciclo_medio (id,id_ciclo) values (7,3);
insert into ciclo_medio (id,id_ciclo) values (8,3);
insert into ciclo_medio (id,id_ciclo) values (9,1);
insert into ciclo_medio (id,id_ciclo) values (10,1);

insert into iniciacion_profesional (id,id_ciclo) values (1,5);
insert into iniciacion_profesional (id,id_ciclo) values (2,6);
insert into iniciacion_profesional (id,id_ciclo) values (3,7);
insert into iniciacion_profesional (id,id_ciclo) values (4,8);
insert into iniciacion_profesional (id,id_ciclo) values (5,9);
insert into iniciacion_profesional (id,id_ciclo) values (6,3);
insert into iniciacion_profesional (id,id_ciclo) values (7,3);
insert into iniciacion_profesional (id,id_ciclo) values (8,3);
insert into iniciacion_profesional (id,id_ciclo) values (9,1);
insert into iniciacion_profesional (id,id_ciclo) values (10,1);

UPDATE `horario_escolar`.`profesor` SET `nombre` = 'Carla mandela' WHERE (`dni` = '421-99-8937');
DELETE FROM `horario_escolar`.`profesor` WHERE (`dni` = '575-10-5210');
DELETE FROM `horario_escolar`.`profesor` WHERE (`dni` = '620-73-2866');
DELETE FROM `horario_escolar`.`profesor` WHERE (`dni` = '659-13-3653');

-- inmuebles

create database inmuebles;
use inmuebles;

create table persona(dni varchar(10), telefono varchar(12), movil varchar(12), nombre varchar(40), apellidos varchar(40), PRIMARY KEY(dni) );

create table trabajador(dni varchar(10), cod_personal varchar(20), UNIQUE (cod_personal), foreign key (dni) references persona(dni) on delete cascade on update cascade, PRIMARY KEY(dni) );

create table cliente(dni varchar(10), cod_personal varchar(20),  UNIQUE (cod_personal), foreign key (dni) references persona(dni) on delete cascade on update cascade, PRIMARY KEY(dni) );

create table inmueble(codigo varchar(20), metros int, descripcion varchar(250), direccion varchar(30), dni_agente varchar(10),
foreign key (dni_agente ) references trabajador(dni) on delete cascade on update cascade,  PRIMARY KEY(codigo));

create table locales(codigo varchar(20), uso varchar(50), servicio boolean, cod_inmueble varchar(20),
foreign key (cod_inmueble ) references inmueble(codigo) on delete cascade on update cascade,
 PRIMARY KEY(codigo));

create table garajes(codigo varchar(20), num_garaje int, planta int, cod_inmueble varchar(20), foreign key (cod_inmueble ) references inmueble(codigo) on delete cascade on update cascade, PRIMARY KEY(codigo));

create table pisos(codigo varchar(20), cod_piso varchar(30), cod_garaje varchar(20), cod_inmueble varchar(20), foreign key (cod_garaje  ) references garajes(codigo) on delete cascade on update cascade, foreign key (cod_inmueble ) references inmueble(codigo) on delete cascade on update cascade, PRIMARY KEY(codigo));

create table compra(codigo varchar(20), fecha date, valor double, cod_inmueble varchar(20), foreign key (cod_inmueble ) references inmueble(codigo) on delete cascade on update cascade, PRIMARY KEY(codigo) );

create table alquiler(id varchar(20), numero int, cod_inmueble varchar(20), dni_cliente varchar(10),
foreign key (cod_inmueble) references inmueble(codigo) on delete cascade on update cascade,
 foreign key (dni_cliente ) references persona(dni) on delete cascade on update cascade,
 PRIMARY KEY(id) );

create table comprar(cod_compra varchar(20), dni_cliente varchar(10), foreign key (cod_compra ) references compra(codigo) on delete cascade on update cascade, foreign key (dni_cliente) references persona(dni) on delete cascade on update cascade);

create table pago(id varchar(20), fecha date, valor double, PRIMARY KEY(id) );

create table pagar(id_alquiler varchar(20), id_pago varchar(10), foreign key (id_alquiler) references alquiler(id) on delete cascade on update cascade, foreign key (id_pago) references pago(id) on delete cascade on update cascade);

-- ----------------------------------------------------------------------------------------------------

insert into persona (dni, telefono, movil, nombre, apellidos) values ('3991138373', '160 604 1042', '559 505 8435', 'Wylie', 'Arnauduc');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('7194286507', '511 480 3799', '420 116 2893', 'Andee', 'Bygreaves');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('5741410944', '554 954 0124', '376 289 5347', 'Gaspar', 'Gorelli');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('5949838529', '435 788 7741', '647 910 1082', 'Barbi', 'Raithbie');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('3429893978', '977 844 0457', '911 680 8284', 'Hanny', 'Whitta');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('4757774601', '158 907 9567', '343 769 5972', 'Jonah', 'Oddboy');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('4663328141', '327 718 2684', '668 507 4149', 'Francene', 'Sandison');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('8303150367', '345 477 1445', '986 989 0475', 'James', 'Juggins');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('7483469713', '573 836 3067', '437 919 4813', 'Gwendolin', 'Dawbery');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('9091386162', '830 532 3302', '873 912 8362', 'Dulsea', 'Dumbare');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('5102949406', '960 396 6785', '118 192 6544', 'Ilario', 'Vogeller');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('8556025553', '938 334 1595', '859 463 4835', 'Taylor', 'Gilchriest');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('3058726074', '112 627 3501', '804 380 3101', 'Matty', 'Duffil');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('7098950295', '328 583 3168', '328 422 6149', 'Pavlov', 'Duly');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('8911546157', '763 152 9553', '285 542 1777', 'Vinita', 'Huckle');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('4556796758', '497 465 3450', '836 571 8289', 'Dorie', 'Lewsie');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('7174712383', '152 670 9903', '784 705 6492', 'Rice', 'Dorgon');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('3109246420', '671 179 6207', '458 802 2267', 'Maison', 'Corney');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('5314751580', '778 663 6490', '309 635 2394', 'Halimeda', 'Yushachkov');
insert into persona (dni, telefono, movil, nombre, apellidos) values ('9407944380', '800 907 0434', '924 167 9906', 'Modestine', 'Winley');

insert into trabajador (dni, cod_personal) values ('3991138373', 'IDRA');
insert into trabajador (dni, cod_personal) values ('7194286507', 'YERB');
insert into trabajador (dni, cod_personal) values ('5741410944', 'THBC');
insert into trabajador (dni, cod_personal) values ('5949838529', 'CNYD');
insert into trabajador (dni, cod_personal) values ('3429893978', 'COPE');
insert into trabajador (dni, cod_personal) values ('4757774601', 'BRLF');
insert into trabajador (dni, cod_personal) values ('4663328141', 'EURG');
insert into trabajador (dni, cod_personal) values ('8303150367', 'PHPH');
insert into trabajador (dni, cod_personal) values ('7483469713', 'PHPI');
insert into trabajador (dni, cod_personal) values ('9091386162', 'JPYJ');

insert into cliente (dni, cod_personal) values ('5102949406', 'EURO');
insert into cliente (dni, cod_personal) values ('8556025553', 'VEFP');
insert into cliente (dni, cod_personal) values ('3058726074', 'COPQ');
insert into cliente (dni, cod_personal) values ('7098950295', 'PLNR');
insert into cliente (dni, cod_personal) values ('8911546157', 'IRRS');
insert into cliente (dni, cod_personal) values ('4556796758', 'IDRT');
insert into cliente (dni, cod_personal) values ('7174712383', 'EURU');
insert into cliente (dni, cod_personal) values ('3109246420', 'CNYV');
insert into cliente (dni, cod_personal) values ('5314751580', 'PENW');
insert into cliente (dni, cod_personal) values ('9407944380', 'CNYX');


insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('acremer0', 51, 'Inclusion body myositis', '4407 Huxley Trail', '3991138373');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('pveldens1', 72, 'Diabetic retinopathy NOS', '6 Ohio Court', '7194286507');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('tbecaris2', 63, 'Renal vascular disorder', '691 Scott Point', '5741410944');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('aeringey3', 64, 'Letterer-siwe dis head', '32286 Dovetail Drive', '5949838529');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('llomath4', 65, 'Kidney transplant status', '44466 Lindbergh Trail', '3429893978');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('sgatheridge5', 86, 'Trachoma, initial stage', '31297 Autumn Leaf Junction', '4757774601');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('dplayer6', 127, 'Spon abor w pelv inf-inc', '4949 Dawn Way', '4663328141');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('grumbelow7', 268, 'Liver lacerat, mod-open', '05432 Northview Alley', '8303150367');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('jcowcha8', 139, 'TB of bladder-exam unkn', '13790 Ruskin Center', '7483469713');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('pbowell9', 140, 'Fx lunate, wrist-closed', '7 Paget Place', '9091386162');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('omacillrick0', 91, 'Urethral fistula', '10 Messerschmidt Place', '3991138373');

insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('dgoman1', 92, 'Urethral caruncle', '78 Monument Point', '7194286507');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('rdoncom2', 203, 'Tietze''s disease', '042 Mosinee Junction', '5741410944');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('tpalluschek3', 104, 'Hemarthrosis-mult jts', '015 Village Pass', '5949838529');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('yhaverson4', 165, 'Open wound of elbow', '7990 Larry Parkway', '3429893978');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('tjanko5', 226, 'Late eff int injury NEC', '6133 Moulton Hill', '4757774601');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('jgoadby6', 67, 'Obturator disloc hip-opn', '18 Lakeland Court', '4663328141');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('mphillps7', 98, 'Disloc metacarpophaln-cl', '66266 5th Crossing', '8303150367');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('mgoatman8', 119, 'Mental dis-deliv w p/p', '47752 Buell Hill', '7483469713');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('jhackin9', 210, 'Anphylct reaction eggs', '7262 Fremont Road', '9091386162');

insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('vvedenicheva', 211, 'Dengue', '9517 Michigan Road', '3991138373');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('lebhardtb', 132, 'Fet distress befor labor', '4755 Atwood Parkway', '7194286507');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('mgabbitisc', 183, 'Injur carotid artery NOS', '2848 Portage Alley', '5741410944');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('dtanseyd', 154, 'Cl skull fx NEC w/o coma', '8 American Road', '5949838529');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('rhollindalee', 145, 'Secondary pneumon plague', '948 Westerfield Way', '3429893978');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('ostillef', 126, 'Refraction disorder NOS', '6127 Straubel Lane', '4757774601');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('ikyngeg', 137, 'Preg compl NEC-antepart', '2827 Lerdahl Alley', '4663328141');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('hwareingh', 148, 'Prog multifoc leukoencep', '88 Nobel Court', '8303150367');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('acundeyi', 149, 'Opn brain lacer-mod coma', '5465 Anderson Trail', '7483469713');
insert into inmueble (codigo, metros, descripcion, direccion, dni_agente) values ('bugolettij', 220, 'Pois-coronary vasodilat', '5939 Glendale Crossing', '9091386162');

insert into locales (codigo, uso, servicio, cod_inmueble) values ('jkinglake0', 'Bursitis NEC', false, 'acremer0');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('nstangoe1', 'Thrombophlebitis leg NOS', false, 'pveldens1');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('mjiracek2', 'Dermatitis due to plant', true, 'tbecaris2');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('adalgleish3', 'Hodg nodul sclero mult', true, 'aeringey3');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('kkielt4', 'Ac polio NOS-type 1', false, 'llomath4');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('tdomenichini5', 'Fx base femoral nck-open', true, 'sgatheridge5');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('eneem6', 'Leishmaniasis NOS', true, 'dplayer6');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('hstoving7', 'Benign hyp ht dis w/o hf', false, 'grumbelow7');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('sstorrar8', 'Transpos great vess NEC', true, 'jcowcha8');
insert into locales (codigo, uso, servicio, cod_inmueble) values ('aodriscoll9', 'BPH NOS w/o ur obs/LUTS', false, 'pbowell9');

insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('dmellmoth0', 21, 1, 'dgoman1');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('ghead1', 12, 2, 'rdoncom2');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('drhead2', 3, 3, 'tpalluschek3');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('gprisk3', 4, 4, 'yhaverson4');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('cmeynell4', 15, 5, 'tjanko5');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('dgildea5', 6, 6, 'jgoadby6');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('sblezard6', 17, 7, 'mphillps7');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('npegden7', 28, 8, 'mgoatman8');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('doruane8', 19, 9, 'jhackin9');
insert into garajes (codigo, num_garaje, planta, cod_inmueble) values ('nmoraleda9', 30, 10, 'omacillrick0');

insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('skirvin0', 'YWBLJ', 'dmellmoth0', 'vvedenicheva');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('megre1', 'CYVBK', 'ghead1', 'lebhardtb');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('itry2', 'LTBFL', 'drhead2', 'mgabbitisc');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('lduffin3', 'SYBEM', 'gprisk3', 'dtanseyd');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('gmorehall4', 'UTDTN', 'cmeynell4', 'rhollindalee');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('emuselli5', 'CYCLO', 'dgildea5', 'ostillef');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('dfeeny6', 'KTIWP', 'sblezard6', 'ikyngeg');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('hhudd7', 'KHIEQ', 'npegden7', 'hwareingh');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('wshawell8', 'EFKER', 'doruane8', 'acundeyi');
insert into pisos (codigo, cod_piso, cod_garaje, cod_inmueble) values ('smaundrell9', 'AYBMS', 'nmoraleda9', 'bugolettij');

insert into compra (codigo, fecha, valor, cod_inmueble) values ('KLAARD', str_to_date('1/14/2023', '%m/%d/%Y'), 43000, 'acremer0');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('KSBBQI', str_to_date('1/18/2023', '%m/%d/%Y'), 8900, 'pveldens1');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('VRCCMM', str_to_date('3/14/2023', '%m/%d/%Y'), 10000, 'tbecaris2');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('U5DD5', str_to_date('9/25/2023', '%m/%d/%Y'), 9000, 'aeringey3');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('YOEELW', str_to_date('4/17/2023', '%m/%d/%Y'), 81000, 'llomath4');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('AYFFEV', str_to_date('6/19/2023', '%m/%d/%Y'), 73000, 'sgatheridge5');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('LGGGKF', str_to_date('5/25/2023', '%m/%d/%Y'), 66000, 'dplayer6');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('AAHHAA', str_to_date('9/19/2023', '%m/%d/%Y'), 57000, 'grumbelow7');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('ROIIRK', str_to_date('10/6/2023', '%m/%d/%Y'), 86000, 'jcowcha8');
insert into compra (codigo, fecha, valor, cod_inmueble) values ('KEJJNL', str_to_date('1/22/2023', '%m/%d/%Y'), 20000, 'pbowell9');

insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('WAZZOC', 111, 'vvedenicheva', '5102949406');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('AYYYKA', 112, 'lebhardtb', '8556025553');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('FXXXLR', 113, 'mgabbitisc', '3058726074');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('KIWWWDP', 114, 'dtanseyd', '7098950295');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('KFVVXY', 115, 'rhollindalee', '8911546157');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('KSUUFO', 116, 'ostillef', '4556796758');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('HKTTFG', 117, 'ikyngeg', '7174712383');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('UUSSBP', 118, 'hwareingh', '3109246420');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('PARRKK', 119, 'acundeyi', '5314751580');
insert into alquiler (id, numero, cod_inmueble, dni_cliente) values ('ZMQQAT', 120, 'bugolettij', '9407944380');

insert into pago (id, fecha, valor) values ('AABA', str_to_date('4/11/2023', '%m/%d/%Y'), 60);
insert into pago (id, fecha, valor) values ('JZAZ', str_to_date('7/26/2023', '%m/%d/%Y'), 50);
insert into pago (id, fecha, valor) values ('LFAQ', str_to_date('8/2/2023', '%m/%d/%Y'), 75);
insert into pago (id, fecha, valor) values ('SDLY', str_to_date('5/6/2023', '%m/%d/%Y'), 40);
insert into pago (id, fecha, valor) values ('EDSB', str_to_date('1/31/2023', '%m/%d/%Y'), 87);
insert into pago (id, fecha, valor) values ('HAYAL', str_to_date('7/6/2023', '%m/%d/%Y'), 56);
insert into pago (id, fecha, valor) values ('YBONS', str_to_date('12/20/2022', '%m/%d/%Y'), 91);
insert into pago (id, fecha, valor) values ('LIRAJ', str_to_date('1/28/2023', '%m/%d/%Y'), 73);
insert into pago (id, fecha, valor) values ('KIZXD', str_to_date('12/6/2022', '%m/%d/%Y'), 77);
insert into pago (id, fecha, valor) values ('USODP', str_to_date('12/31/2022', '%m/%d/%Y'), 87);

insert into pagar (id_alquiler, id_pago) values ('WAZZOC', 'AABA');
insert into pagar (id_alquiler, id_pago) values ('AYYYKA', 'JZAZ');
insert into pagar (id_alquiler, id_pago) values ('FXXXLR', 'LFAQ');
insert into pagar (id_alquiler, id_pago) values ('KIWWWDP', 'SDLY');
insert into pagar (id_alquiler, id_pago) values ('KFVVXY', 'EDSB');
insert into pagar (id_alquiler, id_pago) values ('KSUUFO', 'HAYAL');
insert into pagar (id_alquiler, id_pago) values ('HKTTFG', 'YBONS');
insert into pagar (id_alquiler, id_pago) values ('UUSSBP', 'LIRAJ');
insert into pagar (id_alquiler, id_pago) values ('PARRKK', 'KIZXD');
insert into pagar (id_alquiler, id_pago) values ('ZMQQAT', 'USODP');


DELETE FROM `inmuebles`.`cliente` WHERE (`dni` = '3109246420');
DELETE FROM `inmuebles`.`cliente` WHERE (`dni` = '9407944380');
DELETE FROM `inmuebles`.`cliente` WHERE (`dni` = '3058726074');
DELETE FROM `inmuebles`.`cliente` WHERE (`dni` = '5102949406');
UPDATE `inmuebles`.`cliente` SET `cod_personal` = 'aaaa' WHERE (`dni` = '7098950295');
