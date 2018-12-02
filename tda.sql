CREATE OR REPLACE TYPE BODY premio AS MEMBER FUNCTION
valida_tipo (tipo IN VARCHAR) RETURN BOOLEAN IS
valor_no_valido EXCEPTION 
resultado BOOLEAN
begin
	if LOWER(tipo) <> 'medalla' or LOWER(tipo) <> 'certificado' THEN
		raise valor_no_valido;
	else
		RETURN (resultado = true)
	END IF;
EXCEPTION
	WHEN valor_no_valido THEN
		raise aplication_error(-20001, 'El dominio de tipo es Medalla o Certificado');
END;

CREATE OR REPLACE TYPE premio AS OBJECT
(
	nombre VARCHAR2(30),
	tipo VARCHAR2(11),
	monto NUMBER(8,2),
	posicion INTEGER,
	descripcion VARCHAR2,
	MEMBER FUNCTION valida_tipo (tipo IN VARCHAR) RETURN BOOLEAN
)


CREATE OR REPLACE TYPE valoracion AS OBJECT
(
	nombre_elemento VARCHAR2(30),
	valor NUMBER,
	observacion VARCHAR2
)


CREATE OR REPLACE TYPE lugar_nac AS OBJECT
(
	pais VARCHAR2(50),
	ciudad VARCHAR2(50)
)



CREATE OR REPLACE TYPE costo AS OBJECT
(
	pais VARCHAR2(50),
	cant_muestras NUMBER,
	valor NUMBER(8,2),
)


CREATE OR REPLACE TYPE unidad_moneda AS OBJECT
(
	nombre VARCHAR2(50),
	simbolo VARCHAR2(3),
	valor NUMBER(8,2),
)


CREATE OR REPLACE TYPE BODY calificacion AS MEMBER FUNCTION
valida_puntaje (puntaje IN INTEGER) RETURN BOOLEAN IS
puntaje_no_valido EXCEPTION 
resultado BOOLEAN
begin
	if puntaje <= 0 THEN
		raise puntaje_no_valido;
	else
		RETURN (resultado = true)
	END IF;
EXCEPTION
	WHEN puntaje_no_valido THEN
		raise aplication_error(-20001, 'El puntaje debe ser un número mayor o igual a cero');
END;

CREATE OR REPLACE TYPE calificacion AS OBJECT
(
	nombre_critico VARCHAR2(70),
	comentarios VARCHAR2(3),
	puntaje INTEGER,
	MEMBER FUNCTION valida_puntaje (puntaje IN INTEGER) RETURN BOOLEAN
)


CREATE OR REPLACE TYPE BODY tipo_valor AS MEMBER FUNCTION
valida_cantidad (puntaje IN INTEGER) RETURN BOOLEAN IS
cantidad_no_valido EXCEPTION 
resultado BOOLEAN
begin
	if puntaje <= 0 THEN
		raise cantidad_no_valido;
	else
		RETURN (resultado = true)
	END IF;
EXCEPTION
	WHEN cantidad_no_valido THEN
		raise aplication_error(-20001, 'La cantidad debe ser un número mayor o igual a cero');
END;

CREATE OR REPLACE TYPE tipo_valor AS OBJECT
(
	ano DATE,
	cantidad INTEGER,
	MEMBER FUNCTION valida_cantidad (cantidad IN INTEGER) RETURN BOOLEAN
)


CREATE OR REPLACE TYPE exp_dist AS OBJECT
(
	tipo_valor tipo_valor,
	pais VARCHAR2(50),
)


CREATE OR REPLACE TYPE hechos AS OBJECT
(
	ano DATE,
	sucesos VARCHAR2,
)


CREATE OR REPLACE TYPE escala AS OBJECT
(
	elemento VARCHAR2(50),
	rango_i INTEGER,
	rango_f INTEGER,
	clasificacion VARCHAR2(1)
)
