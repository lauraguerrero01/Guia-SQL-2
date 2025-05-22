-- 1. Trigger BEFORE INSERT en Producto: Establece un precio predeterminado si es NULL
DELIMITER //
CREATE TRIGGER tr_BeforeInsertProducto_SetDefaultPrice
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF NEW.precio IS NULL THEN
        SET NEW.precio = 0.00; -- Precio predeterminado
    END IF;
END //
DELIMITER ;


-- 2. Trigger AFTER INSERT en Fabricante: Registra la inserción de un nuevo fabricante
DELIMITER //
CREATE TRIGGER tr_AfterInsertFabricante_Log
AFTER INSERT ON Fabricante
FOR EACH ROW
BEGIN
    INSERT INTO Log_Eventos (tipo_evento, descripcion)
    VALUES ('Nuevo Fabricante', CONCAT('Se ha añadido el fabricante: ', NEW.nombre, ' (Código: ', NEW.codigo, ')'));
END //
DELIMITER ;


-- 3. Trigger BEFORE INSERT en Fabricante para convertir el nombre a mayúsculas
DELIMITER $$
CREATE TRIGGER tr_before_insert_fabricante_uppercase
BEFORE INSERT ON Fabricante
FOR EACH ROW
BEGIN
    SET NEW.nombre = UPPER(NEW.nombre);
END$$
DELIMITER ;


-- 4. Trigger AFTER DELETE en Producto: Registra la eliminación de un producto
DELIMITER //
CREATE TRIGGER tr_AfterDeleteProducto_Log
AFTER DELETE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO Log_Eventos (tipo_evento, descripcion)
    VALUES ('Producto Eliminado', CONCAT('Se ha eliminado el producto: ', OLD.nombre, ' (Código: ', OLD.codigo, ', Precio: ', OLD.precio, ')'));
END //
DELIMITER ;

-- 5. Trigger AFTER INSERT inserta un nuevo producto
DELIMITER $$
CREATE TRIGGER tr_after_insert_producto
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO Log_Inserciones (nombre_producto, precio)
    VALUES (NEW.nombre, NEW.precio);
END$$
DELIMITER ;



