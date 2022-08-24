
-- //////////////////////////
CREATE TABLE ${flyway:database}.cliente(
    id int auto_increment NOT NULL,
    name  varchar(50) NOT NULL,
    lastname varchar(50) NOT NULL,
    tm_fecha_creacion_registro timestamp NULL,
    tm_creado_por varchar(50)  NULL,
    tm_fecha_modificacion_registro timestamp NULL,
    tm_modificado_por varchar(50)  NULL,
    CONSTRAINT cliente_pkey PRIMARY KEY (id)

);
CREATE TRIGGER ${flyway:database}.cliente_insert_aud
    BEFORE INSERT ON ${flyway:database}.cliente
    FOR EACH ROW
    set NEW.tm_creado_por=USER(),
		NEW.tm_fecha_creacion_registro=now();

CREATE TRIGGER ${flyway:database}.cliente_update_aud
    BEFORE UPDATE ON ${flyway:database}.cliente
    FOR EACH ROW
    set NEW.tm_fecha_modificacion_registro=now(),
		NEW.tm_modificado_por=USER();

-- //////////////////////////

CREATE TABLE ${flyway:database}.producto(
    id int auto_increment NOT NULL,
    id_cliente int,
    nombre_producto varchar(50) NOT NULL,
    descripcion varchar(50) NOT NULL,
    tm_fecha_creacion_registro timestamp NULL,
    tm_creado_por varchar(50)  NULL,
    tm_fecha_modificacion_registro timestamp NULL,
    tm_modificado_por varchar(50)  NULL,
    CONSTRAINT producto_pkey PRIMARY KEY (id),
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id)

);
CREATE TRIGGER ${flyway:database}.producto_insert_aud
    BEFORE INSERT ON ${flyway:database}.producto
    FOR EACH ROW
    set NEW.tm_creado_por=USER(),
		NEW.tm_fecha_creacion_registro=now();

CREATE TRIGGER ${flyway:database}.producto_update_aud
    BEFORE UPDATE ON ${flyway:database}.producto
    FOR EACH ROW
    set NEW.tm_fecha_modificacion_registro=now(),
		NEW.tm_modificado_por=USER();

-- ///////////////////