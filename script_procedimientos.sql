-- PROCEDIMIENTOS ALMACENADOS

-- 1 . Registrar un nuevo pedido , verificando el limite de 5 pedidos pendientes y stock suficiente

DELIMITER $$

CREATE PROCEDURE sp_registrar_pedido(
    IN id_cl INT,
    IN id_prod INT,
    IN cantidad INT,
    IN fecha_ped DATE
)
BEGIN
    DECLARE pedidos_pendientes INT;
    DECLARE stock_actual INT;
    DECLARE nuevo_id_pedido INT;

    SELECT COUNT(*) INTO pedidos_pendientes
    FROM pedidos
    WHERE id_cliente = id_cl AND id_estado = 1;

    IF pedidos_pendientes >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente ya tiene 5 pedidos pendientes';
    ELSE
        SELECT stock INTO stock_actual
        FROM productos
        WHERE id_producto = id_prod;

        IF stock_actual < cantidad THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No hay suficiente stock para este producto';
        ELSE
            INSERT INTO pedidos (id_cliente, fecha_pedido, id_estado) VALUES (id_cl, fecha_ped, 1);
            SELECT id_pedido INTO nuevo_id_pedido
            FROM pedidos
            WHERE id_cliente = id_cl AND fecha_pedido = fecha_ped
            ORDER BY id_pedido DESC
            LIMIT 1;
            INSERT INTO detalles_pedido (cantidad, precio_unitario, id_pedido, id_producto)
            VALUES (
                cantidad,
                (SELECT precio FROM productos WHERE id_producto = id_prod),
                nuevo_id_pedido,
                id_prod
            );
            UPDATE productos SET stock = stock - cantidad WHERE id_producto = id_prod;
        END IF;
    END IF;
END$$

DELIMITER ;

-- Para sp_registrar_pedido pido el id del cliente, id del producto, cantidad y fecha del pedido en la firma,
-- luego dentro del scope declare tres variables, una para contar los pedidos pendientes del cliente, 
-- otra para el stock actual del producto y otra para el nuevo id del pedido que se va a mandar al detalle del pedido,
-- empiezo contando los pedidos pendientes del cliente si son 5 o mas se manda el mensaje de error,
-- si cumple con tener menos de 5 pedidos pendientes se verifica el stock del producto
-- si el stock es menor a la cantidad que se quiere pedir se manda un mensaje de error, si tiene el stock se insert
-- del pedido y con un select pido el id del pedido que se acaba de insertar para guardarlo y despues usarlo al
-- insertar el detalle del pedido que ocupa el resto de los datos que se pidieron en la firma. 
-- Finalemente actualizo el stock restandole lo vendido

-- Un ejemplo de uso seria CALL sp_registrar_pedido(3, 1, 2, '2025-07-30');





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
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente no ha comprado este producto';
    ELSE
        INSERT INTO resenas VALUES ( 0, id_cl, id_ped, id_prod,
            res_calificacion, res_comentario, res_fecha);
    END IF;
END$$

DELIMITER ;

-- Para sp_registrar_resena pido en la firma el id del cliente, id del pedido, id del producto, calificacion, 
-- comentario y fecha, luego en el scope mediante el select count se verifica si el cliente ha comprado el producto,
-- hacuendo un inner join entre pedidos y detalles_pedido, en el where se verifica que el id del pedido sea igual 
-- al id del pedido que meti en la firma y que el id del cliente sea igual al id del cliente que se metio en el call,
-- si manda 0 es que no ha comprado el producto y se manda un mensaje de error, si no es 0 se inserta la reseña
-- con los valores que pedi en la firma

-- el ejemplo de uso puede ser CALL sp_registrar_resena(3, 1, 1, 4, 'Muy buen producto', '2025-07-30');



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
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este producto no tiene stock suficiente';
    ELSE
        UPDATE productos
        SET stock = stock - cantidad_vendida
        WHERE id_producto = id_prod;
    END IF;
END$$

DELIMITER ;

-- Para sp_actualizar_stock pido el id del producto y la cantidad vendida del producto al que se le va a 
-- actualizar el stock, luego se verifica si el stock es menor a la cantidad vendida que meti en la firma,
-- si es menor se manda un mensaje de error y si no es menor se actualiza el stock restando la cantidad vendida al stock

-- Un ejemplo para actualizr el stock seria CALL sp_actualizar_stock(6, 3);



-- 4. Cambiar estado de un pedido

DELIMITER $$

CREATE PROCEDURE sp_cambiar_estado(
    IN id_ped INT ,
    IN id_est INT)
BEGIN
IF id_est > 4 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estado no existente (1-4)';
    ELSEIF NOT EXISTS(
        SELECT 1 FROM pedidos WHERE id_pedido = id_ped
    )THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El pedido no existe';
    ELSE
        UPDATE pedidos SET id_estado = id_est 
        WHERE id_pedido = id_ped;
    END IF;
END$$

DELIMITER ;

-- Para mi sp_cambiar_estado pido el id del pedido y el nuevo estado al que se quiere cambiar,
-- en el scope priemero se checa si el estado que se ingreso en la firma es valido, si no lo es manda error,
-- luego se verifica si existe el pedido con el id del pedido,sino existe se manda el mensaje de error,
-- y si si existe se actualiza el estado al que mandamos en la firma

-- Un ejemplo de uso para cambiar un estado seria CALL sp_cambiar_estado(1, 2); 


-- 5. eliminar resenas de un producto en especifico, actualizando el promedio de calificaciones

DELIMITER $$

CREATE PROCEDURE sp_eliminar_resena(IN id_prod INT)
BEGIN
    IF NOT EXISTS(
        SELECT 1 FROM resenas WHERE id_producto = id_prod
    )THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay resenas de ese producto';
    ELSE
        DELETE FROM resenas WHERE id_producto = id_prod;
    END IF;
END$$

DELIMITER ;

-- Para sp_eliminar_resena pido en la frima solo el id del producto, luego dentro del scope se verifica si hay resenas
-- de ese producto si no hay se manda el mensaje de error, si si hay resenas se eliminan todas las que tenga el producto

-- Un ejemplo para usar este sp seria CALL sp_eliminar_resena(5);


-- 6. Agregar un nuevo producto verificando que no exista un duplicado (mismo nombre y categoria)

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
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un producto con ese nombre y caracteristicas';
    ELSE
        INSERT INTO productos VALUES(0,nombre_prod,descripcion_prod,precio_prod,stock_prod,id_categoria_prod);
    END IF;
END$$

DELIMITER ;

-- Para sp_agregar_producto pido el nombre del producto, descripcion, precio, stock y la categoria del producto,
-- luego se verifica si ya existe un producto con el mismo nombre y categoria, si existe se manda un mensaje de error,
-- si no existe se inserta el nuevo producto con los valores de la firma

-- Un ejemplo de uso seria CALL sp_agregar_producto('Nintendo Switch 2', 'Consola de nintendo ', 13999.00, 10, 5);


-- 7. Actualizar la informacion de in cliente (el telefono)

DELIMITER $$

CREATE PROCEDURE sp_actualizar_telefono_cliente(IN id_cl INT,
	IN telefono_cl VARCHAR(15))
BEGIN
    IF NOT EXISTS(
        SELECT 1 FROM clientes WHERE id_cliente = id_cl
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontro al cliente';
    ELSEIF EXISTS(
        SELECT 1 FROM clientes WHERE telefono = telefono_cl AND id_cliente <> id_cl
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El telefono ya esta registrado por otro cliente';
    ELSE
        UPDATE clientes SET  telefono = telefono_cl
        WHERE id_cliente = id_cl;
    END IF;
END$$

DELIMITER ;

-- Para sp_actualizar_telefono_cliente pido el id del cliente y el telefono  luego primero con un
-- if se revisa que exista el cliente y sino manda el mensaje de error,luego busca tambien si telefono ya esta
-- registrado por otro cliente, si esta registrado se manda un mensaje de error,si el numero es diferente y
-- si existe el cliente se actualiza el telefono por el nuevo

-- el uso de este sp seria como ejemplo CALL sp_actualizar_telefono_cliente(3, '5512345688');



-- 8. Generar un reporte de productos con stock bajo (menos de 5 unidades)

DELIMITER $$

CREATE PROCEDURE sp_reporte_stock()
BEGIN
    SELECT nombre, stock FROM productos
    WHERE stock <= 5
    ORDER BY stock ASC;
END$$

DELIMITER ;

-- para este sp_reporte_stock no le pase paraemtros porque no los necesita
-- dentro del scope se hace la consulta de los productos con 5 o menos de 5 productos en stock 
-- y se ordena de menor a mayor stock con ASC

-- el uso de este procedimiento seria solo CALL sp_reporte_stock();