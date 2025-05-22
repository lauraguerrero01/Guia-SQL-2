DROP DATABASE if exists marcas_tec;
CREATE DATABASE marcas_tec;

USE marcas_tec;

CREATE TABLE Fabricante (
	codigo INT (10) NOT NULL auto_increment,
	nombre varchar (100),
    PRIMARY KEY (codigo)
);

CREATE TABLE Producto (
	codigo INT (10) NOT NULL auto_increment,
	nombre varchar (100),
	precio double,
	codigo_fabricante INT (10),
	PRIMARY KEY (codigo)

);

-- Tabla para logs de triggers
CREATE TABLE Log_Eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_evento VARCHAR(50),
    descripcion TEXT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Tabla para registrar los productos insertados
CREATE TABLE Log_Inserciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DOUBLE,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



ALTER TABLE Producto
ADD constraint FK_codigofabricante_Producto
foreign key (codigo_fabricante) REFERENCES Fabricante (codigo);
