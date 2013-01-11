SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `permissions` ;

CREATE  TABLE IF NOT EXISTS `permissions` (
  `permission_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `permission` VARCHAR(100) NOT NULL ,
  `description` VARCHAR(160) NULL ,
  `parent` VARCHAR(100) NULL ,
  `sort` TINYINT UNSIGNED NULL ,
  PRIMARY KEY (`permission_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roles` ;

CREATE  TABLE IF NOT EXISTS `roles` (
  `role_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `role` VARCHAR(50) NOT NULL ,
  `full` VARCHAR(50) NOT NULL ,
  `default` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`role_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `role_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role_permissions` ;

CREATE  TABLE IF NOT EXISTS `role_permissions` (
  `role_id` SMALLINT UNSIGNED NOT NULL ,
  `permission_id` SMALLINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`role_id`, `permission_id`) ,
  INDEX `role_id_idx` (`role_id` ASC) ,
  INDEX `task_id_idx` (`permission_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_roles` ;

CREATE  TABLE IF NOT EXISTS `user_roles` (
  `user_id` INT UNSIGNED NOT NULL ,
  `role_id` SMALLINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`user_id`, `role_id`) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  INDEX `role_id_idx` (`role_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `overrides`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `overrides` ;

CREATE  TABLE IF NOT EXISTS `overrides` (
  `user_id` INT UNSIGNED NOT NULL ,
  `permission_id` SMALLINT UNSIGNED NOT NULL ,
  `allow` TINYINT(1) UNSIGNED NOT NULL ,
  PRIMARY KEY (`user_id`, `permission_id`) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  INDEX `task_id_idx` (`permission_id` ASC) )
ENGINE = InnoDB;