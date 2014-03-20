

-- -----------------------------------------------------
-- Table `#__wsmusic_artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `#__wsmusic_artist` ;

CREATE TABLE IF NOT EXISTS `#__wsmusic_artist` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `name` VARCHAR(100),
  `birthday` DATE,
  `biography` MEDIUMTEXT,
  `birthname` VARCHAR(100),
  `nation` SMALLINT COMMENT 'use php array',
  `company` SMALLINT COMMENT 'use an php array to parse this value like state',
  `related` TEXT COMMENT 'related artist(JSON)',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `#__wsmusic_track`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `#__wsmusic_track` ;

CREATE TABLE IF NOT EXISTS `#__wsmusic_track` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `title` VARCHAR(255),
  `asset_id` INT UNSIGNED COMMENT 'FK to the assets table',
  `alias` VARCHAR(255) COLLATE 'utf8_bin',
  `lyrics` MEDIUMTEXT,
  `state` TINYINT(3) DEFAULT 0,
  `catid` TINYINT(3) UNSIGNED DEFAULT 0,
  `created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `created_by` INT UNSIGNED DEFAULT 0,
  `publish_up` DATETIME DEFAULT '0000-00-00 00:00:00',
  `ordering` INT DEFAULT 0,
  `access` INT UNSIGNED DEFAULT 0,
  `hits` INT UNSIGNED DEFAULT 0,
  `downloads` INT UNSIGNED DEFAULT 0,
  `artist` INT UNSIGNED,
  `params` MEDIUMTEXT,
  `modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `modified_by` INT UNSIGNED DEFAULT 0,
  `featured` TINYINT(3) UNSIGNED DEFAULT 0,
  `source` TEXT COMMENT 'video can even have multible resolution with multiple sourcefile',
  `language` TINYINT(3),
  `video` TINYINT(1) DEFAULT false COMMENT 'true mean this is a video',
  `related` VARCHAR(100),
  PRIMARY KEY (`id`),
  CONSTRAINT `artist`
    FOREIGN KEY (`artist`)
    REFERENCES `#__wsmusic_artist` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

-- -----------------------------------------------------
-- Table `#__wsmusic_playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `#__wsmusic_playlist` ;

CREATE TABLE IF NOT EXISTS `#__wsmusic_playlist` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `name` VARCHAR(45),
  `tracks` MEDIUMTEXT COMMENT 'json array contain track id',
  `hits` INT UNSIGNED,
  `downloads` MEDIUMINT UNSIGNED ,
  `created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `created_by` INT UNSIGNED,
  `state` TINYINT COMMENT 'options:trash,private,publish,archive,invite',
  `catid` INT UNSIGNED,
  `type` TINYINT COMMENT 'option:playlist,favorites,album..',
  `desciption` MEDIUMTEXT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

-- -----------------------------------------------------
-- Add 3 sample users
-- -----------------------------------------------------
INSERT INTO `never_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`) VALUES
(755, 'Maria Obama', 'mabama', 'maria.obama@shit.com', '$P$DYeUS3VrqTYpqxsipGqdYLhUUTLy4E/', 0, 0, '2014-03-20 10:52:46', '0000-00-00 00:00:00', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', ''),
(756, 'gay man', 'gayman', 'gay@man.com', '$P$DN515cOXhX.iDVhepc8nRO/nZOpP7f1', 0, 0, '2014-03-20 10:59:11', '0000-00-00 00:00:00', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', ''),
(757, 'Doãn Chi Lâm', 'lamchidoan', 'lam@doan.com', '$P$D9wNg.8omW2rBc3N7q2Im0ec7oFg5h/', 0, 0, '2014-03-20 11:05:10', '0000-00-00 00:00:00', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '');

-- -----------------------------------------------------
-- add 3 users 's right
-- -----------------------------------------------------
INSERT INTO `never_user_usergroup_map` (`user_id`, `group_id`) VALUES
(755, 6),
(756, 4),
(757, 2);
