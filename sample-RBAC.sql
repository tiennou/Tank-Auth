
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
