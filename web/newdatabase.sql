-- MySQL Script generated by MySQL Workbench
-- 2022 10-р сар 06, Пү 23:16:47
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Lawly
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Lawly
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Lawly` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Lawly` ;

-- -----------------------------------------------------
-- Table `Lawly`.`gct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`gct` (
  `gcID` INT NOT NULL AUTO_INCREMENT,
  `gc` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`gcID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`grp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`grp` (
  `grID` INT NOT NULL AUTO_INCREMENT,
  `gr` VARCHAR(20) NOT NULL,
  `gct_gcID` INT NOT NULL,
  PRIMARY KEY (`grID`),
  INDEX `fk_grp_gct1_idx` (`gct_gcID` ASC) VISIBLE,
  CONSTRAINT `fk_grp_gct1`
    FOREIGN KEY (`gct_gcID`)
    REFERENCES `Lawly`.`gct` (`gcID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`op`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`op` (
  `opID` VARCHAR(20) NOT NULL,
  `opname` VARCHAR(20) NOT NULL,
  `oppass` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`opID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`lawyers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`lawyers` (
  `lwID` INT NOT NULL AUTO_INCREMENT,
  `lwfname` VARCHAR(20) NOT NULL,
  `lwlname` VARCHAR(20) NOT NULL,
  `lwmail` VARCHAR(30) NOT NULL,
  `op_opID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`lwID`),
  INDEX `fk_lawyers_op1_idx` (`op_opID` ASC) VISIBLE,
  CONSTRAINT `fk_lawyers_op1`
    FOREIGN KEY (`op_opID`)
    REFERENCES `Lawly`.`op` (`opID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`thing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`thing` (
  `thID` INT NOT NULL AUTO_INCREMENT,
  `th` VARCHAR(20) NOT NULL,
  `grp_grID` INT NOT NULL,
  PRIMARY KEY (`thID`),
  INDEX `fk_thing_grp1_idx` (`grp_grID` ASC) VISIBLE,
  CONSTRAINT `fk_thing_grp1`
    FOREIGN KEY (`grp_grID`)
    REFERENCES `Lawly`.`grp` (`grID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`aninfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`aninfo` (
  `answerID` INT NOT NULL AUTO_INCREMENT,
  `answer` VARCHAR(200) NOT NULL,
  `gct_gcID` INT NOT NULL,
  `grp_grID` INT NOT NULL,
  `lawyers_lwID` INT NOT NULL,
  `thing_thID` INT NOT NULL,
  PRIMARY KEY (`answerID`),
  INDEX `fk_aninfo_gct1_idx` (`gct_gcID` ASC) VISIBLE,
  INDEX `fk_aninfo_grp1_idx` (`grp_grID` ASC) VISIBLE,
  INDEX `fk_aninfo_lawyers1_idx` (`lawyers_lwID` ASC) VISIBLE,
  INDEX `fk_aninfo_thing1_idx` (`thing_thID` ASC) VISIBLE,
  CONSTRAINT `fk_aninfo_gct1`
    FOREIGN KEY (`gct_gcID`)
    REFERENCES `Lawly`.`gct` (`gcID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_aninfo_grp1`
    FOREIGN KEY (`grp_grID`)
    REFERENCES `Lawly`.`grp` (`grID`),
  CONSTRAINT `fk_aninfo_lawyers1`
    FOREIGN KEY (`lawyers_lwID`)
    REFERENCES `Lawly`.`lawyers` (`lwID`),
  CONSTRAINT `fk_aninfo_thing1`
    FOREIGN KEY (`thing_thID`)
    REFERENCES `Lawly`.`thing` (`thID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`chanel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`chanel` (
  `chID` INT NOT NULL,
  `chnl` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`chID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`location` (
  `loID` INT NOT NULL,
  `local` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`loID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`lwphone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`lwphone` (
  `id` INT NOT NULL,
  `lwPhone` INT NOT NULL,
  `lawyers_lwID` INT NOT NULL,
  PRIMARY KEY (`lwPhone`),
  UNIQUE INDEX `lwPhone_UNIQUE` (`lwPhone` ASC) VISIBLE,
  INDEX `fk_lwphone_lawyers1_idx` (`lawyers_lwID` ASC) VISIBLE,
  CONSTRAINT `fk_lwphone_lawyers1`
    FOREIGN KEY (`lawyers_lwID`)
    REFERENCES `Lawly`.`lawyers` (`lwID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`lwsect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`lwsect` (
  `id` INT NOT NULL,
  `lwsect` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`lwsect_has_lawyers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`lwsect_has_lawyers` (
  `lwsect_id` INT NOT NULL,
  `lawyers_lwID` INT NOT NULL,
  PRIMARY KEY (`lwsect_id`, `lawyers_lwID`),
  INDEX `fk_lwsect_has_lawyers_lawyers1_idx` (`lawyers_lwID` ASC) VISIBLE,
  INDEX `fk_lwsect_has_lawyers_lwsect1_idx` (`lwsect_id` ASC) VISIBLE,
  CONSTRAINT `fk_lwsect_has_lawyers_lawyers1`
    FOREIGN KEY (`lawyers_lwID`)
    REFERENCES `Lawly`.`lawyers` (`lwID`),
  CONSTRAINT `fk_lwsect_has_lawyers_lwsect1`
    FOREIGN KEY (`lwsect_id`)
    REFERENCES `Lawly`.`lwsect` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Lawly`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawly`.`questions` (
  `questID` INT NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(1000) NOT NULL,
  `dateinID` DATE NOT NULL,
  `op_opID` VARCHAR(20) NOT NULL,
  `location_loID` INT NOT NULL,
  `chanel_chID` INT NOT NULL,
  `aninfo_answerID` INT NOT NULL,
  PRIMARY KEY (`questID`),
  INDEX `fk_questions_op1_idx` (`op_opID` ASC) VISIBLE,
  INDEX `fk_questions_location1_idx` (`location_loID` ASC) VISIBLE,
  INDEX `fk_questions_chanel1_idx` (`chanel_chID` ASC) VISIBLE,
  INDEX `fk_questions_aninfo1_idx` (`aninfo_answerID` ASC) VISIBLE,
  CONSTRAINT `fk_questions_aninfo1`
    FOREIGN KEY (`aninfo_answerID`)
    REFERENCES `Lawly`.`aninfo` (`answerID`),
  CONSTRAINT `fk_questions_chanel1`
    FOREIGN KEY (`chanel_chID`)
    REFERENCES `Lawly`.`chanel` (`chID`),
  CONSTRAINT `fk_questions_location1`
    FOREIGN KEY (`location_loID`)
    REFERENCES `Lawly`.`location` (`loID`),
  CONSTRAINT `fk_questions_op1`
    FOREIGN KEY (`op_opID`)
    REFERENCES `Lawly`.`op` (`opID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
