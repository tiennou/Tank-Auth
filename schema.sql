SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `ci_sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ci_sessions` ;

CREATE  TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 0 ,
  `ip_address` VARCHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 0 ,
  `user_agent` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_activity` INT UNSIGNED NOT NULL DEFAULT 0 ,
  `user_data` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  PRIMARY KEY (`session_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `login_attempts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `login_attempts` ;

CREATE  TABLE IF NOT EXISTS `login_attempts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `ip_address` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `login` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `time` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `user_autologin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_autologin` ;

CREATE  TABLE IF NOT EXISTS `user_autologin` (
  `key_id` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `user_id` INT UNSIGNED NOT NULL DEFAULT 0 ,
  `user_agent` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_login` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`key_id`, `user_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `user_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profiles` ;

CREATE  TABLE IF NOT EXISTS `user_profiles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(200) NULL DEFAULT '' ,
  `gender` CHAR(1) NULL DEFAULT '' ,
  `dob` DATE NULL ,
  `country` CHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT '' ,
  `website` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT '' ,
  `modified` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `name` (`name` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users` ;

CREATE  TABLE IF NOT EXISTS `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `password` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `activated` TINYINT(1) NOT NULL DEFAULT 1 ,
  `banned` TINYINT(1) NOT NULL DEFAULT 0 ,
  `ban_reason` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL ,
  `new_password_key` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `new_password_requested` DATETIME NULL ,
  `new_email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `new_email_key` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL ,
  `meta` VARCHAR(2000) NULL DEFAULT '' ,
  `last_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_login` DATETIME NOT NULL ,
  `created` DATETIME NOT NULL ,
  `modified` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `username` (`username` ASC) ,
  INDEX `email` (`email` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
