use WECHAT;

DELIMITER $$
 
DROP PROCEDURE IF EXISTS pr_Drop_index_if_exists $$
CREATE PROCEDURE pr_Drop_index_if_exists(in theTable varchar(128), in theIndexName varchar(128) )
BEGIN
 IF((SELECT COUNT(*) AS index_exists FROM information_schema.statistics WHERE TABLE_SCHEMA = DATABASE() and table_name =
theTable AND index_name = theIndexName) > 0) THEN
   SET @s = CONCAT('DROP INDEX `' , theIndexName , '` ON `' , theTable, '`');
   PREPARE stmt FROM @s;
   EXECUTE stmt;
 END IF;
END $$
 
DELIMITER ;


-- 检查表字段是否存在，不存在则添加
DELIMITER $$
 
DROP PROCEDURE IF EXISTS pr_add_column_if_not_exists $$
CREATE PROCEDURE pr_add_column_if_not_exists(in theDb varchar(128), in theTbl varchar(128), in theCol varchar(128), in theColDefine varchar(128))
BEGIN
 IF((SELECT COUNT(*) AS col_exists FROM information_schema.columns WHERE TABLE_SCHEMA = theDb and table_name = theTbl
    AND column_name = theCol) = 0) THEN
   SET @s = CONCAT('ALTER TABLE ' , theDb, '.', theTbl , ' ADD COLUMN ' , theColDefine);
   PREPARE stmt FROM @s;
   EXECUTE stmt;
 END IF;
END $$
 
DELIMITER ;


-- 检查表字段是否存在，存在则删除
DELIMITER $$
 
DROP PROCEDURE IF EXISTS pr_drop_column_if_exists $$
CREATE PROCEDURE pr_drop_column_if_exists(in theDb varchar(128), in theTbl varchar(128), in theCol varchar(128))
BEGIN
 IF((SELECT COUNT(*) AS col_exists FROM information_schema.columns WHERE TABLE_SCHEMA = theDb and table_name = theTbl
    AND column_name = theCol) > 0) THEN
   SET @s = CONCAT('ALTER TABLE ' , theDb, '.', theTbl , ' DROP COLUMN ' , theCol);
   PREPARE stmt FROM @s;
   EXECUTE stmt;
 END IF;
END $$
 
DELIMITER ;



