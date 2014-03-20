

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
-- Add sample data: 3 artist
-- -----------------------------------------------------

INSERT INTO `#__wsmusic_artist` (`id`, `name`, `birthday`, `biography`, `birthname`, `nation`, `company`, `related`) VALUES
(1, 'The Righteous Brothers', '2014-03-10', 'The Righteous Brothers were the musical duo of Bill Medley and Bobby Hatfield. They recorded from 1963 through 1975 and continued to perform until Hatfield''s death in 2003. Their emotive vocal stylings were sometimes dubbed "blue-eyed soul', NULL, 1, 1, NULL),
(2, 'Bằng Kiều', '1973-03-11', 'Bằng Kiều, tên đầy đủ là Nguyễn Bằng Kiều, sinh ngày 13 tháng 07 năm 1973 tại Hà Nội. Dù có thực hiện sáng tác một số ca khúc, nhưng anh vẫn được công chúng biết đến vai trò là một ca sĩ nhiều hơn. Bằng Kiều sinh ra trong gia đình có truyền thống nghệ thuật, anh đã tham gia các hoạt động văn nghệ ngay từ nhỏ và gặt hái nhiều thành công sau này, cả trên sân khấu ca nhạc trong nước và nước ngoài.\r\nBằng Kiều từng tham gia các ban nhạc Chìa khóa vàng, Hoa sữa, Quả dưa hấu và sau đó tách ra hát solo riêng. Anh đạt được nhiều thành công và được xem là một trong những ca sĩ nổi tiếng nhất Việt Nam. Năm 2002 anh định cư tại Mỹ và kết hôn với ca sĩ Trizzie Phương Trinh. Do những phát ngôn gây tranh cãi, cuối năm 2004, anh bị tước quyền công dân Việt Nam. Năm 2008, Bằng Kiều đã có chuyến quay trở về Việt Nam đầu tiên. Hiện nay Bằng Kiều là ca sĩ độc quyền của trung tâm Thúy Nga.\r\nGiọng ca của Bằng Kiều được xếp vào giọng nam cao (tenor), được đánh giá là trong và giàu tình cảm.[1] Anh thuộc lớp ca sĩ cùng thời với Lam Trường, Minh Thuận,[2] Phương Thanh, Mỹ Linh, Dương Chí Linh, Quang Linh.\r\nTháng 9 năm 2012, Bằng Kiều trở lại Việt Nam và được Cục biểu diễn nghệ thuật cấp phép thực hiện liveshow trong vòng 3 tháng từ tháng 10 tới tháng 12[3][4].', 'Nguyễn Bằng Kiều', 1, 1, NULL),
(3, 'Michael Bolton', '2014-03-04', 'Michael Bolotin[2] (born February 26, 1953), known professionally as Michael Bolton, is an American singer-songwriter. Bolton originally performed in the hard rock and heavy metal genres from the mid-1970s to the mid-1980s, both on his early solo albums and those he recorded as the frontman of the band Blackjack. He is best known, however, for his series of soft rock ballads, recorded after a stylistic change in the late 1980s. He is noted for his distinctive tenor/countertenor vocal style.\r\nBolton''s achievements include recording eight top 10 albums and two number one singles on the Billboard charts, as well as winning multiple American Music Awards and Grammy Awards.', 'Michael Bolotin', 1, 1, NULL);
