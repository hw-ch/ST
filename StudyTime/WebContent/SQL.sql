CREATE TABLE `board` (
	`bNo` INT(10) NOT NULL AUTO_INCREMENT,
	`subject` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`content` VARCHAR(2000) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nickname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`hit` INT(10) NULL DEFAULT NULL,
	`good` INT(10) NULL DEFAULT NULL,
	`bad` INT(10) NULL DEFAULT NULL,
	`regDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`uptDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`replyNum` INT(10) NULL DEFAULT NULL,
	PRIMARY KEY (`bNo`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

CREATE TABLE `category` (
	`cNo` INT(10) NOT NULL AUTO_INCREMENT,
	`category1` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`category2` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`cNo`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

CREATE TABLE `notice` (
	`bNo` INT(10) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`content` VARCHAR(2000) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`regDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`uptDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`hit` INT(10) NULL DEFAULT NULL,
	PRIMARY KEY (`bNo`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

CREATE TABLE `reply` (
	`rNo` INT(10) NOT NULL AUTO_INCREMENT,
	`bNo` INT(10) NULL DEFAULT NULL,
	`content` VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nickname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`userid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`regDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`rNo`) USING BTREE,
	INDEX `FK_reply_board` (`bNo`) USING BTREE,
	CONSTRAINT `FK_reply_board` FOREIGN KEY (`bNo`) REFERENCES `board` (`bNo`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

CREATE TABLE `study` (
	`sNo` INT(10) NOT NULL AUTO_INCREMENT,
	`sTitle` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`sWriter` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`cNo` INT(10) NULL DEFAULT NULL,
	`category1` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`category2` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`address` VARCHAR(200) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`recruitCnt` INT(10) NULL DEFAULT NULL,
	`joinCnt` INT(10) NULL DEFAULT NULL,
	`regDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`expDate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`startDate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`sContent` VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`apply` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`process` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`sNo`) USING BTREE,
	INDEX `FK_study_category` (`cNo`) USING BTREE,
	CONSTRAINT `FK_study_category` FOREIGN KEY (`cNo`) REFERENCES `category` (`cNo`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;


CREATE TABLE `studyjoin` (
	`sjNo` INT(10) NOT NULL AUTO_INCREMENT,
	`userid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`sNo` INT(10) NULL DEFAULT NULL,
	`approve` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`regDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`sjNo`) USING BTREE,
	INDEX `FK_studyjoin_user` (`userid`) USING BTREE,
	INDEX `FK_studyjoin_study_2` (`sNo`) USING BTREE,
	CONSTRAINT `FK_studyjoin_study_2` FOREIGN KEY (`sNo`) REFERENCES `study` (`sNo`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_studyjoin_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

CREATE TABLE `user` (
	`userid` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`password` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nickname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`ts` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`gender` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`image` VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`phone` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`userid`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

-- 테이블 데이터 studytime.category:~22 rows (대략적) 내보내기
INSERT INTO `category` (`category1`, `category2`) VALUES
	('영어', 'TOEIC'),
	('영어', 'TOEFL'),
	('영어', 'OPIc'),
	('영어', '영어회화'),
	('일본어', 'JLPT'),
	('일본어', 'JPT'),
	('일본어', '일본어회화'),
	('중국어', 'HSK'),
	('중국어', 'HSKK'),
	('중국어', 'TSC'),
	('중국어', '중국어회화'),
	('운동/스포츠', '헬스'),
	('운동/스포츠', '러닝'),
	('운동/스포츠', '필라테스'),
	('운동/스포츠', '요가'),
	('운동/스포츠', '클라이밍'),
	('IT', '코딩'),
	('IT', '컴활1급'),
	('IT', '컴활2급'),
	('IT', '정보처리기사'),
	('IT', 'SQLD'),
	('IT', 'SQLP');

CREATE TABLE studyboard (
    bNo INT(10) NOT NULL AUTO_INCREMENT,
    subject VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
    content VARCHAR(2000) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
    nickname VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
    userid VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
    hit INT(10) NULL DEFAULT NULL,
    good INT(10) NULL DEFAULT NULL,
    bad INT(10) NULL DEFAULT NULL,
    regDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    uptDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    replyNum INT(10) NULL DEFAULT NULL,
    sNo INT(10) NULL DEFAULT NULL,
    PRIMARY KEY (bNo) USING BTREE,
    INDEX FK_studyboard_study (sNo) USING BTREE,
    CONSTRAINT FK_studyboard_study FOREIGN KEY (sNo) REFERENCES study (sNo) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4
;

