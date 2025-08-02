-- Propuestas de mejoras 

-- Trigger para tener restriccion de maximo 5 pedidos pendientes por cliente

DELIMITER $$

CREATE TRIGGER limitar_pedidos_pendientes
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
    DECLARE pedidos_pendientes INT;

    SELECT COUNT(*) INTO pedidos_pendientes
    FROM pedidos
    WHERE id_cliente = NEW.id_cliente AND id_estado = 1;

    IF NEW.id_estado = 1 AND pedidos_pendientes >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente ya tiene 5 pedidos pendientes.';
    END IF;
END$$

DELIMITER ;


-- Trigger para tener restriccion para solo resenas de clientes que compraron el producto

DELIMITER $$

CREATE TRIGGER validar_resena
BEFORE INSERT ON resenas
FOR EACH ROW
BEGIN
    DECLARE conteo INT;

    SELECT COUNT(*) INTO conteo
    FROM pedidos, detalles_pedido
    WHERE pedidos.id_pedido = detalles_pedido.id_pedido
      AND pedidos.id_pedido = NEW.id_pedido
      AND pedidos.id_cliente = NEW.id_cliente
      AND detalles_pedido.id_producto = NEW.id_producto;

    IF conteo = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente no puede resenar un producto que no compro.';
    END IF;
END$$

DELIMITER ;


-- Indice para buscar pedido por fecha
CREATE INDEX idx_fecha_pedido ON pedidos(fecha_pedido);

-- Indice para buscar pedido por estado 
CREATE INDEX idx_estado_pedido ON pedidos(id_estado);

-- Indice para obtener los detalles del pedido por id del pedido
CREATE INDEX idx_id_pedido_detalle ON detalles_pedido(id_pedido);

-- Indice para buscar informacion del cliente por correo
CREATE INDEX idx_correo_cliente ON clientes(correo);


-- ejemplo de vista para productos que valgan menos de 5000 pesos

CREATE VIEW VistaProductos AS
SELECT id_producto, nombre , precio
FROM productos
WHERE precio < 5000.00;

SELECT * FROM VistaProductos;
