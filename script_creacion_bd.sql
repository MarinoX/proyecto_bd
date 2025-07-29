CREATE DATABASE tienda;
USE tienda;

CREATE TABLE estados(
	id_estado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(20)
);


CREATE TABLE clientes(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(45),
	correo VARCHAR(45) UNIQUE,
	telefono VARCHAR(15) UNIQUE,
	direccion VARCHAR(50)
);

CREATE TABLE pedidos(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	fecha_pedido DATE,
	id_estado INT,
	id_cliente INT,
	FOREIGN KEY (id_estado)
	REFERENCES estados(id_estado),
	FOREIGN KEY (id_cliente)
	REFERENCES clientes(id_cliente) 
);

CREATE TABLE categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(30),
	descripcion VARCHAR(100)
);


CREATE TABLE productos(
	id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(45),
	descripcion VARCHAR(100),
	precio DECIMAL(10,2),
	stock INT CHECK (stock >= 0),
	id_categoria INT,
	FOREIGN KEY (id_categoria)
	REFERENCES categorias(id_categoria)
	
);

CREATE TABLE detalles_pedido(
	id_detalle INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	cantidad INT,
	precio_unitario DECIMAL(10,2),	
	id_pedido INT,
	id_producto INT,
	FOREIGN KEY (id_pedido)
	REFERENCES pedidos(id_pedido),
	FOREIGN KEY (id_producto)
	REFERENCES productos(id_producto)

);


CREATE TABLE resenas(
	id_resena INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_cliente INT,
	id_pedido INT,
	id_producto INT,
	calificacion INT,
	comentario VARCHAR(100),
	fecha DATE,
	FOREIGN KEY (id_cliente)
	REFERENCES clientes(id_cliente), 
	FOREIGN KEY (id_pedido)
	REFERENCES pedidos(id_pedido),
	FOREIGN KEY (id_producto)
	REFERENCES productos(id_producto)
);