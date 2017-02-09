-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema python_belt_exam_2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema python_belt_exam_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `python_belt_exam_2` DEFAULT CHARACTER SET utf8 ;
USE `python_belt_exam_2` ;

-- -----------------------------------------------------
-- Table `python_belt_exam_2`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `python_belt_exam_2`.`user` ;

CREATE TABLE IF NOT EXISTS `python_belt_exam_2`.`user` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `alias` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `pw_hash` VARCHAR(255) NULL DEFAULT NULL,
  `birthday` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `alias_UNIQUE` (`alias` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `python_belt_exam_2`.`friends`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `python_belt_exam_2`.`friends` ;

CREATE TABLE IF NOT EXISTS `python_belt_exam_2`.`friends` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `friend_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_friends_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_friends_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `python_belt_exam_2`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
