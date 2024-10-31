create database concesionario;
use concesionario;
CREATE TABLE CILINDRAJE (
  idCilindraje INTEGER NOT NULL AUTO_INCREMENT,
  n_cilindraje INTEGER,
  PRIMARY KEY(idCilindraje)
);

CREATE TABLE CLIENTE (
  Cedula INTEGER  NOT NULL,
  nombre VARCHAR (25),
  apellidos VARCHAR (25),
  email VARCHAR (100),
  direccion VARCHAR (255),
  telefono VARCHAR (10),
  PRIMARY KEY(Cedula)
);


-- Crear tabla Detalle_Venta
CREATE TABLE DETALLE_VENTA (
  venta_n_factura INT UNSIGNED NOT NULL,
  vehiculo_placa VARCHAR(15) NOT NULL,
  PRIMARY KEY(venta_n_factura, vehiculo_placa),
  INDEX fk_venta_idx(venta_n_factura),
  INDEX fk_vehiculo_idx(vehiculo_placa)
);

-- Crear tabla Marca
CREATE TABLE MARCA (
  id_marca INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY(id_marca)
);

-- Crear tabla Modelo
CREATE TABLE MODELO (
  idModelo INT UNSIGNED NOT NULL AUTO_INCREMENT,
  opciones_modelo_id INT UNSIGNED NOT NULL,
  precio_opcion DECIMAL(10, 2),
  PRIMARY KEY(idModelo),
  INDEX fk_opciones_modelo_idx(opciones_modelo_id)
);

-- Crear tabla Opciones_Modelo
CREATE TABLE OPCIONES_MODELO (
  idOpciones_Modelo INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50),
  descripcion VARCHAR(255),
  PRIMARY KEY(idOpciones_Modelo)
);

-- Crear tabla Vehiculo
CREATE TABLE VEHICULO (
  placa VARCHAR(15) NOT NULL,
  marca_id INT UNSIGNED NOT NULL,
  cilindraje_id INT UNSIGNED NOT NULL,
  modelo_id INT UNSIGNED NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY(placa),
  INDEX fk_modelo_idx(modelo_id),
  INDEX fk_cilindraje_idx(cilindraje_id),
  INDEX fk_marca_idx(marca_id)
);

-- Crear tabla Vehiculo_Usado
CREATE TABLE VEHICULO_USADO (
placa VARCHAR(15),
  modelo_id INT UNSIGNED NOT NULL,
  marca_id INT UNSIGNED NOT NULL,
  cliente_cedula INT UNSIGNED NOT NULL,
  precio_tasacion DECIMAL(10, 2),
  fecha_cesion DATE,
  PRIMARY KEY(placa),
  INDEX fk_cliente_idx(cliente_cedula),
  INDEX fk_marca_usado_idx(marca_id),
  INDEX fk_modelo_usado_idx(modelo_id)
);

-- Crear tabla Vendedor
CREATE TABLE VENDEDOR (
  cedula INT UNSIGNED NOT NULL,
  nombre VARCHAR(25),
  apellido VARCHAR(25),
  email VARCHAR(100),
  direccion VARCHAR(255),
  telefono VARCHAR(10),
  PRIMARY KEY(cedula)
);

-- Crear tabla Venta
CREATE TABLE Venta (
  n_factura INT UNSIGNED NOT NULL AUTO_INCREMENT,
  vendedor_cedula INT UNSIGNED NOT NULL,
  cliente_cedula INT UNSIGNED NOT NULL,
  precio_total DECIMAL(10, 2),
  fecha DATE,
  PRIMARY KEY(n_factura),
  INDEX fk_cliente_venta_idx(cliente_cedula),
  INDEX fk_vendedor_venta_idx(vendedor_cedula)
);

CREATE TABLE Medio_pago (
  idMedio_pago INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  VEHICULO_USADO_idVEHICULO_USADO INTEGER UNSIGNED NOT NULL,
  tipo VARCHAR(50) NULL,
  descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idMedio_pago, VEHICULO_USADO_idVEHICULO_USADO),
  INDEX Medio_pago_FKIndex2(VEHICULO_USADO_idVEHICULO_USADO)
);

CREATE TABLE DETALLE_MEDIO_DE_PAGO (
  Medio_pago_VEHICULO_USADO_idVEHICULO_USADO INTEGER UNSIGNED NOT NULL,
  Medio_pago_idMedio_pago INTEGER UNSIGNED NOT NULL,
  VENTA_n_factura INTEGER UNSIGNED NOT NULL,
  total INTEGER UNSIGNED NULL,
  PRIMARY KEY(Medio_pago_VEHICULO_USADO_idVEHICULO_USADO, Medio_pago_idMedio_pago, VENTA_n_factura),
  INDEX Medio_pago_has_VENTA_FKIndex1(Medio_pago_idMedio_pago, Medio_pago_VEHICULO_USADO_idVEHICULO_USADO),
  INDEX Medio_pago_has_VENTA_FKIndex2(VENTA_n_factura)
);
