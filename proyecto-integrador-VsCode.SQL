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
CREATE TABLE FACTURAS(letra char, 
numero integer,
clienteID integer,
articuloID integer,
fecha date,
monto float,
PRIMARY KEY(letra, numero));

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
-- SHOW DATABASES;

-- 7. Mostrar un listado de todas las tablas generadas anteriormente dentro de la base de datos con el nombre LABORATORIO.
-- SHOW TABLES;
-- 8. Comentar la instrucción que lista las tablas contenidas dentro de la base de datos LABORATORIO.
-- # SHOW TABLES;
-- 9. Describir la estructura de la tabla CLIENTES.
-- DESCRIBE CLIENTES; 
-- # DESC CLIENTES;

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