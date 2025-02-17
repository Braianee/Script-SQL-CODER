CREATE DATABASE gestion_inventario;
USE gestion_inventario;

-- TABLA DE SEDES
CREATE TABLE sedes (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sede VARCHAR(50) NOT NULL
);

-- TABLA USUARIOS
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20) NOT NULL,
    id_sede INT,
    FOREIGN KEY (id_sede) REFERENCES sedes(id_sede) ON DELETE SET NULL
);

-- TABLA BARCOS
CREATE TABLE barcos (
    id_barco INT AUTO_INCREMENT PRIMARY KEY,
    nombre_barco VARCHAR(100) NOT NULL,
    fecha_arribo DATE,
    estado_equipos ENUM('ok', 'falla', 'obsoleto'),
    posibles_mejoras TEXT,
    numero_anydesk VARCHAR(30)
);

-- TABLA EQUIPOS
CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_sede INT NOT NULL,
    id_usuario INT,
    tipo_equipo VARCHAR(50) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    disco_duro VARCHAR(50),
    sistema_operativo VARCHAR(50),
    memoria_ram VARCHAR(50),
    estado ENUM('en uso', 'backup', 'falla', 'obsoleto') NOT NULL,
    fecha_entrega DATE,
    fecha_actualizacion DATE,
    posibles_mejoras TEXT,
    fallas_reportadas TEXT,
    cambios_realizados TEXT,
    FOREIGN KEY (id_sede) REFERENCES sedes(id_sede) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL
);

-- TABLA INVENTARIO_SEDES
CREATE TABLE inventario_sedes (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_sede INT NOT NULL,
    id_equipo INT NOT NULL,
    estado ENUM('asignado', 'backup', 'obsoleto') NOT NULL,
    fecha_registro DATE NOT NULL,
    FOREIGN KEY (id_sede) REFERENCES sedes(id_sede) ON DELETE CASCADE,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo) ON DELETE CASCADE
);

-- TABLA HISTORIAL_CAMBIOS
CREATE TABLE historial_cambios (
    id_cambio INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    id_usuario_anterior INT,
    id_usuario_nuevo INT,
    motivo ENUM('falla', 'rotura', 'otro') NOT NULL,
    fecha_cambio DATE NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario_anterior) REFERENCES usuarios(id_usuario) ON DELETE SET NULL,
    FOREIGN KEY (id_usuario_nuevo) REFERENCES usuarios(id_usuario) ON DELETE SET NULL
);
