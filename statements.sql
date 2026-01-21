/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
);

-- PASO 2
-- Tu código aquí
CREATE TABLE roles (
    id_role INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

-- PASO 3
-- Tu código aquí

ALTER TABLE usuarios
ADD id_role INT;

ALTER TABLE usuarios
ADD CONSTRAINT fk_usuarios_roles
FOREIGN KEY (id_role) REFERENCES roles(id_role);

/* Asignar roles a usuarios */
UPDATE usuarios SET id_role = 1 WHERE id_usuario = 1;
UPDATE usuarios SET id_role = 2 WHERE id_usuario = 2;
UPDATE usuarios SET id_role = 3 WHERE id_usuario = 3;
UPDATE usuarios SET id_role = 4 WHERE id_usuario = 4;
UPDATE usuarios SET id_role = 1 WHERE id_usuario = 5;

-- PASO 4
-- Tu código aquí
SELECT 
    u.id_usuario,
    u.nombre,
    u.apellido,
    u.email,
    u.edad,
    r.nombre_rol
FROM usuarios u
JOIN roles r ON u.id_role = r.id_role;



/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

-- PASO 2
-- Tu código aquí

ALTER TABLE categorias
ADD id_usuario INT;

ALTER TABLE categorias
ADD CONSTRAINT fk_categorias_usuarios
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

-- PASO 3
-- Tu código aquí

UPDATE categorias SET id_usuario = 1 WHERE id_categoria IN (1,6);
UPDATE categorias SET id_usuario = 2 WHERE id_categoria IN (2,7);
UPDATE categorias SET id_usuario = 3 WHERE id_categoria IN (3,8);
UPDATE categorias SET id_usuario = 4 WHERE id_categoria IN (4,9);
UPDATE categorias SET id_usuario = 5 WHERE id_categoria IN (5,10);

-- PASO 4
-- Tu código aquí

SELECT
    u.id_usuario,
    u.nombre,
    c.nombre_categoria
FROM usuarios u
JOIN categorias c ON u.id_usuario = c.id_usuario;

UPDATE categorias SET id_usuario = NULL;
TRUNCATE TABLE categorias;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí

CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- PASO 2
-- Tu código aquí

INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4),
(4, 2);

-- PASO 3
-- Tu código aquí

SELECT
    u.id_usuario,
    u.nombre,
    u.apellido,
    r.nombre_rol,
    c.nombre_categoria
FROM usuarios u
JOIN roles r ON u.id_role = r.id_role
JOIN usuarios_categorias uc ON u.id_usuario = uc.id_usuario
JOIN categorias c ON uc.id_categoria = c.id_categoria;














