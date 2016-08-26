-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema pybeltdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pybeltdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pybeltdb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema twitter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `twitter` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `pybeltdb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pybeltdb`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `alias` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pybeltdb`.`friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pybeltdb`.`friends` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_friends_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_friends_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `pybeltdb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`pokes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `user_id` INT(11) NOT NULL,
  `friends_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pokes_users_idx` (`user_id` ASC),
  INDEX `fk_pokes_friends2_idx` (`friends_id` ASC),
  CONSTRAINT `fk_pokes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `pybeltdb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokes_friends2`
    FOREIGN KEY (`friends_id`)
    REFERENCES `pybeltdb`.`friends` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `pybeltdb` ;
USE `twitter` ;

-- -----------------------------------------------------
-- Table `twitter`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `handle` VARCHAR(255) NULL DEFAULT NULL,
  `birthday` DATE NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `twitter`.`tweets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`tweets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tweet` VARCHAR(140) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tweets_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_tweets_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `twitter`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `twitter`.`faves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`faves` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `tweet_id` INT(11) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_faves_users1_idx` (`user_id` ASC),
  INDEX `fk_faves_tweets1_idx` (`tweet_id` ASC),
  CONSTRAINT `fk_faves_tweets1`
    FOREIGN KEY (`tweet_id`)
    REFERENCES `twitter`.`tweets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_faves_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `twitter`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `twitter`.`follows`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `twitter`.`follows` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `followed_id` INT(11) NOT NULL,
  `follower_id` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_follows_users_idx` (`followed_id` ASC),
  CONSTRAINT `fk_follows_users`
    FOREIGN KEY (`followed_id`)
    REFERENCES `twitter`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
