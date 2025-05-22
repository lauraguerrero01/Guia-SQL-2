-- PROCEDIMIENTOS ALMACENADOS

-- Para llamar al procedimiento "obtener_productos_por_fabricante":
CALL obtener_productos_por_fabricante('Asus');

-- Para llamar al procedimiento "actualizar_precio_producto":
CALL actualizar_precio_producto(1, 90.00);

-- Para llamar al procedimiento "eliminar_producto":
CALL eliminar_producto(11); -- ¡Cuidado al eliminar datos!

-- Para llamar al procedimiento "contar_productos":
CALL contar_productos();

-- Para llamar al procedimiento "obtener_productos_caros":
CALL obtener_productos_caros(200);

-- VISTAS

-- Para consultar la vista:
SELECT * FROM vista_productos_con_fabricante;

-- Para consultar la vista:
SELECT * FROM vista_productos_mas_de_100;

-- Para consultar la vista:
SELECT * FROM vista_fabricantes_con_productos;

-- Para consultar la vista:
SELECT * FROM vista_productos_ordenados_por_precio;

-- Para consultar la vista:
SELECT * FROM vista_productos_asus;


-- FUNCIONES

-- Para obtener el nombre de un fabricante dado su código:
SELECT Obtener_Nombre_Fabricante(1);

-- Para obtener el precio total de los productos de un fabricante:
SELECT Obtener_Precio_Total_Productos_Fabricante(2); 

-- Para obtener la cantidad total de productos en la base de datos:
SELECT Contar_Todos_Los_Productos();

-- Para verificar si un producto existe por su nombre
SELECT Existe_Producto_Por_Nombre ("Iphone 15 pro max");
SELECT Existe_Producto_Por_Nombre ("GeForce GTX 1050Ti");

-- Para obtener el precio promedio de los productos:
SELECT Obtener_Precio_Promedio_Productos();

-- TRIGGERS

-- Para establecer un precio predeterminado si es NULL:
INSERT INTO Producto (nombre, codigo_fabricante) VALUES ("P20 Lite", 8);
SELECT * FROM Producto WHERE nombre = "P20 Lite";

-- Para registrar la inserción de un nuevo fabricante:
INSERT INTO Fabricante (nombre) VALUES ("Google");
SELECT * FROM Log_Eventos ORDER BY fecha_hora DESC LIMIT 1;

-- Para convertir el nombre a mayúsculas del fabricante ingresado:
CALL insertar_fabricante('dell');
SELECT * FROM Fabricante WHERE nombre = 'dell';

-- Para registrar la eliminación de un producto:
DELETE FROM Producto WHERE codigo = 11; -- Elimina "Impresora HP Laserjet Pro M26nw"

-- Para insertar un nuevo producto:
INSERT INTO Producto (nombre, precio, codigo_fabricante)
VALUES ("Redmi Note 14", 176.92, 9);
SELECT * FROM Log_Inserciones;

