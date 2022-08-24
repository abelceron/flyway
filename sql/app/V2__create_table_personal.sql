
-- //////////////////////////
CREATE TABLE ${flyway:database}.personal(
    id int auto_increment NOT NULL,
    name  varchar(50) NOT NULL,
    lastnamename  varchar(50) NOT NULL,
    tm_fecha_creacion_registro timestamp NULL,
    tm_creado_por varchar(50)  NULL,
    tm_fecha_modificacion_registro timestamp NULL,
    tm_modificado_por varchar(50)  NULL,
    CONSTRAINT personal_pkey PRIMARY KEY (id)

);
CREATE TRIGGER ${flyway:database}.personal_insert_aud
    BEFORE INSERT ON ${flyway:database}.personal
    FOR EACH ROW
    set NEW.tm_creado_por=USER(),
		NEW.tm_fecha_creacion_registro=now();

CREATE TRIGGER ${flyway:database}.personal_update_aud
    BEFORE UPDATE ON ${flyway:database}.personal
    FOR EACH ROW
    set NEW.tm_fecha_modificacion_registro=now(),
		NEW.tm_modificado_por=USER();

-- ///////////////////
