-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoclub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `videoclub` ;

-- -----------------------------------------------------
-- Table `videoclub`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`actor` (
  `actor_id` INT NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`language` (
  `language_id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(300) NULL DEFAULT NULL,
  `description` VARCHAR(3000) NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` FLOAT NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `cost` FLOAT NULL DEFAULT NULL,
  `rating` VARCHAR(45) NULL DEFAULT NULL,
  `special_features` VARCHAR(1000) NULL DEFAULT NULL,
  `category` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_film_language1_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `videoclub`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`film_to_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`film_to_actor` (
  `film_id` INT NULL DEFAULT NULL,
  `actor_id` INT NULL DEFAULT NULL,
  INDEX `fk_film_to_actor_film_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_film_to_actor_actor1_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_to_actor_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `videoclub`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_to_actor_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `videoclub`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  INDEX `fk_inventory_film1_idx` (`film_id` ASC) VISIBLE,
  PRIMARY KEY (`inventory_id`),
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `videoclub`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `phone` INT NULL,
  `emial` VARCHAR(100) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`staff` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoclub`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` TIMESTAMP NULL,
  `return_date` TIMESTAMP NULL,
  `customer_customer_id` INT NOT NULL,
  `staff_staff_id` INT NOT NULL,
  `inventory_inventory_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `customer_customer_id`, `staff_staff_id`, `inventory_inventory_id`),
  INDEX `fk_rental_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_rental_staff1_idx` (`staff_staff_id` ASC) VISIBLE,
  INDEX `fk_rental_inventory1_idx` (`inventory_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `videoclub`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_staff1`
    FOREIGN KEY (`staff_staff_id`)
    REFERENCES `videoclub`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_inventory_id`)
    REFERENCES `videoclub`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
