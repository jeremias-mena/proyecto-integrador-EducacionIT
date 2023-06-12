-- Etapa 1.1
-- 1. Crear una base de datos con el nombre LABORATORIO. En el caso de que la base de datos exista previamente, eliminarla antes de iniciar el laboratorio.
DROP DATABASE IF EXISTS LABORATORIO;
CREATE DATABASE LABORATORIO;

-- 2. Poner en uso la base de datos generada en el paso anterior.
USE LABORATORIO;

-- 3. Crear una tabla con el nombre FACTURAS dentro de la base de datos con la estructura que se muestra en la diapositiva 5 y tener en cuenta las siguientes consideraciones:
-- a. PK significa PRIMARY KEY.
-- b. Observar que se declara una clave primaria compuesta por los campos Letra y Número; cada campo por sí solo no es clave, ni tampoco identifica al registro, pero 
-- la combinación de ambos forman la clave.
CREATE TABLE FACTURAS(
letra char, 
numero integer,
clienteID integer,
articuloID integer,
fecha date,
monto float,
PRIMARY KEY (letra, numero)
);

-- 4. Crear una tabla con el nombre ARTÍCULOS dentro de la base de datos y tomar en consideración la estructura definida en la diapositiva 5.
CREATE TABLE ARTICULOS(
articuloID integer,
nombre varchar(50),
precio float,
stock integer,
PRIMARY KEY(articuloID)
);

-- 5. Crear una tabla con el nombre CLIENTES dentro de la base de datos y tomar en consideración la estructura definida en la diapositiva siguiente.
CREATE TABLE CLIENTES(
clienteID integer,
nombre varchar(25),
apellido varchar(25),
CUIT char(16),
direccion varchar(50),
comentarios varchar(50),
PRIMARY KEY(clienteID)
);

-- 6. Mostrar un listado de todas las bases de datos alojadas en el servidor.
SHOW DATABASES;

-- 7. Mostrar un listado de todas las tablas generadas anteriormente dentro de la base de datos con el nombre LABORATORIO.
SHOW TABLES;
-- 8. Comentar la instrucción que lista las tablas contenidas dentro de la base de datos LABORATORIO.
-- SHOW TABLES;
-- 9. Describir la estructura de la tabla CLIENTES.
DESCRIBE CLIENTES; 
-- DESC CLIENTES;

-- Etapa 1.2
-- 1. Modificar la tabla FACTURAS tomando en cuenta las siguientes consideraciones:
    -- a. Cambiar el nombre del campo ClienteID por IDCliente, manteniendo su tipo de dato y restricciones ya definidas.
    -- b. Cambiar el nombre del campo ArticuloID por IDArticulo, manteniendo su tipo de dato y restricciones ya definidas.
    -- c. Asignar la restricción UNSIGNED al campo Monto, manteniendo el tipo de dato ya definido para el campo.
ALTER TABLE FACTURAS 
CHANGE clienteID idCliente int,
CHANGE articuloID idArticulo int,
MODIFY monto float UNSIGNED;

-- 2. Modificar la tabla ARTICULOS tomando en cuenta las siguientes consideraciones:
    -- a. Cambiar el nombre del campo ArticuloID por IDArticulo, manteniendo su tipo de dato y restricciones ya definidas.
    -- b. Cambiar el tipo de dato del campo Nombre para que admita hasta 75 caracteres.
    -- c. Asignar las restricciones UNSIGNED y NOT NULL al campo Precio, manteniendo el tipo de dato ya definido para el campo.
    -- d. Asignar las restricciones UNSIGNED y NOT NULL al campo Stock, manteniendo el tipo de dato ya definido para el campo.
ALTER TABLE ARTICULOS 
CHANGE ArticuloID idArticulo int,
MODIFY nombre varchar(75),
MODIFY precio float UNSIGNED NOT NULL,
MODIFY stock float UNSIGNED NOT NULL;

-- 3. Modificar la tabla CLIENTES. Tomar en cuenta las siguientes consideraciones:
    -- a. Cambiar el nombre del campo ClienteID por IDCliente, manteniendo su tipo de dato y restricciones ya definidas.
    -- b. Cambiar el tipo de dato del campo Nombre para que admita hasta 30 caracteres y asigne la restricción correspondiente para que su carga sea obligatoria.
    -- c. Cambiar el tipo de dato del campo Apellido para que admita hasta 35 caracteres y asigne la restricción correspondiente para que su carga sea obligatoria.
    -- d. Cambiar el nombre del campo Comentarios por Observaciones y su tipo de dato para que admita hasta 255 caracteres. 
ALTER TABLE CLIENTES 
CHANGE ClienteID idCliente int,
MODIFY nombre varchar(30) NOT NULL,
MODIFY apellido varchar(35) NOT NULL,
CHANGE comentarios observaciones varchar(255);  

-- Etapa 1.3
-- 1. Cargar 5 registros en la tabla FACTURAS, tal como se detallan a en el pdf "Etapa 1.3"
INSERT INTO FACTURAS VALUES('A', 28, 14, 335, '2021-03-18', 1589.50,
							'A', 39, 26, 157, '2021-03-18', 979.75,
                            'B', 8, 17, 95, '2021-04-25', 513.35,
                            'B', 12, 5, 411, '2021-05-03', 2385.70,
                            'B', 19, 50, 157, '2021-05-26', 979.75); 
-- 2. Cargar 4 registros en la tabla ARTÍCULOS,  tal como se detallan en el pdf "Etapa 1.3"
INSERT INTO ARTICULOS VALUES(95, 'Webcam con Micrófono Plug and Play', 513.35, 39,
							157, 'Apple AirPods Pro', 979.75, 152,
							335, 'Lavasecarropas Automático Samsung', 1589.50, 12,
							411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);
-- 3. Cargar 5 registros en la tabla CLIENTES,  tal como se detallan en el pdf "Etapa 1.3"
INSERT INTO CLIENTES VALUES(5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 'VIP',
							14, 'Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 'GBA',
                            17, 'Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 'GBA',
                            26, 'Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 'VIP',
                            50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA'
);

-- Desafíos
-- 1. Crear una base de datos con el nombre BONUS_TRACK.
DROP DATABASE IF EXISTS  BONUS_TRACK;
CREATE DATABASE BONUS_TRACK;
-- 2. Poner en uso la base de datos generada en el paso anterior.
USE BONUS_TRACK;
-- 3. Crear una tabla con el nombre “AGENDA” dentro de la base de datos, con la estructura que se muestra en la siguiente diapositiva.
CREATE TABLE AGENDA (idContacto integer,
nombre varchar(20) NOT NULL,
apellido varchar(15) NOT NULL,
domicilio varchar(50),
telefono varchar(50) NOT NULL,
primary key(idContacto)
);
-- 4. Comentar el código SQL generado para la creación de la tabla “AGENDA”.
-- 5. Visualizar las tablas existentes en la base de datos para verificar la creación de la tabla “AGENDA”.
-- 6. Visualizar la estructura de la tabla “AGENDA”.
SHOW TABLES;
-- 7. Agregar el campo MAIL a la tabla. Este campo deberá contener como máximo 50 caracteres y su carga es obligatoria.
ALTER TABLE AGENDA ADD mail varchar(50) NOT NULL;
-- 8. Insertar 4 registros en la tabla “AGENDA”.
INSERT INTO AGENDA VALUES (1, 'Jeremías', 'Mena', '25 de mayo 382', '3442534756','jere_mena3@gmail.com'),
						   (2, 'Mauro', 'Sander', 'Artigas 547', '3447896075','xlrmauro@hotmail.com'),
                           (3, 'José', 'Albaturvich', '9 de julio 832', '3442584156','joseph899@gmail.com'),
						   (4, 'Florencia', 'Bermudez', 'J.D. Perón  897', '3442453678', 'flor_ber45@gmail.com');


