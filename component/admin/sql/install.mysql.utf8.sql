

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

-- -----------------------------------------------------
-- Add sample data: 4 tracks
-- -----------------------------------------------------

INSERT INTO `#__wsmusic_track` (`id`, `title`, `asset_id`, `alias`, `lyrics`, `state`, `catid`, `created`, `created_by`, `publish_up`, `ordering`, `access`, `hits`, `downloads`, `artist`, `params`, `modified`, `modified_by`, `featured`, `source`, `language`, `video`, `related`) VALUES
(1, 'Unchained Melody', 0, 'unchained-melody', 'Oh, my love, my darling\nI''ve hungered for your touch\nA long, lonely time\n\nAnd time goes by so slowly\nAnd time can do so much\nAre you still mine?\n\nI need your love\nI need your love\nGod speed your love to me!\n\nLonely rivers flow\nTo the sea, to the sea\nTo the open arms of the sea\n\nLonely rivers sigh\n"Wait for me, wait for me"\nI''ll be coming home, wait for me!\n\nOh, my love, my darling\nI''ve hungered, hungered for your touch\nA long, lonely time\n\nAnd time goes by so slowly\nAnd time can do so much\nAre you still mine?\n\nI need your love\nI need your love\nGod speed your love to me!\n\n\n\nRead more: The Righteous Brothers - Unchained Melody Lyrics | MetroLyrics ', 1, 8, '2014-03-18 06:11:36', 754, '0000-00-00 00:00:00', NULL, 1, 0, 0, 1, NULL, '2012-03-01 20:00:00', 0, NULL, '["/audio/mp3/unchained-melody.mp3"]', NULL, 0, NULL),
(2, 'What becomes of a broken heart', 0, 'what-becomes-of a-broken-heart', '["As I walk this land of broken dreams,\r\nI have visions of many things.\r\nLove''s happiness is just an illusion,\r\nFilled with sadness and confusion.\r\nWhat becomes of the broken hearted\r\nWho had love that''s now departed?\r\nI know I''ve got to find\r\nSome kind of peace of mind\r\nMaybe.\r\nThe fruits of love grow all around\r\nBut for me they come a tumblin'' down.\r\nEvery day heartaches grow a little stronger,\r\nI can''t stand this pain much longer!\r\nI walk in shadows,\r\nSearching for light.\r\nCold and alone,\r\nNo comfort in sight.\r\nHoping and praying for someone to care,\r\nAlways moving and goin'' nowhere.\r\nWhat becomes of the broken hearted\r\nWho had love that''s now departed?\r\nI know I''ve got to find,\r\nSome kind of peace of mind.\r\nHelp me..\r\nI''m searching though I don''t succeed,\r\nFor someone''s love, there''s a growing need.\r\nOh, he is lost, there''s no place for beginning,\r\nAll that''s left is an unhappy ending.\r\nNow what becomes of the broken-hearted\r\nWho had love that''s now departed?\r\nI know I''ve got to find,\r\nSome kind of peace of mind,\r\nI''ll be searching everywhere,\r\nJust to find someone to care.\r\nI''ll be looking everyday,\r\nI know I''m gonna find a way.\r\nNothings gonna stop me now,\r\nI''ll find a way somehow.\r\nI''ll be searching everywhere...\r\n"]', 0, 8, '2014-03-18 06:11:36', 755, '0000-00-00 00:00:00', NULL, 5, 0, 0, 1, NULL, '2012-03-01 21:00:00', 0, 1, '["/audio/mp3/what-becomes-of a-broken-heart.mp3"]', NULL, 0, '[1]'),
(3, 'When A Man Loves A Woman', NULL, 'when-a-man Loves-a-woman', '["When a man loves a woman\nCan''t keep his mind on nothin'' else\nHe''d trade the world\nFor a good thing he''s found\nIf she is bad, he can''t see it\nShe can do no wrong\nTurn his back on his best friend\nIf he puts her down\n\nWhen a man loves a woman\nSpend his very last dime\nTrying to hold on to what he needs\nHe''d give up all his comforts\nAnd sleep out in the rain\nIf she said that''s the way\nIt ought to be\n\n\nWhen a man loves a woman\nI gave you everything I got\nTrying to hold on\nTo your heartless love\nBaby Baby please don''t treat me bad\n\n\nWhen a man loves a woman\nDeep down in his soul\nShe can bring him such misery\nIf she is playing him for a fool\nHe''s the last one to know\nLoving eyes can never see\n\n\nYes when a man loves a woman\nI know exactly how he feels\n''Cause baby, baby\nWhen a man loves a woman \nWhen a man loves a woman\nWhen a man loves a woman\nWhen a man, when a man, when a man loves a woman","Khi một người đàn ông yêu một người phụ nữ\nAnh ta chẳng thể nghĩ về điều gì được nữa\nAnh ta đánh đổi cả thế giới cho điều tuyệt vời nhất mà anh tìm thấy\nNếu cô ấy không tốt, anh ta cũng chẳng nhận ra\nCô ấy không thể làm gì sai cả\nAnh quay lưng lại với người bạn tốt nhất của mình\nVà anh ta làm cô ấy thất vọng\n\nKhi một người đàn ông yêu một người phụ nữ\nAnh ta tiêu đến đồng xu cuối cùng\nCố gắng giữ lấy những điều anh ta cần\nAnh ta sẽ bỏ mặc tất cả những tiện nghi thoải mái\nĐể ngủ ngoài trời mưa lạnh\nNếu cô ấy nói đó có thể là cách làm cô cảm động\n\nKhi một người đàn ông yêu một người phụ nữ\nTôi sẽ cho em mọi thứ mà tôi có, phải\nCố gắng giữ lấy tình yêu quý giá của em\nEm yêu, đừng đối xử tệ với tôi nhé\nKhi một người đàn ông yêu một người phụ nữ\nCô ấy có thể mang đến cho anh ta thật nhiều đau khổ\nNếu cô ấy đùa giỡn với anh ta như một kẻ ngốc\nVà anh ta là người cuối cùng biết đến\nÁnh mắt dối lừa kia\n\nPhải, khi một người đàn ông yêu một người phụ nữ\nTôi biết chính xác anh ta cảm thấy thế nào, bởi em yêu à\nKhi một người đàn ông yêu một người phụ nữ\nNó là vậy đó"]', 1, 8, '0000-00-00 00:00:00', 756, '0000-00-00 00:00:00', 0, 2, 0, 0, 3, NULL, '0000-00-00 00:00:00', 0, 0, '["/audio/mp3/when-a-man Loves-a-woman.mp3"]', NULL, 0, NULL),
(4, 'Trái tim bên lề', NULL, 'trai-tim-ben-le', '["Em đã biết bao ngày bên em\r\nLà anh đã có bấy nhiêu ngày yêu em\r\nNhưng em vẫn ngây thơ nên ko biết tình anh\r\nThầm yêu em nên tim đau rã rời\r\n\r\nAnh đã thấy bao người yêu em\r\nTình anh đã nhức nhối thinh lặng bên em\r\nNhìn em yêu tuy ngay đây nhưng rất xa xôi\r\nVì tim em đã trót trao ai rồi\r\n\r\nĐK:\r\nT yêu sâu kín cho em đã bao ngày thầm lặng\r\nNhìn em ko nói nên câu nói chi đây\r\nLòng xót xa đi bên đời em và thấy em chịu nhiều đắng cay mà tim anh đây vì yeu anh nên đau rã rời.\r\nVì em đã trót yêu ai em quá vô tình ko nhận ra\r\nTình yêu anh đã trao em bấy lâu nay\r\nMột trái tim bên lề rất đau vì biết em chẳng hề biết đâu...\r\nTình yêu anh đã trao em rồi........."]', 1, 9, '0000-00-00 00:00:00', 757, '0000-00-00 00:00:00', 0, 3, 0, 0, 2, NULL, '0000-00-00 00:00:00', 0, 1, '["audio/trai-tim-ben-le.mp3","video/trai-tim-ben-le.avi"]', NULL, 1, NULL);
