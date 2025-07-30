-- listar productos disponibles por categoria , ordenados por precio

SELECT 
c.nombre AS categoria,
p.nombre AS producto,
p.precio,
p.stock
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.stock > 0
ORDER BY c.nombre ASC, p.precio ASC;

-- mostrar clientes con pedidos pendientes y total de compras.

SELECT
c.id_cliente,
c.nombre,
COUNT(p.id_pedido) AS pedidos_pendientes,
SUM(dp.cantidad * dp.precio_unitario) AS total_compras
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
INNER JOIN detalles_pedido dp ON p.id_pedido = dp.id_pedido
WHERE p.id_estado = 1
GROUP BY c.id_cliente, c.nombre;

-- reporte con los 5 preoductos con mejor calificacion promedio en reseñas.

SELECT 
p.nombre,
AVG(r.calificacion) AS calificacion_promedio
FROM resenas r
INNER JOIN productos p ON r.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY calificacion_promedio DESC
LIMIT 5;

-- Procedimientos almacenados
-- 1 . Registrar un nuevo pedido , verificando el limite de 5 pedidos pendientes y stock suficiente

-- 2. Registrar una resena , verificando que el cliente haya pedido el producto

DELIMITER $$

CREATE PROCEDURE sp_registrar_resena(
    IN id_cl INT,IN id_ped INT,IN id_prod INT,
    IN res_calificacion INT,
    IN res_comentario VARCHAR(100),
    IN res_fecha DATE)
BEGIN
    IF(
        SELECT COUNT(*) 
        FROM pedidos p
        INNER JOIN detalles_pedido dp ON p.id_pedido = dp.id_pedido
        WHERE p.id_pedido = id_ped AND p.id_cliente = id_cl
        AND dp.id_producto = id_prod
    ) = 0 THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "El cliente no ha comprado este producto";
    ELSE
        INSERT INTO resenas VALUES ( 0, id_cl, id_ped, id_prod,
            res_calificacion, res_comentario, res_fecha);
    END IF;
END$$

DELIMITER ;

CALL sp_registrar_resena(3, 1, 1, 4, "Muy buen producto", "2025-07-30");

-- 3. Actualizar el stock de un producto despues de un pedido

DELIMITER $$

CREATE PROCEDURE sp_actualizar_stock (
    IN id_prod INT,
    IN cantidad_vendida INT
)
BEGIN
    IF (
        SELECT stock
        FROM productos
        WHERE id_producto = id_prod 
    ) < cantidad_vendida THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Este producto no tiene stock";
    ELSE
        UPDATE productos
        SET stock = stock - cantidad_vendida
        WHERE id_producto = id_prod;
    END IF;
END$$

DELIMITER ;

--4. Cambiar estado de un pedido

DELIMITER $$

CREATE PROCEDURE sp_cambiar_estado(
    IN id_ped INT ,
    IN id_est INT)
BEGIN
    IF NOT EXISTS(
        SELECT 1 FROM pedidos WHERE id_pedido = id_ped
    )THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "El pedido no existe";
    ELSE
        UPDATE pedidos SET id_estado = id_est 
        WHERE id_pedido = id_ped;
    END IF;
END$$

DELIMITER ;

--5. eliminar resenas de un producto en especifico, actualizando el promedio de calificaciones

DELIMITER $$

CREATE PROCEDURE sp_eliminar_resena(IN id_prod INT)
BEGIN
    IF NOT EXISTS(
        SELECT 1 FROM resenas WHERE id_producto = id_prod
    )THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "No hay resenas de ese producto"
    ELSE
        DELETE FROM resenas WHERE id_producto = id_prod;
    END IF;
END$$

DELIMITER ;


--6. Agregar un nuevo producto verificando que no exista un duplicado (mismo nombre y categoria)

DELIMITER $$

CREATE PROCEDURE sp_agregar_producto(IN nombre_prod VARCHAR(45),
	IN descripcion_prod VARCHAR(100),
	IN precio_prod DECIMAL(10,2),
	IN stock_prod INT,
	IN id_categoria_prod INT)
BEGIN
    IF EXISTS(
        SELECT 1 FROM productos WHERE nombre = nombre_prod AND 
        id_categoria = id_categoria_prod
    )THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Ya existe un producto con ese nombre y caracteristicas";
    ELSE
        INSERT INTO productos VALUES(0,nombre_prod,descripcion_prod,precio_prod,stock_prod,id_categoria_prod);
    END IF;
END$$

DELIMITER ;

--7. Actualizar la informacion de in cliente

DELIMITER $$

CREATE PROCEDURE sp_actualizar_cliente(IN id_cl INT,
	IN nombre_cl VARCHAR(45),
	IN correo_cl VARCHAR(45),
	IN telefono_cl VARCHAR(15),
	IN direccion_cl VARCHAR(50))
BEGIN
    IF NOT EXISTS(
        SELECT 1 FROM clientes WHERE id_cliente = id_cl
    )THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "No se encontro al cliente";
    ELSE
        UPDATE clientes SET nombre = nombre_cl,correo = correo_cl, telefono = telefono_cl, direccion = direccion_cl
        WHERE id_cliente = id_cl;
    END IF;
END$$

DELIMITER ;

--8. Generar un reporte de productos con stock bajo (menos de 5 unidades)

DELIMITER $$

CREATE PROCEDURE sp_reporte_stock()
BEGIN
    SELECT nombre, stock FROM productos
    WHERE stock <= 5
    ORDER BY stock ASC;
END$$

DELIMITER ;