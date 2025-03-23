
-- ==========================
--        VISTAS
-- ==========================

-- Vista: vw_cant_usuarios_por_sede
CREATE OR REPLACE VIEW vw_cant_usuarios_por_sede AS
SELECT 
    s.nombre_sede AS Sede,
    COUNT(u.id_usuario) AS Cantidad_Usuarios
FROM 
    SEDES s
LEFT JOIN 
    USUARIOS u 
    ON s.id_sede = u.id_sede
GROUP BY 
    s.nombre_sede;

-- Vista: vw_cant_equipos_por_sede
CREATE OR REPLACE VIEW vw_cant_equipos_por_sede AS
SELECT 
    s.nombre_sede AS Sede,
    COUNT(e.id_equipo) AS Cantidad_Equipos
FROM 
    SEDES s
LEFT JOIN 
    EQUIPO e 
    ON s.id_sede = e.id_sede
GROUP BY 
    s.nombre_sede;

-- Vista: vw_equipos_por_sede
CREATE OR REPLACE VIEW vw_equipos_por_sede AS
SELECT 
    s.nombre_sede AS Sede,
    e.id_equipo AS ID_Equipo,
    e.tipo_equipo AS Tipo_Equipo,
    e.marca AS Marca,
    e.modelo AS Modelo,
    e.disco_duro AS Disco_Duro,
    e.sitema_operativo AS Sistema_Operativo,
    e.memoria_ram AS Memoria_RAM,
    e.estado AS Estado,
    e.fecha_entrega AS Fecha_Entrega,
    e.fecha_actualizacion AS Fecha_Actualizacion,
    e.posibles_mejoras AS Posibles_Mejoras,
    e.fallas_reportadas AS Fallas_Reportadas,
    e.cambios_realizados AS Cambios_Realizados
FROM 
    SEDES s
LEFT JOIN 
    EQUIPO e 
    ON s.id_sede = e.id_sede;

-- Vista: vw_arribos_barcos
CREATE OR REPLACE VIEW vw_arribos_barcos AS
SELECT 
    b.nombre_barco AS Nombre_Barco,
    b.fecha_arribo AS Fecha_Arribo,
    b.estado_equipos AS Estado_Equipos,
    b.posibles_mejoras AS Posibles_Mejoras,
    b.numero_anydesk AS Numero_AnyDesk
FROM 
    BARCOS b;

-- Vista: vw_historial_cambios
CREATE OR REPLACE VIEW vw_historial_cambios AS
SELECT 
    hc.id_cambio AS ID_Cambio,
    e.id_equipo AS ID_Equipo,
    e.tipo_equipo AS Tipo_Equipo,
    e.marca AS Marca,
    e.modelo AS Modelo,
    ua.nombre AS Usuario_Anterior_Nombre,
    ua.apellido AS Usuario_Anterior_Apellido,
    un.nombre AS Usuario_Nuevo_Nombre,
    un.apellido AS Usuario_Nuevo_Apellido,
    hc.motivo_cambio AS Motivo_Cambio,
    hc.fecha_cambio AS Fecha_Cambio
FROM 
    HISTORIAL_CAMBIOS hc
LEFT JOIN 
    EQUIPO e ON hc.id_equipo = e.id_equipo
LEFT JOIN 
    USUARIOS ua ON hc.id_usuario_anterior = ua.id_usuario
LEFT JOIN 
    USUARIOS un ON hc.id_usuario_nuevo = un.id_usuario;


-- ==========================
--       FUNCIONES
-- ==========================

DELIMITER //

-- Funcion: ObtenerCantidadEquiposPorSede
CREATE FUNCTION ObtenerCantidadEquiposPorSede(id_sede_param INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_equipos INT;

    SELECT COUNT(*) INTO cantidad_equipos
    FROM EQUIPO
    WHERE id_sede = id_sede_param;

    RETURN cantidad_equipos;
END;
//

-- Funcion: VerificarEstadoEquipo
CREATE FUNCTION VerificarEstadoEquipo(id_equipo_param INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE estado_actual VARCHAR(20);

    SELECT estado INTO estado_actual
    FROM EQUIPO
    WHERE id_equipo = id_equipo_param;

    RETURN estado_actual;
END;
//

-- Funcion: ObtenerHistorialDeCambiosPorEquipo
CREATE FUNCTION ObtenerHistorialDeCambiosPorEquipo(id_equipo_param INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_cambios INT;

    SELECT COUNT(*) INTO cantidad_cambios
    FROM HISTORIAL_CAMBIOS
    WHERE id_equipo = id_equipo_param;

    RETURN cantidad_cambios;
END;
//

-- Funcion: ContarUsuariosPorSede
CREATE FUNCTION ContarUsuariosPorSede(id_sede_param INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad_usuarios INT;

    SELECT COUNT(*) INTO cantidad_usuarios
    FROM USUARIOS
    WHERE id_sede = id_sede_param;

    RETURN cantidad_usuarios;
END;
//

-- Funcion: ObtenerProximoArribo
CREATE FUNCTION ObtenerProximoArribo(id_barco_param INT)
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE proximo_arribo DATE;

    SELECT MIN(fecha_arribo) INTO proximo_arribo
    FROM BARCOS
    WHERE id_barco = id_barco_param AND fecha_arribo >= CURDATE();

    RETURN proximo_arribo;
END;
//

-- ==========================
--          TRIGGERS
-- ==========================

DELIMITER //

-- Trigger: trg_AuditarCambiosEquipo
CREATE TRIGGER trg_AuditarCambiosEquipo
AFTER UPDATE ON EQUIPO
FOR EACH ROW
BEGIN
    IF NEW.id_usuario <> OLD.id_usuario THEN
        INSERT INTO HISTORIAL_CAMBIOS (
            id_equipo, id_usuario_anterior, id_usuario_nuevo, motivo_cambio, fecha_cambio
        )
        VALUES (
            NEW.id_equipo, OLD.id_usuario, NEW.id_usuario, 'Cambio de usuario', CURDATE()
        );
    END IF;

    IF NEW.estado <> OLD.estado THEN
        INSERT INTO HISTORIAL_CAMBIOS (
            id_equipo, id_usuario_anterior, id_usuario_nuevo, motivo_cambio, fecha_cambio
        )
        VALUES (
            NEW.id_equipo, NEW.id_usuario, NEW.id_usuario, CONCAT('Cambio de estado a: ', NEW.estado), CURDATE()
        );
    END IF;
END;
//

-- Trigger: trg_ActualizarInventarioSede
CREATE TRIGGER trg_ActualizarInventarioSede
AFTER INSERT ON EQUIPO
FOR EACH ROW
BEGIN
    INSERT INTO INVENTARIO_SEDES (
        id_sede, id_equipo, estado, fecha_registro
    )
    VALUES (
        NEW.id_sede, NEW.id_equipo, NEW.estado, CURDATE()
    );
END;
//

-- Trigger: trg_EliminarEquipoInventario
CREATE TRIGGER trg_EliminarEquipoInventario
AFTER DELETE ON EQUIPO
FOR EACH ROW
BEGIN
    DELETE FROM INVENTARIO_SEDES
    WHERE id_equipo = OLD.id_equipo;
END;
//