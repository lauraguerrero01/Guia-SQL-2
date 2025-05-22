-- Vista de productos con el nombre del fabricante
CREATE VIEW vista_productos_con_fabricante AS
SELECT
    P.nombre AS nombre_producto,
    P.precio,
    F.nombre AS nombre_fabricante
FROM
    Producto P
JOIN
    Fabricante F ON P.codigo_fabricante = F.codigo;


-- Vista de productos con precios superiores a $100
CREATE VIEW vista_productos_mas_de_100 AS
SELECT
    nombre AS nombre_producto,
    precio
FROM
    Producto
WHERE
    precio > 100;


-- Vista de fabricantes y la cantidad de productos que tienen
CREATE VIEW vista_fabricantes_con_productos AS
SELECT
    F.nombre AS nombre_fabricante,
    COUNT(P.codigo) AS cantidad_productos
FROM
    Fabricante F
LEFT JOIN
    Producto P ON F.codigo = P.codigo_fabricante
GROUP BY
    F.nombre;


-- Vista de productos ordenados por precio (descendente)
CREATE VIEW vista_productos_ordenados_por_precio AS
SELECT
    nombre AS nombre_producto,
    precio,
    codigo_fabricante
FROM
    Producto
ORDER BY
    precio DESC;


-- Vista de productos del fabricante 'Asus'
CREATE VIEW vista_productos_asus AS
SELECT
    P.nombre AS nombre_producto,
    P.precio
FROM
    Producto P
JOIN
    Fabricante F ON P.codigo_fabricante = F.codigo
WHERE
    F.nombre = 'Asus';