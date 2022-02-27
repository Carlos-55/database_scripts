REATE DATABASE CREDITO;

USE CREDITO;

CREATE TABLE USUARIOS(
	id_usuario int not null primary key auto_increment,
	nombre varchar(50) not null,
	apellido_paterno varchar(50) not null,
	apellido_materno varchar(50) null,
	created_at DATE default NOW()
);


CREATE  TABLE PRODUCTOS(
       id_producto int not null primary key auto_increment,
       nombre varchar(50) not null,
       costo DECIMAL(19, 4) not null,
       tipo varchar(50) default 'Muebles',
       created_at DATE default NOW()
);


CREATE TABLE ABONO(
	id_abono int not null primary key auto_increment,
	fecha_limite DATE not null,
	factor DECIMAL(19,4) default 0.8,
	total_meses DECIMAL(19,4) not null,
	comprado_el DATE not null default NOW(),
	pagado BOOLEAN not null default false,
	id_usuario int not null,
	id_producto int not null
);

ALTER TABLE ABONO ADD
CONSTRAINT fk_usuario
   FOREIGN KEY(id_usuario)
   REFERENCES USUARIOS(id_usuario);

ALTER TABLE ABONO ADD
CONSTRAINT fk_producto
   FOREIGN KEY(id_producto)
   REFERENCES PRODUCTOS(id_producto);


CREATE PROCEDURE add_user(
	IN add_name varchar(50),
	IN add_apellido_paterno varchar(50),
	IN add_apellido_materno varchar(50)
)
BEGIN 
	INSERT INTO USUARIOS (nombre, apellido_paterno, apellido_materno)
	VALUES (add_name, add_apellido_paterno, add_apellido_materno);
	SELECT * FROM USUARIOS;
END;

CREATE PROCEDURE add_product(
	IN add_product_nombre VARCHAR(50),
	IN add_product_costo DECIMAL(19,4),
	IN add_product_tipo VARCHAR(50)
)
BEGIN 
	IF add_product_tipo IS NULL THEN
		INSERT INTO PRODUCTOS (nombre, costo)
		VALUES (add_product_nombre, add_product_costo);
		SELECT * FROM PRODUCTOS;
	ELSE
		INSERT INTO PRODUCTOS(nombre, costo, tipo)
		VALUES (add_product_nombre, add_product_costo, add_product_tipo
		);
		SELECT * FROM PRODUCTOS;
	END IF;
END;


