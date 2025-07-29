--listar productos disponibles por categoria , ordenados por precio

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


-- reporte con los 5 preoductos con mejor calificacion promedio en reseñas.