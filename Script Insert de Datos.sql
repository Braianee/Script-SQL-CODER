-- INSERT DE SEDES
INSERT INTO sedes (nombre_sede) VALUES
('Pto. Madryn'),
('Rawson'),
('Barcos');

-- INSERT DE USUARIOS
INSERT INTO usuarios (nombre, apellido, email, telefono, id_sede) VALUES
('Juan', 'Pérez', 'juan.perez@empresa.com', '2804123456', 1),
('Ana', 'Gómez', 'ana.gomez@empresa.com', '2804678901', 2),
('Luis', 'Fernández', 'luis.fernandez@empresa.com', '2804987654', 1),
('Laura', 'Martínez', 'laura.martinez@empresa.com', '2804567890', 1),
('Ana', 'García', 'ana.garcia@empresa.com', '2804001234', 1),
('Carlos', 'Pérez', 'carlos.perez@empresa.com', '2804456789', 2),
('Lucía', 'Sánchez', 'lucia.sanchez@empresa.com', '2804789012', 1),
('Martín', 'López', 'martin.lopez@empresa.com', '2804123456', 2),
('Juan', 'Pérez', 'juan.perez@email.com', '1123456789', 1),
('Ana', 'Gómez', 'ana.gomez@email.com', '1123456790', 2),
('Luis', 'Fernández', 'luis.fernandez@email.com', '1123456791', 1),
('María', 'Rodríguez', 'maria.rodriguez@email.com', '1123456792', 1),
('Carlos', 'López', 'carlos.lopez@email.com', '1123456793', 2),
('Laura', 'Martínez', 'laura.martinez@email.com', '1123456794', 1),
('Pedro', 'García', 'pedro.garcia@email.com', '1123456795', 1),
('Florencia', 'Ruiz', 'florencia.ruiz@email.com', '1123456796', 2),
('Martín', 'Sánchez', 'martin.sanchez@email.com', '1123456797', 2),
('Lucía', 'Díaz', 'lucia.diaz@email.com', '1123456798', 1),
('Javier', 'Romero', 'javier.romero@email.com', '1123456799', 2),
('Cecilia', 'Alvarez', 'cecilia.alvarez@email.com', '1123456700', 3),
('Nicolás', 'Silva', 'nicolas.silva@email.com', '1123456701', 1),
('Julieta', 'Molina', 'julieta.molina@email.com', '1123456702', 2),
('Santiago', 'Castro', 'santiago.castro@email.com', '1123456703', 2),
('Agustina', 'Ortiz', 'agustina.ortiz@email.com', '1123456704', 1),
('Federico', 'Ibarra', 'federico.ibarra@email.com', '1123456705', 2),
('Milagros', 'Paredes', 'milagros.paredes@email.com', '1123456706', 1),
('Diego', 'Luna', 'diego.luna@email.com', '1123456707', 1),
('Camila', 'Vega', 'camila.vega@email.com', '1123456708', 2),
('Lucas', 'Ramírez', 'lucas.ramirez@ejemplo.com', '2804000001', 3),
('Sofía', 'Martínez', 'sofia.martinez@ejemplo.com', '2804000002', 1);


-- INSERT DE EQUIPOS
INSERT INTO equipos (id_sede, id_usuario, tipo_equipo, marca, modelo, disco_duro, sistema_operativo, memoria_ram, estado, fecha_entrega, fecha_actualizacion, observaciones)
VALUES
(1, 1, 'Notebook', 'HP', 'ProBook 450', '512GB SSD', 'Windows 10', '8GB', 'en uso', '2024-01-15', '2024-04-01', NULL),
(1, NULL, 'PC', 'Dell', 'OptiPlex 3080', '1TB HDD', 'Windows 11', '16GB', 'backup', NULL, '2024-03-01', NULL),
(2, 3, 'Notebook', 'Lenovo', 'ThinkPad T14', '256GB SSD', 'Windows 10', '8GB', 'en uso', '2024-02-10', '2024-04-05', NULL),
(3, NULL, 'PC', 'HP', 'EliteDesk 800', '512GB SSD', 'Ubuntu 22.04', '8GB', 'obsoleto', NULL, '2023-11-01', 'Reemplazar por modelo más reciente'),
(2, 6, 'Notebook', 'Acer', 'Aspire 5', '1TB HDD', 'Windows 10', '4GB', 'falla', '2024-01-20', '2024-03-25', 'Pantalla rota'),
(2, 7, 'PC', 'Lenovo', 'ThinkCentre', '1TB HDD', 'Windows 10', '4GB', 'backup', NULL, NULL, NULL),
(2, 2, 'Notebook', 'Dell', 'Latitude', '256GB SSD', 'Windows 11', '8GB', 'en uso', '2023-07-15', '2024-01-15', 'Pantalla rota'),
(3, NULL, 'PC', 'Asus', 'VivoPC', '500GB HDD', 'Ubuntu 20.04', '4GB', 'obsoleto', NULL, NULL, 'Reemplazar por nuevo modelo'),
(2, 15, 'Notebook', 'HP', 'Pavilion', '512GB SSD', 'Windows 10', '8GB', 'en uso', '2023-08-10', '2024-02-12', NULL),
(3, NULL, 'PC', 'Acer', 'Aspire', '1TB HDD', 'Windows 7', '4GB', 'backup', NULL, NULL, NULL),
(2, 30, 'Notebook', 'HP', 'Pavilion', '512GB SSD', 'Windows 10', '8GB', 'en uso', '2023-08-10', '2024-02-12', NULL),
(1, 16, 'Notebook', 'Dell', 'Inspiron', '1TB SSD', 'Windows 11', '16GB', 'en uso', '2023-09-01', '2024-03-01', NULL),
(1, 22, 'Notebook', 'HP', 'EliteBook 840', '512GB SSD', 'Windows 10', '16GB', 'en uso', '2024-10-01', '2025-01-15', 'Actualizar a Windows 11'),
(2, 2, 'PC de escritorio', 'Dell', 'OptiPlex 7070', '1TB HDD', 'Ubuntu 22.04', '8GB', 'backup', NULL, NULL, NULL),
(3, NULL, 'Router', 'TP-Link', 'Archer C6', 'N/A', 'N/A', 'N/A', 'falla', '2025-03-20', NULL, 'Falla de conexión intermitente'),
(1, 3, 'Notebook', 'Lenovo', 'ThinkPad T14', '256GB SSD', 'Windows 11', '8GB', 'en uso', '2024-09-05', '2025-02-10', NULL),
(1, 4, 'PC', 'Apple', 'Mac Mini', '512GB SSD', 'macOS Monterey', '16GB', 'en uso', '2025-04-10', '2025-04-16', NULL),
(3, NULL, 'PC', 'Lenovo', 'ThinkCentre M90', '1TB SSD', 'Windows 10', '16GB', 'en uso', '2025-04-05', '2025-04-10', 'Actualización de seguridad requerida'),
(2, 8, 'Notebook', 'HP', 'Elite Dragonfly', '1TB SSD', 'Windows 11', '16GB', 'en uso', '2025-04-01', '2025-04-10', NULL),
(1, NULL, 'PC', 'Acer', 'Aspire X', '512GB SSD', 'Windows 11', '8GB', 'backup', NULL, '2025-04-12', NULL),
(2, 9, 'PC', 'HP', 'Omen 30L', '2TB HDD', 'Windows 11', '32GB', 'en uso', '2025-04-08', '2025-04-15', NULL);


-- INSERT DE HISTORIAL_CAMBIOS
INSERT INTO historial_cambios (id_equipo, id_usuario_anterior, id_usuario_nuevo, motivo, fecha_cambio)
VALUES
(6, 5, 6, 'falla', '2024-03-01'),
(7, 6, 7, 'rotura', '2024-03-05'),
(8, 7, 8, 'otro', '2024-03-07'),
(9, 8, 9, 'falla', '2024-03-10'),
(10, 9, 10, 'rotura', '2024-03-12'),
(11, 10, 11, 'otro', '2024-03-15'),
(12, 11, 12, 'falla', '2024-03-17'),
(13, 12, 13, 'rotura', '2024-03-20'),
(14, 13, 14, 'falla', '2024-03-22'),
(15, 14, 15, 'otro', '2024-03-25'),
(16, 15, 16, 'falla', '2024-03-27'),
(17, 16, 17, 'rotura', '2024-03-30'),
(18, 17, 18, 'falla', '2024-04-01'),
(19, 18, 19, 'otro', '2024-04-03'),
(20, 19, 20, 'rotura', '2024-04-05');

-- INSERT DE INVENTARIO_SEDES
INSERT INTO inventario_sedes (id_sede, id_equipo, estado, fecha_registro)
VALUES
(1, 2, 'backup', '2024-03-01'),
(1, 6, 'asignado', '2024-03-05'),
(1, 10, 'obsoleto', '2024-03-10'),
(1, 13, 'asignado', '2024-03-12'),
(1, 15, 'backup', '2024-03-15'),
(1, 17, 'asignado', '2024-03-17'),
(1, 18, 'backup', '2024-03-18'),
(2, 3, 'asignado', '2024-03-02'),
(2, 7, 'backup', '2024-03-06'),
(2, 9, 'asignado', '2024-03-09'),
(2, 11, 'obsoleto', '2024-03-11'),
(2, 14, 'asignado', '2024-03-14'),
(2, 16, 'backup', '2024-03-16'),
(2, 19, 'asignado', '2024-03-19'),
(3, 4, 'obsoleto', '2024-03-03'),
(3, 5, 'backup', '2024-03-04'),
(3, 8, 'asignado', '2024-03-08'),
(3, 12, 'asignado', '2024-03-13'),
(3, 20, 'backup', '2024-03-20');

-- INSERT DE BARCOS
INSERT INTO barcos (nombre_barco, fecha_arribo, estado_equipos, posibles_mejoras, numero_anydesk) VALUES
('Don Mario', '2024-01-10', 'ok', 'Actualizar RAM', '123456'),
('Don Mario', '2024-03-15', 'falla', 'Revisión general', '123456'),
('Don Mario', '2024-04-12', 'ok', NULL, '123456'),
('Santa María', '2024-02-01', 'falla', 'Reemplazo de HDD', '789012'),
('Santa María', '2024-03-05', 'ok', NULL, '789012'),
('Torres del Sur', '2024-01-25', 'obsoleto', 'Actualizar software', '456789'),
('Mar del Norte', '2024-02-10', 'ok', NULL, '321654'),
('Mar del Norte', '2024-03-20', 'falla', 'Revisión batería', '321654'),
('Estrella Austral', '2024-01-18', 'ok', NULL, '987654'),
('Estrella Austral', '2024-04-01', 'ok', NULL, '987654'),
('Patagonia', '2024-02-28', 'falla', 'Actualizar sistema', '741852'),
('Bahía Azul', '2024-03-12', 'ok', NULL, '852963'),
('Bahía Azul', '2024-04-05', 'ok', NULL, '852963'),
('Amanecer Sur', '2024-03-01', 'falla', 'Revisión completa', '369258'),
('Sur Austral', '2024-04-08', 'ok', NULL, '147258');


