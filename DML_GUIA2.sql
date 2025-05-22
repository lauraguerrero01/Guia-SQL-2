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