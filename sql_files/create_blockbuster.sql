-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blockbuster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blockbuster` ;

-- -----------------------------------------------------
-- Table `blockbuster`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Languaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Languaje` (
  `languaje_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`languaje_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`films` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(200) NULL,
  `description` VARCHAR(500) NULL,
  `year` INT NULL,
  `category_id` INT NOT NULL,
  `rental_duration` INT NULL,
  `rental_rate` FLOAT NULL,
  `length` INT NULL,
  `replacement_cost` FLOAT NULL,
  `rating` VARCHAR(45) NULL,
  `features` VARCHAR(100) NULL,
  `languaje_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `category_id`, `languaje_id`),
  INDEX `fk_films_Category_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_films_Languaje1_idx` (`languaje_id` ASC) VISIBLE,
  CONSTRAINT `fk_films_Category`
    FOREIGN KEY (`category_id`)
    REFERENCES `blockbuster`.`Category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_Languaje1`
    FOREIGN KEY (`languaje_id`)
    REFERENCES `blockbuster`.`Languaje` (`languaje_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actors` (
  `actors_id` INT NOT NULL,
  `full_name` VARCHAR(100) NULL,
  PRIMARY KEY (`actors_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`films_has_films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`films_has_films` (
  `films_films_id` INT NOT NULL,
  `films_category_id` INT NOT NULL,
  `films_languaje_id` INT NOT NULL,
  `films_films_id1` INT NOT NULL,
  `films_category_id1` INT NOT NULL,
  `films_languaje_id1` INT NOT NULL,
  PRIMARY KEY (`films_films_id`, `films_category_id`, `films_languaje_id`, `films_films_id1`, `films_category_id1`, `films_languaje_id1`),
  INDEX `fk_films_has_films_films2_idx` (`films_films_id1` ASC, `films_category_id1` ASC, `films_languaje_id1` ASC) VISIBLE,
  INDEX `fk_films_has_films_films1_idx` (`films_films_id` ASC, `films_category_id` ASC, `films_languaje_id` ASC) VISIBLE,
  CONSTRAINT `fk_films_has_films_films1`
    FOREIGN KEY (`films_films_id` , `films_category_id` , `films_languaje_id`)
    REFERENCES `blockbuster`.`films` (`film_id` , `category_id` , `languaje_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_has_films_films2`
    FOREIGN KEY (`films_films_id1` , `films_category_id1` , `films_languaje_id1`)
    REFERENCES `blockbuster`.`films` (`film_id` , `category_id` , `languaje_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`films_has_films1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`films_has_films1` (
  `films_films_id` INT NOT NULL,
  `films_category_id` INT NOT NULL,
  `films_languaje_id` INT NOT NULL,
  `films_films_id1` INT NOT NULL,
  `films_category_id1` INT NOT NULL,
  `films_languaje_id1` INT NOT NULL,
  PRIMARY KEY (`films_films_id`, `films_category_id`, `films_languaje_id`, `films_films_id1`, `films_category_id1`, `films_languaje_id1`),
  INDEX `fk_films_has_films1_films2_idx` (`films_films_id1` ASC, `films_category_id1` ASC, `films_languaje_id1` ASC) VISIBLE,
  INDEX `fk_films_has_films1_films1_idx` (`films_films_id` ASC, `films_category_id` ASC, `films_languaje_id` ASC) VISIBLE,
  CONSTRAINT `fk_films_has_films1_films1`
    FOREIGN KEY (`films_films_id` , `films_category_id` , `films_languaje_id`)
    REFERENCES `blockbuster`.`films` (`film_id` , `category_id` , `languaje_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_has_films1_films2`
    FOREIGN KEY (`films_films_id1` , `films_category_id1` , `films_languaje_id1`)
    REFERENCES `blockbuster`.`films` (`film_id` , `category_id` , `languaje_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`films_has_films2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`films_has_films2` (
  `films_films_id` INT NOT NULL,
  `films_category_id` INT NOT NULL,
  `films_languaje_id` INT NOT NULL,
  `films_films_id1` INT NOT NULL,
  `films_category_id1` INT NOT NULL,
  `films_languaje_id1` INT NOT NULL,
  PRIMARY KEY (`films_films_id`, `films_category_id`, `films_languaje_id`, `films_films_id1`, `films_category_id1`, `films_languaje_id1`),
  INDEX `fk_films_has_films2_films2_idx` (`films_films_id1` ASC, `films_category_id1` ASC, `films_languaje_id1` ASC) VISIBLE,
  INDEX `fk_films_has_films2_films1_idx` (`films_films_id` ASC, `films_category_id` ASC, `films_languaje_id` ASC) VISIBLE,
  CONSTRAINT `fk_films_has_films2_films1`
    FOREIGN KEY (`films_films_id` , `films_category_id` , `films_languaje_id`)
    REFERENCES `blockbuster`.`films` (`film_id` , `category_id` , `languaje_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_has_films2_films2`
    FOREIGN KEY (`films_films_id1` , `films_category_id1` , `films_languaje_id1`)
    REFERENCES `blockbuster`.`films` (`film_id` , `category_id` , `languaje_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`films_actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`films_actors` (
  `films_films_id` INT NOT NULL,
  `actors_actors_id` INT NOT NULL,
  PRIMARY KEY (`films_films_id`, `actors_actors_id`),
  INDEX `fk_films_has_actors_actors1_idx` (`actors_actors_id` ASC) VISIBLE,
  INDEX `fk_films_has_actors_films1_idx` (`films_films_id` ASC) VISIBLE,
  CONSTRAINT `fk_films_has_actors_films1`
    FOREIGN KEY (`films_films_id`)
    REFERENCES `blockbuster`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films_has_actors_actors1`
    FOREIGN KEY (`actors_actors_id`)
    REFERENCES `blockbuster`.`actors` (`actors_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `film_id`),
  INDEX `fk_inventory_films1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_films1`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`films` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`staff` (
  `staff_id` INT NOT NULL,
  `full_name` VARCHAR(45) NULL,
  `birthdate` DATETIME NULL,
  `position` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`customers` (
  `customer_id` INT NOT NULL,
  `full_name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  `sign_up_date` DATETIME NULL,
  `staff_op` INT NOT NULL,
  PRIMARY KEY (`customer_id`, `staff_op`),
  INDEX `fk_customers_staff1_idx` (`staff_op` ASC) VISIBLE,
  CONSTRAINT `fk_customers_staff1`
    FOREIGN KEY (`staff_op`)
    REFERENCES `blockbuster`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL,
  `return_date` DATETIME NULL,
  `inventory_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `inventory_id`, `customer_id`, `staff_id`, `film_id`),
  INDEX `fk_rental_staff1_idx` (`staff_id` ASC) VISIBLE,
  INDEX `fk_rental_customers1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_rental_inventory1_idx` (`inventory_id` ASC, `film_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `blockbuster`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `blockbuster`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_id` , `film_id`)
    REFERENCES `blockbuster`.`inventory` (`inventory_id` , `film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
