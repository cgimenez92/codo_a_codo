-- Inserción de registros --

INSERT INTO inupde.clientes (dni, nombre, apellido, genero, fecha_nacimiento, mail, movil, domicilio, barrio, nacionalidad)
	VALUES ('12169851', 'Luis Enrique', 'Pérez', 'HOMBRE', '1954-06-01', 'perez_luisenrique@ma1l.com', '1157319468', 'Pujol 416', 'Caballito', 'Uruguay');

INSERT INTO inupde.clientes (dni, nombre, apellido, genero, fecha_nacimiento, mail, movil, domicilio, barrio, nacionalidad)
	VALUES ('17278290', 'Florencia', 'Santos', 'MUJER', '1963-07-12', 'flor.santos@ma1l.com', '1148434346', 'Piran 3015', 'Villa Urquiza', 'Argentina'),
			('16839283', 'Luisa Nina', 'Escudero', 'MUJER', '1962-03-22', 'lulu62@hushma1l.com', '1175940343', 'Superi 348 1º A', 'Colegiales', 'Colombia'),
            ('19164274', 'Carlos Alberto', 'Medina', 'HOMBRE', '1966-04-26', 'medinacarlosalberto@z0h0.com', '1123423451', 'Mexico 2121', 'Balvanera', 'Argentina');


INSERT INTO inupde.clientes (dni, nombre, apellido, genero, fecha_nacimiento, mail, movil, domicilio, barrio, nacionalidad)
	VALUES ('36427254', 'María Sol', 'González', 'Mujer', '1992-08-15', 'ma.gon54@gma1l.com', '1136782013', 'Gurruchaga 243', 'Villa Crespo', 'Argentina');


-- Modificación de registros --

UPDATE inupde.clientes 
SET 
    apellido = 'Chaves'
WHERE
    id_cliente = 85;
    
UPDATE inupde.clientes 
SET 
    DNI = concat(0, DNI)
WHERE
    length(DNI) = 7;

UPDATE inupde.clientes 
SET 
    nombre = 'Nicolás'
WHERE
    nombre = 'Nicolas';

UPDATE inupde.clientes 
SET 
    apellido = upper(apellido)
WHERE
    nacionalidad <> 'Argentina';

-- Eliminación de registros --

DELETE FROM inupde.clientes WHERE id_cliente = 9804;

DELETE FROM inupde.clientes WHERE mail LIKE '%z0h0%';

DELETE FROM inupde.clientes WHERE barrio = 'Flores';
