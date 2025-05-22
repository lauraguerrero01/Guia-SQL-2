-- 1. Función para obtener el nombre de un fabricante dado su código
DELIMITER //
CREATE FUNCTION Obtener_Nombre_Fabricante(
    p_codigo_fabricante INT
)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE v_nombre VARCHAR(100);
    SELECT nombre INTO v_nombre FROM Fabricante WHERE codigo = p_codigo_fabricante;
    RETURN v_nombre;
END //
DELIMITER ;


-- 2. Función para obtener el precio total de los productos de un fabricante
DELIMITER //
CREATE FUNCTION Obtener_Precio_Total_Productos_Fabricante(
    p_codigo_fabricante INT
)
RETURNS DOUBLE
READS SQL DATA
BEGIN
    DECLARE v_precio_total DOUBLE;
    SELECT SUM(precio) INTO v_precio_total FROM Producto WHERE codigo_fabricante = p_codigo_fabricante;
    RETURN IFNULL(v_precio_total, 0.00); -- Devuelve 0.00 si no hay productos
END //
DELIMITER ;


-- 3. Función para obtener la cantidad total de productos en la base de datos
DELIMITER //
CREATE FUNCTION Contar_Todos_Los_Productos()
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_cantidad INT;
    SELECT COUNT(codigo) INTO v_cantidad FROM Producto;
    RETURN v_cantidad;
END //
DELIMITER ;


-- 4. Función para verificar si un producto existe por su nombre
DELIMITER //
CREATE FUNCTION Existe_Producto_Por_Nombre(
    p_nombre_producto VARCHAR(100)
)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE v_existe BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM Producto WHERE nombre = p_nombre_producto) INTO v_existe;
    RETURN v_existe;
END //
DELIMITER ;


-- 5. Función para obtener el precio promedio de todos los productos
DELIMITER //
CREATE FUNCTION Obtener_Precio_Promedio_Productos()
RETURNS DOUBLE
READS SQL DATA
BEGIN
    DECLARE v_precio_promedio DOUBLE;
    SELECT AVG(precio) INTO v_precio_promedio FROM Producto;
    RETURN IFNULL(v_precio_promedio, 0.00); -- Devuelve 0.00 si no hay productos
END //
DELIMITER ;



