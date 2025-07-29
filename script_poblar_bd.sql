-- inserciones en estados

INSERT INTO estados VALUES (0,"Pendiente");
INSERT INTO estados VALUES (0,"Enviado");
INSERT INTO estados VALUES (0,"Entregado");
INSERT INTO estados VALUES (0,"Cancelado");

-- inserciones en categorias

INSERT INTO categorias VALUES (0, "Laptops", "Computadoras portatiles de varias marcas");
INSERT INTO categorias VALUES (0, "Smartphones", "Celulares de diferentes marcas y modelos");
INSERT INTO categorias VALUES (0, "Pantallas", "Televisiones y monitores para computadoras o consolas");
INSERT INTO categorias VALUES (0, "Accesorios", "Audifonos, bocinas, mouses, teclados y mas");
INSERT INTO categorias VALUES (0, "Videojuegos", "Consolas, juegos y controles para videojuegos");

-- inserciones para clientes

INSERT INTO clientes VALUES (0, "Luis Garcia", "luisg@gmail.com", "5512122101", "Ajusco #13, Col. Pedregal, CDMX");
INSERT INTO clientes VALUES (0, "Raul Ortiz", "raul.pollo@gmail.com", "5571718812", "San Angel #2, Col. Coyoacan , CDMX");
INSERT INTO clientes VALUES (0, "Laura Sanchez", "laura_san@gmail.com", "5590123542", "Insurgentes Sur #1234, Col. Insurgentes, CDMX");
INSERT INTO clientes VALUES (0, "Pedro Perez", "peterperez@outlook.com", "5599123212", "Calle Santander #45, Col. Nativitas, CDMX");
INSERT INTO clientes VALUES (0, "Leonel Silva", "leosilva10@gmail.com", "5510101010", "Golondrinas #11, Col. Obrera, CDMX");
INSERT INTO clientes VALUES (0, "Jaime Nuno", "jaime.nu88@gmail.com", "5552566671", "Calle San Pablo #1, Col. Palmas, CDMX");
INSERT INTO clientes VALUES (0, "Ricardo Millos", "richardmilles@outlook.com", "5512120989", "Av.Tamaulipas #19, Col. Santa Lucia, CDMX");
INSERT INTO clientes VALUES (0, "Sergio Perez", "sp11@gmail.com", "5511551107", "Av.Americana #11, Col. Los Alamos, CDMX");
INSERT INTO clientes VALUES (0, "Carlos Lopez", "charles.l@gmail.com", "5553441488", "Calle Monaco #1, Col. Roma, CDMX");
INSERT INTO clientes VALUES (0, "Victoria Corona", "vicky.cor@gmail.com", "5500236611", "Calle Modelo #105, Col. Santa Anna, CDMX");
INSERT INTO clientes VALUES (0, "Carlos Sainz", "carlos.s55@outlook.com", "5510556371", "Calle Morita #55, Col. Madeira, CDMX");
INSERT INTO clientes VALUES (0, "Aitana Gomez", "aitana_1212@yahoo.com.mx", "5587054422", "Av. Corregidora #8, Col. Fundadores, CDMX");
INSERT INTO clientes VALUES (0, "Alma Guerrero", "soulsoul88@gmail.com", "5591817721", "Ajusco #188, Col. Pedregal, CDMX");
INSERT INTO clientes VALUES (0, "Maximilano Vazquez", "maxv33@gmail.com", "5504041134", "San Cristobal #33, Col. Vallejo, EDOMEX");
INSERT INTO clientes VALUES (0, "Cristian Rojo", "cris.r7@gmail.com", "5577076677", "Av. Mohammed Duvan #7, Col. Arabe, CDMX");

-- inserciones para productos

INSERT INTO productos VALUES (0, "HP Pavilion 15", "Laptop con Intel i5 y 8GB RAM", 12999.99, 4, 1);
INSERT INTO productos VALUES (0, "Lenovo IdeaPad 3", "Laptop 15.6 pulgadas, con Ryzen 5 y SSD 512GB", 11499.00, 8, 1);
INSERT INTO productos VALUES (0, "Asus VivoBook 14", "Laptop con pantalla FULLHD, Intel i3, 8GB RAM", 10299.50, 5, 1);
INSERT INTO productos VALUES (0, "Acer Aspire 5", "Laptop 15 pulgadas, Ryzen 7 y 16GB RAM", 13750.00, 6, 1);
INSERT INTO productos VALUES (0, "MacBook Air M2", "Laptop apple con chip M2", 18999.99, 4, 1);
INSERT INTO productos VALUES (0, "Lenovo Legion Slim 5", "Laptop con ryzen7, SSD 1TB, rtx 4060", 15499.00, 7, 1);
INSERT INTO productos VALUES (0, "MSI Modern 15", "Laptop con intel i5, 8 ram", 14200.00, 5, 1);

INSERT INTO productos VALUES (0, "iPhone 13", "Smartphone de 128GB, camara dual, iOS 17", 17499.00, 10, 2);
INSERT INTO productos VALUES (0, "Samsung Galaxy A54", "6.4 pulgadas, pantalla AMOLED, 256GB", 8499.50, 5, 2);
INSERT INTO productos VALUES (0, "Xiaomi Redmi Note 13", "Smartphone 5G, camara 108MP, 8GB RAM,", 6599.99, 8, 2);
INSERT INTO productos VALUES (0, "Motorola G84", "Smatphone con pantalla OLED,128GB, 12GB RAM", 7199.00, 3, 2);
INSERT INTO productos VALUES (0, "Huawei Nova 11", "Smartphone con 128GB de almacenamiento, Android 13", 7999.00, 6, 2);
INSERT INTO productos VALUES (0, "Honor X8", "Smartphone huawei, 8gb RAM, Snapdragon 680", 5999.00, 8, 2);
INSERT INTO productos VALUES (0, "Poco 11T", "Pantalla HD+, bateria 5000mAh, 265GB almacenamiento, 6GB RAM", 4399.99, 11, 2);

INSERT INTO productos VALUES (0, "Samsung Smart TV 50", "Television 4K UHD con HDR", 8499.00, 4, 3);
INSERT INTO productos VALUES (0, "LG Monitor 27MK400H", "Full HD 75Hz 27 pulgadas", 3299.99, 6, 3);
INSERT INTO productos VALUES (0, "BenQ GW2480", "Monitor 24 pulgadas, IPS, HDMI", 2999.00, 7, 3);
INSERT INTO productos VALUES (0, "Hisense A6H", "Smart TV 4K , 60Hz", 8699.00, 3, 3);
INSERT INTO productos VALUES (0, "AOC 24B1XHS", "Monitor Gamer de 24 pulgadas sin bordes", 2649.00, 5, 3);
INSERT INTO productos VALUES (0, "Xiaomi 24i", "Monitor 24 pulgadas IPS, 75Hz", 2899.00, 4, 3);
INSERT INTO productos VALUES (0, "Philips TV", "TV de 32 pulgadas HD", 2999.00, 2, 3);

INSERT INTO productos VALUES (0, "Logitech G435", "Audifonos gamer inalambricos", 1499.00, 10, 4);
INSERT INTO productos VALUES (0, "Razer DeathAdder V2", "Mouse gamer con 20000 de DPI", 1199.00, 7, 4);
INSERT INTO productos VALUES (0, "Redragon K552", "Teclado mecanico retroiluminado", 999.00, 5, 4);
INSERT INTO productos VALUES (0, "Sony SRS-XB13", "Bocina portatil bluetooth", 749.00, 8, 4);
INSERT INTO productos VALUES (0, "Logitech MK270", "Combo de teclado y mouse inalambrico", 799.00, 9, 4);
INSERT INTO productos VALUES (0, "HP OMEN 600", "Mouse gamer RGB", 849.00, 6, 4);
INSERT INTO productos VALUES (0, "HyperX Cloud Stinger", "Audifonos para gamer con microfono", 1149.00, 4, 4);

INSERT INTO productos VALUES (0, "PlayStation 5", "Consola con lector de discos, 1TB SSD", 13499.00, 3, 5);
INSERT INTO productos VALUES (0, "Xbox Series S", "Consola digital 512GB SSD", 7499.00, 6, 5);
INSERT INTO productos VALUES (0, "Nintendo Switch OLED", "Pantalla OLED 7 pulgadas y 128GB de almacenamiento", 8899.00, 5, 5);
INSERT INTO productos VALUES (0, "DualSense Controller", "Control para PS5 color blanco", 1599.00, 10, 5);
INSERT INTO productos VALUES (0, "EA FC25", "Juego fisico para PS5", 1399.00, 7, 5);
INSERT INTO productos VALUES (0, "Elden Ring", "Juego fisico para Xbox Series X", 899.00, 8, 5);
INSERT INTO productos VALUES (0, "Mario Kart 8 Deluxe", "Juego para Nintendo Switch", 1199.00, 4, 5);

-- Inserciones para pedidos

INSERT INTO pedidos VALUES (0, "2025-07-01", 1, 3);
INSERT INTO pedidos VALUES (0, "2025-07-02", 2, 1);
INSERT INTO pedidos VALUES (0, "2025-07-03", 3, 5);
INSERT INTO pedidos VALUES (0, "2025-07-04", 1, 2);
INSERT INTO pedidos VALUES (0, "2025-07-05", 4, 7);
INSERT INTO pedidos VALUES (0, "2025-07-06", 2, 6);
INSERT INTO pedidos VALUES (0, "2025-07-07", 3, 8);
INSERT INTO pedidos VALUES (0, "2025-07-08", 1, 4);
INSERT INTO pedidos VALUES (0, "2025-07-09", 2, 10);
INSERT INTO pedidos VALUES (0, "2025-07-10", 3, 9);
INSERT INTO pedidos VALUES (0, "2025-07-11", 4, 11);
INSERT INTO pedidos VALUES (0, "2025-07-12", 1, 13);
INSERT INTO pedidos VALUES (0, "2025-07-13", 2, 12);
INSERT INTO pedidos VALUES (0, "2025-07-14", 3, 14);
INSERT INTO pedidos VALUES (0, "2025-07-15", 4, 15);
INSERT INTO pedidos VALUES (0, "2025-07-16", 1, 1);
INSERT INTO pedidos VALUES (0, "2025-07-17", 2, 5);
INSERT INTO pedidos VALUES (0, "2025-07-18", 3, 2);
INSERT INTO pedidos VALUES (0, "2025-07-19", 1, 6);
INSERT INTO pedidos VALUES (0, "2025-07-20", 4, 7);

-- inserciones de detalles
--                    (id_detalle, cantidad, precio u,id_pedido, id_producto)
INSERT INTO detalles_pedido VALUES (0, 1, 12999.99, 1, 1);
INSERT INTO detalles_pedido VALUES (0, 2, 8499.50, 1, 9);
INSERT INTO detalles_pedido VALUES (0, 1, 11499.00, 2, 2);
INSERT INTO detalles_pedido VALUES (0, 3, 999.00, 3, 25);
INSERT INTO detalles_pedido VALUES (0, 2, 7499.00, 4, 28);
INSERT INTO detalles_pedido VALUES (0, 1, 1599.00, 4, 29);
INSERT INTO detalles_pedido VALUES (0, 1, 17499.00, 5, 8);
INSERT INTO detalles_pedido VALUES (0, 1, 2999.00, 6, 14);
INSERT INTO detalles_pedido VALUES (0, 2, 8499.00, 6, 16);
INSERT INTO detalles_pedido VALUES (0, 1, 13499.00, 7, 26);
INSERT INTO detalles_pedido VALUES (0, 1, 13750.00, 8, 4);
INSERT INTO detalles_pedido VALUES (0, 1, 7999.00, 9, 12);
INSERT INTO detalles_pedido VALUES (0, 2, 2899.00, 9, 17);
INSERT INTO detalles_pedido VALUES (0, 1, 8899.00, 10, 30);
INSERT INTO detalles_pedido VALUES (0, 2, 1199.00, 10, 27);
INSERT INTO detalles_pedido VALUES (0, 1, 8699.00, 11, 16);
INSERT INTO detalles_pedido VALUES (0, 3, 849.00, 12, 24);
INSERT INTO detalles_pedido VALUES (0, 1, 10299.50, 13, 3);
INSERT INTO detalles_pedido VALUES (0, 1, 2649.00, 14, 18);
INSERT INTO detalles_pedido VALUES (0, 2, 4499.99, 15, 13);
INSERT INTO detalles_pedido VALUES (0, 1, 15499.00, 16, 6);
INSERT INTO detalles_pedido VALUES (0, 1, 599.00, 17, 23);
INSERT INTO detalles_pedido VALUES (0, 2, 8499.00, 18, 16);
INSERT INTO detalles_pedido VALUES (0, 1, 1399.00, 19, 28);
INSERT INTO detalles_pedido VALUES (0, 2, 18999.99, 20, 5);

-- inserciones en reseñas
--                   id_reseña, id_cliente ,id_pedido ,id_producto ,calificacion ,comentario ,fecha 
INSERT INTO resenas VALUES (0, 5, 3, 25, 4, "Buen teclado aunque lo siento algo ruidoso", "2025-07-06");
INSERT INTO resenas VALUES (0, 8, 7, 26, 5, "Me gusto tiene buena duracion de la bateria", "2025-07-10");
INSERT INTO resenas VALUES (0, 9, 10, 30, 5, "Me gusto mucho , probe el zelda y se ve muy bien", "2025-07-14");
INSERT INTO resenas VALUES (0, 9, 10, 27, 4, "Buen control aunque creo que estubo caro", "2025-07-14");
INSERT INTO resenas VALUES (0, 14, 14, 18, 3, "Tiene colores buenos pero el brillo lo siento bajo", "2025-07-17");
INSERT INTO resenas VALUES (0, 2, 18, 16, 5, "Muestra imagenes nitidas porlo que es ideal para ver peliculas en casa", "2025-07-22");
INSERT INTO resenas VALUES (0, 7, 5, 8, 1, "Nunca me llego el telefono me lo cancelaron", "2025-07-09");
INSERT INTO resenas VALUES (0, 11, 11, 16, 1, "Me cancelaron el pedido sin ninguna explicacion", "2025-07-14");
INSERT INTO resenas VALUES (0, 7, 20, 5, 1, "Tuve mala experiencia porque pedi la mac y lo cancelaron", "2025-07-24");
