-- CONSULTAS
-- 1.listar productos disponibles por categoria , ordenados por precio

SELECT 
c.nombre AS categoria,
p.nombre AS producto,
p.precio,
p.stock
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.stock > 0
ORDER BY c.nombre ASC, p.precio ASC;

-- la consulta muestra los productos disponible, la categoria y tambien el stock y precio de cada producto,
-- se hace un inner join entre productos y categorias para obtener el nombre de la categoria y con el where
-- se muestran solo los que tienen stock, se ordena por categoria y precio de menor a mayor


-- 2. mostrar clientes con pedidos pendientes y total de compras.

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

-- la consulta muestra el id y nombre del cliente, ademas de que muestra el contador de pedidos pendientes y 
-- el total de compras, ocupe el count para contar los pedidos pendientes y el sum para hacer el calculo dela 
-- suma de las compras, luego se hace un inner join entre clientes, pedidos y detalles_pedido para obtener los datps 
-- comparando el id del cliente con el id del cliente de los pedidos y el id del pedido con el id del pedido
-- de los detalles y se seleccionanan solo los que tienen estado 1 que es el estado pendiente, al final con
-- gruop id se agrupan los resultados por id del cliente y nombre del cliente



-- 3. reporte con los 5 preoductos con mejor calificacion promedio en reseñas.

SELECT 
p.nombre,
AVG(r.calificacion) AS calificacion_promedio
FROM resenas r
INNER JOIN productos p ON r.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY calificacion_promedio DESC
LIMIT 5;

-- la consulta muestra el nombre del producto y la calificacion promedio de las resenas,
-- se hace un inner join entre resenas y productos para obtener el nombre del producto segun el id,
--luego se agrupan los resultados por id del producto y nombre del producto , se ordena de mayor a menor calificacion
-- promedio y se limita a 5 resultados para mostrar los 5 mejores productos



