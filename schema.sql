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
  `new_password_key` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL ,
  `new_password_requested` DATETIME NULL ,
  `new_email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL ,
  `new_email_key` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL ,
  `override` TINYINT NULL DEFAULT 0 COMMENT 'Checks the override table if necessary' ,
  `approved` TINYINT(1) NULL COMMENT 'For acct approval.' ,
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



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `permissions`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `permissions` (`permission_id`, `permission`, `description`, `parent`, `sort`) VALUES (1, 'buy stuff', 'Buying me some goodies', 'I want chicken for dinner', NULL);
INSERT INTO `permissions` (`permission_id`, `permission`, `description`, `parent`, `sort`) VALUES (2, 'watch movie', 'Movietime yo', 'I want chicken for dinner', NULL);
INSERT INTO `permissions` (`permission_id`, `permission`, `description`, `parent`, `sort`) VALUES (3, 'eat food', 'Eat lots of food', 'I want chicken for dinner', NULL);
INSERT INTO `permissions` (`permission_id`, `permission`, `description`, `parent`, `sort`) VALUES (4, 'clean cat', 'Clean that dirty cat!', 'Will Codeigniter for food', 3);
INSERT INTO `permissions` (`permission_id`, `permission`, `description`, `parent`, `sort`) VALUES (5, 'win lottery', 'Yipeeee!', 'Will Codeigniter for food', 2);
INSERT INTO `permissions` (`permission_id`, `permission`, `description`, `parent`, `sort`) VALUES (6, 'kiss girl', 'Kissy, kissy', 'Will Codeigniter for food', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `roles`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `roles` (`role_id`, `role`, `full`, `default`) VALUES (1, 'admin', 'Administrator', 0);
INSERT INTO `roles` (`role_id`, `role`, `full`, `default`) VALUES (2, 'mod', 'Moderator', 0);
INSERT INTO `roles` (`role_id`, `role`, `full`, `default`) VALUES (3, 'user', 'User', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `role_permissions`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES (1, 1);
INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES (1, 2);
INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES (1, 3);
INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES (1, 4);
INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES (2, 1);
INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES (2, 2);
INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES (3, 3);
INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES (3, 4);

COMMIT;
