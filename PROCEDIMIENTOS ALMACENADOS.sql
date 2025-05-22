-- Ejemplo 1: Obtener todos los productos de un fabricante específico
DELIMITER $$
CREATE PROCEDURE obtener_productos_por_fabricante (
    IN p_nombre_fabricante VARCHAR(100)
)
BEGIN
    SELECT
        P.nombre AS nombre_producto,
        P.precio,
        F.nombre AS nombre_fabricante
    FROM
        Producto P
    JOIN
        Fabricante F ON P.codigo_fabricante = F.codigo
    WHERE
        F.nombre = p_nombre_fabricante;
END$$
DELIMITER ;

-- Para llamar al procedimiento:
-- CALL obtener_productos_por_fabricante('Asus');


-- Ejemplo 2: Actualizar el precio de un producto por su código
DELIMITER $$
CREATE PROCEDURE actualizar_precio_producto (
    IN p_codigo_producto INT(10),
    IN p_nuevo_precio DOUBLE
)
BEGIN
    UPDATE Producto
    SET precio = p_nuevo_precio
    WHERE codigo = p_codigo_producto;
END$$
DELIMITER ;

-- Para llamar al procedimiento:
-- CALL actualizar_precio_producto(1, 90.00);


-- Ejemplo 3: Eliminar un producto por su código
DELIMITER $$
CREATE PROCEDURE eliminar_producto (
    IN p_codigo_producto INT(10)
)
BEGIN
    DELETE FROM Producto
    WHERE codigo = p_codigo_producto;
END$$
DELIMITER ;

-- Para llamar al procedimiento:
-- CALL eliminar_producto(11); -- ¡Cuidado al eliminar datos!


-- Ejemplo 4: Obtener el número total de productos
DELIMITER $$
CREATE PROCEDURE contar_productos ()
BEGIN
    SELECT COUNT(*) AS total_productos
    FROM Producto;
END$$
DELIMITER ;

-- Para llamar al procedimiento:
-- CALL contar_productos();


-- Ejemplo 5: Obtener productos con precio superior a un valor dado
DELIMITER $$
CREATE PROCEDURE obtener_productos_caros (
    IN p_precio_minimo DOUBLE
)
BEGIN
    SELECT
        P.nombre AS nombre_producto,
        P.precio,
        F.nombre AS nombre_fabricante
    FROM
        Producto P
    JOIN
        Fabricante F ON P.codigo_fabricante = F.codigo
    WHERE
        P.precio > p_precio_minimo
    ORDER BY
        P.precio DESC;
END$$
DELIMITER ;

-- Para llamar al procedimiento:
-- CALL obtener_productos_caros(200);
