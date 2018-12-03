CREATE OR REPLACE TYPE nombres_array as VARRAY(10) OF VARCHAR2(30);
CREATE SEQUENCE viduno_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1;
CREATE TABLE viduno(
    id_viduno INTEGER PRIMARY KEY,
    nombres nombres_array NOT NULL,
    color VARCHAR2(20) NOT NULL,
    clasificacion VARCHAR2(30) NOT NULL
);


CREATE SEQUENCE do_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1;
CREATE TABLE do (
    id_doc INTEGER,
    fk_id_region INTEGER,
    fk_id_region_pais INTEGER,
    fk_id_viduno INTEGER,
    nombre VARCHAR2(30),
    CONSTRAINT do_primary_key PRIMARY KEY (id_doc, fk_id_region, fk_id_region_pais, fk_id_viduno)
)


CREATE SEQUENCE b_do_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1;
CREATE TABLE b_do(
    id_b_do INTEGER,
    fk_id_doc INTEGER,
    fk_do_id_region INTEGER,
    fk_do_id_region_pais INTEGER,
    fk_do_id_viduno INTEGER,
    fk_id_bodega INTEGER,
    CONSTRAINT b_do_primary_key PRIMARY KEY (id_b_do, fk_id_doc, fk_do_id_region, fk_do_id_region_pais, fk_do_id_viduno, fk_id_bodega)
)


CREATE SEQUENCE cosecha_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1;
CREATE TABLE cosecha(
    id_cosecha INTEGER,
    fk_id_b_do INTEGER,
    fk_b_do_id_doc INTEGER,
    fk_b_do_id_region INTEGER,
    fk_b_do_id_region_pais INTEGER,
    fk_b_do_id_viduno INTEGER,
    fk_b_do_id_bodega INTEGER,
    ano DATE,
    calificacion VARCHAR(2),
    CONSTRAINT cosecha_primary_key PRIMARY KEY (id_cosecha, fk_id_b_do, fk_b_do_id_doc, fk_b_do_id_region, fk_b_do_id_region_pais, fk_b_do_id_viduno, fk_b_do_id_bodega)
    CONSTRAINT cosecha_check_calificacion CHECK (calificacion IN ('e', 'mb', 'b', 'r', 'd'))
)


CREATE OR REPLACE TYPE grado_alcohol_array as VARRAY(5) OF NUMBER(3,1);
CREATE SEQUENCE clasificacion_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1;
CREATE TABLE clasificacion(
    id INTEGER PRIMARY KEY,
    nombre VARCHAR2(30),
    grado_alcohol grado_alcohol_array NULL,
    nivel ,
)


CREATE OR REPLACE TYPE maridaje_array as VARRAY(5) OF VARCHAR2(1000);
CREATE OR REPLACE TYPE calificacion_fila as TABLE OF calificacion;
CREATE SEQUENCE marca_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1;
CREATE TABLE marca (
    id_marca INTEGER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    grado_alcohol NUMBER(3,1) NOT NULL,
    ph NUMBER(4,2) NOT NULL,
    acidez NUMBER(4,2) NOT NULL,
    tipo_tapon VARCHAR2(9) NOT NULL,
    azucares NUMBER(4,2) NOT NULL,
    contacto_madera BOOLEAN NOT NULL,
    elaboracion VARCHAR2(5000) NOT NULL,
    cata VARCHAR2(5000) NOT NULL,
    maridaje maridaje_array NOT NULL,
    consumo NUMBER(2,0) NOT NULL,
    tiempo_maduracion NUMBER(2,0) NOT NULL,
    ano_elaborado DATE NOT NULL,
    temperatura_servicio NUMBER(2,0) NOT NULL,
    fotos NULL,
    calificacion calificacion_fila NOT NULL,
    prod_anual tipo_valor_fila NOT NULL,
    exp_anual exp_dist_fila NOT NULL,
    fk_clasificacion INTEGER NOT NULL,

    CONSTRAINT marca_tipo_tapon CHECK (tipo_tapon IN ('corcho', 'sintetico', 'sintético', 'rosca') )
);



CREATE SEQUENCE presentacion_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1;
CREATE TABLE presentacion(
    id_presentacion INTEGER,
    fk_id_marca INTEGER 
    cantidad_botellas INTEGER NULL,
    tipo VARCHAR(4) NOT NULL,
    CONSTRAINT presentacion_primary_key PRIMARY KEY (id_presentacion, fk_id_marca),
    CONSTRAINT presentacion_tipo CHECK (tipo IN ('ml', 'cl', 'caja') )
)



CREATE TABLE precio_hist(
    ano INTEGER ,
    fk_id_presentacion INTEGER,
    fk_presentacion_id_marca INTEGER,
    precio NUMBER(8,2) NOT NULL
    CONSTRAINT precio_hist_primary_key PRIMARY KEY (ano, fk_id_presentacion, fk_presentacion_id_marca),
    CONSTRAINT precio_hist_ano CHECK (ano > 1000)
)


