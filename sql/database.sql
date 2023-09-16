-- MySQL Script generated by MySQL Workbench
-- Wed Sep 13 11:47:25 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema swp391
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `swp391` ;

-- -----------------------------------------------------
-- Schema swp391
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `swp391` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema swp391
-- -----------------------------------------------------
USE `swp391` ;

-- -----------------------------------------------------
-- Table `swp391`.`setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `swp391`.`setting` ;

CREATE TABLE IF NOT EXISTS `swp391`.`setting` (
                                                  `id` INT NOT NULL AUTO_INCREMENT,
                                                  `type_id` INT NULL,
                                                  `setting_title` VARCHAR(45) NULL,
    `status` BIT(1) NULL DEFAULT 1,
    `create_by` INT NULL DEFAULT 0,
    `create_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `update_by` INT NULL DEFAULT 0,
    `update_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `swp391`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `swp391`.`user` ;

CREATE TABLE IF NOT EXISTS `swp391`.`user` (
                                               `id` INT NOT NULL AUTO_INCREMENT,
                                               `email` VARCHAR(45) NULL,
    `phone` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `status` BIT(1) NULL DEFAULT 1,
    `full_name` VARCHAR(255) NULL,
    `avatar_url` TEXT NULL,
    `role_id` INT NULL,
    `token` varchar(255) DEFAULT NULL,
    `active` BIT(1) NULL DEFAULT 0,
    `create_by` INT NULL DEFAULT 0,
    `create_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `update_by` INT NULL DEFAULT 0,
    `update_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `a_idx` (`role_id` ASC) VISIBLE,
    FOREIGN KEY (`role_id`)
    REFERENCES `swp391`.`setting` (`id`)
                                                        ON DELETE NO ACTION
                                                        ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `swp391`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `swp391`.`subject` ;

CREATE TABLE IF NOT EXISTS `swp391`.`subject` (
                                                  `id` INT NOT NULL AUTO_INCREMENT,
                                                  `subject_manager_id` INT NULL,
                                                  `subject_name` VARCHAR(255) NULL,
    `subject_code` VARCHAR(45) NULL,
    `status` BIT(1) NULL DEFAULT 1,
    `description` VARCHAR(255) NULL,
    `create_by` INT NULL DEFAULT 0,
    `create_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `update_by` INT NULL DEFAULT 0,
    `update_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `subject_manager_id_idx` (`subject_manager_id` ASC) VISIBLE,
    FOREIGN KEY (`subject_manager_id`)
    REFERENCES `swp391`.`user` (`id`)
                                                        ON DELETE NO ACTION
                                                        ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


---------------------------------------- INSERT DATA ----------------------------------------
-- 1 = role
-- 2 = mail domain
-- 3 = semester

INSERT INTO setting(type_id,setting_title)
VALUES
    (1, "User"),
    (1, "Admin"),
    (1, "Subject manager"),
    (1, "Class manager"),
    (1, "Project mentor"),
    (2, "gmail.com"),
    (2, "fpt.edu.vn"),
    (3, "SUMMER 23"),
    (3, "FALL 23");

-- admin
INSERT INTO `user` (`email`,`phone`,`password`,`full_name`,`role_id`, `active`, `avatar_url`)
VALUES
    ("admin@gmail.com","0999999999","admin","Admin",2,1,"/images/user_icon.png");

-- subject manager
INSERT INTO `user` (`email`,`phone`,`password`,`full_name`,`avatar_url`,`role_id`, `active`)
VALUES
    ("gillianmorris@gmail.com","0224667148","123456","Gillian Morris","/images/user_icon.png",3,1),
    ("germanebaird3434@gmail.com","0820671142","123456","Germane Baird","/images/user_icon.png",3,1),
    ("kareemmacdonald4709@gmail.com","0318444787","123456","Kareem Macdonald","/images/user_icon.png",3,1),
    ("annedonovan3197@gmail.com","0137041646","123456","Anne Donovan","/images/user_icon.png",3,1),
    ("echonash7303@gmail.com","0534896566","123456","Echo Nash","/images/user_icon.png",3,1);

-- user
INSERT INTO `user` (`email`,`phone`,`password`,`full_name`,`avatar_url`,`role_id`, `active`)
VALUES
    ("julianlester@gmail.com","0027829656","123456","Julian Lester","/images/user_icon.png",1,1),
    ("galvinbass4030@gmail.com","0037963572","123456","Galvin Bass","/images/user_icon.png",1,1),
    ("brianmassey@gmail.com","0436285872","123456","Brian Massey","/images/user_icon.png",1,1),
    ("judahcardenas5324@gmail.com","0681589922","123456","Judah Cardenas","/images/user_icon.png",1,1),
    ("kellyreyes9226@gmail.com","0363517319","123456","Kelly Reyes","/images/user_icon.png",1,1),
    ("kevinwilliam@gmail.com","0905521148","123456","Kevin William","/images/user_icon.png",1,1),
    ("lesleycastro@gmail.com","0571427370","123456","Lesley Castro","/images/user_icon.png",1,1),
    ("danarosario@gmail.com","0272326964","123456","Dana Rosario","/images/user_icon.png",1,1),
    ("aimeeewing@gmail.com","0636454167","123456","Aimee Ewing","/images/user_icon.png",1,1),
    ("amywalton@gmail.com","0858486104","123456","Amy Walton","/images/user_icon.png",1,1);
INSERT INTO `user` (`email`,`phone`,`password`,`full_name`,`avatar_url`,`role_id`, `active`)
VALUES
    ("rashadrush2211@gmail.com","0860113768","123456","Rashad Rush","/images/user_icon.png",1,1),
    ("elainelawrence@gmail.com","0721721061","123456","Elaine Lawrence","/images/user_icon.png",1,1),
    ("larissareese@gmail.com","0279994112","123456","Larissa Reese","/images/user_icon.png",1,1),
    ("holleemyers@gmail.com","0532678220","123456","Hollee Myers","/images/user_icon.png",1,1),
    ("xanthusmcfadden3684@gmail.com","0302569530","123456","Xanthus Mcfadden","/images/user_icon.png",1,1),
    ("mylesdavidson@gmail.com","0583590348","123456","Myles Davidson","/images/user_icon.png",1,1),
    ("teegansantana@gmail.com","0547146642","123456","Teegan Santana","/images/user_icon.png",1,1),
    ("elvisratliff@gmail.com","0911884338","123456","Elvis Ratliff","/images/user_icon.png",1,1),
    ("rowaningram@gmail.com","0734547525","123456","Rowan Ingram","/images/user_icon.png",1,1),
    ("oraallen@gmail.com","0298393485","123456","Ora Allen","/images/user_icon.png",1,1);


-- subject
INSERT INTO `subject` (`subject_manager_id`,`subject_name`,`subject_code`,`status`,`description`)
VALUES
    (1,"Software development project","SWP391",1,"This course focuses on designing, developing, and integrating the basic Web-based system/application using Java Web or .NET technologies."),
    (2,"Software Requirement","SWR302",1,"This course is a model-based introduction to RE, providing the conceptual background and terminology on RE, addressing a variety of techniques for requirements development."),
    (3,"Software Testing","SWT301",1,"esting techniques aimed at assuring that appropriate functionality has been implemented correctly in the software system or product."),
    (1,"Basic Cross-Platform Application Programming With .NET","PRN211",1,"Basic knowledge of Window Forms in .NET, ASP.NET Core MVC, RESTful API .NET"),
    (2,"Front-End web development with React","FER201m",1,"Learn front-end web development for implementing a multi-platform solution.");
