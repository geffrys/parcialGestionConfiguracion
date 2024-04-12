

CREATE TABLE users(
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    user_middle_name VARCHAR(20),
    user_last_name VARCHAR(20) NOT NULL,
    user_second_last_name VARCHAR(20),
    user_nit VARCHAR(10) NOT NULL,
    user_mail VARCHAR(255) NOT NULL UNIQUE,
    user_phone VARCHAR(10) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_username VARCHAR(8) NOT NULL,
    user_birth_date DATETIME NOT NULL,
    user_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    active TINYINT(1) NOT NULL DEFAULT 1,
);

ALTER TABLE `pruebas_gestion_configuracion`.`users` 
ADD COLUMN `user_user` VARCHAR(8) NOT NULL AFTER `active`,
ADD COLUMN `user_nit` VARCHAR(10) NOT NULL AFTER `user_user`,
CHANGE COLUMN `user_name` `user_name` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `user_middle_name` `user_middle_name` VARCHAR(20) NULL DEFAULT NULL ,
CHANGE COLUMN `user_last_name` `user_last_name` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `user_second_last_name` `user_second_last_name` VARCHAR(20) NULL DEFAULT NULL ,
CHANGE COLUMN `user_phone` `user_phone` VARCHAR(10) NOT NULL ;

