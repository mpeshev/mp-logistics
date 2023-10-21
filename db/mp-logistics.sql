-- MySQL Script generated by MySQL Workbench
-- Sat 21 Oct 2023 11:30:22 PM EEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mplogistics
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mplogistics
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mplogistics` DEFAULT CHARACTER SET utf8mb4 ;
USE `mplogistics` ;

-- -----------------------------------------------------
-- Table `mplogistics`.`companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`companies` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mplogistics`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`clients` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`id`, `company_id`),
  CONSTRAINT `fk_clients_companies`
    FOREIGN KEY (`company_id`)
    REFERENCES `mplogistics`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_clients_companies_idx` ON `mplogistics`.`clients` (`company_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mplogistics`.`vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`vehicles` (
  `id` INT NOT NULL,
  `model` VARCHAR(45) NULL,
  `serial_number` VARCHAR(45) NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`id`, `company_id`),
  CONSTRAINT `fk_vehicles_companies1`
    FOREIGN KEY (`company_id`)
    REFERENCES `mplogistics`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_vehicles_companies1_idx` ON `mplogistics`.`vehicles` (`company_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mplogistics`.`job_titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`job_titles` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mplogistics`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`employees` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `company_id` INT NOT NULL,
  `job_title_id` INT NOT NULL,
  PRIMARY KEY (`id`, `company_id`, `job_title_id`),
  CONSTRAINT `fk_employees_companies1`
    FOREIGN KEY (`company_id`)
    REFERENCES `mplogistics`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_job_titles1`
    FOREIGN KEY (`job_title_id`)
    REFERENCES `mplogistics`.`job_titles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employees_companies1_idx` ON `mplogistics`.`employees` (`company_id` ASC) VISIBLE;

CREATE INDEX `fk_employees_job_titles1_idx` ON `mplogistics`.`employees` (`job_title_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mplogistics`.`qualifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`qualifications` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mplogistics`.`freights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`freights` (
  `id` INT NOT NULL,
  `from_address` VARCHAR(150) NULL,
  `to_address` VARCHAR(150) NULL,
  `departure_date` DATE NULL,
  `arrival_date` DATE NULL,
  `cost` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mplogistics`.`parcels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`parcels` (
  `id` INT NOT NULL,
  `item` VARCHAR(45) NULL,
  `weight` DOUBLE NULL,
  `freight_id` INT NOT NULL,
  PRIMARY KEY (`id`, `freight_id`),
  CONSTRAINT `fk_parcels_freights1`
    FOREIGN KEY (`freight_id`)
    REFERENCES `mplogistics`.`freights` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_parcels_freights1_idx` ON `mplogistics`.`parcels` (`freight_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mplogistics`.`passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`passengers` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `ssn` VARCHAR(45) NULL,
  `address` VARCHAR(150) NULL,
  `age` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mplogistics`.`qualifications_has_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`qualifications_has_employees` (
  `qualification_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`qualification_id`, `employee_id`),
  CONSTRAINT `fk_qualifications_has_employees_qualifications1`
    FOREIGN KEY (`qualification_id`)
    REFERENCES `mplogistics`.`qualifications` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_qualifications_has_employees_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `mplogistics`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_qualifications_has_employees_employees1_idx` ON `mplogistics`.`qualifications_has_employees` (`employee_id` ASC) VISIBLE;

CREATE INDEX `fk_qualifications_has_employees_qualifications1_idx` ON `mplogistics`.`qualifications_has_employees` (`qualification_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mplogistics`.`passengers_has_freights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mplogistics`.`passengers_has_freights` (
  `passenger_id` INT NOT NULL,
  `freight_id` INT NOT NULL,
  PRIMARY KEY (`passenger_id`, `freight_id`),
  CONSTRAINT `fk_passengers_has_freights_passengers1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `mplogistics`.`passengers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_passengers_has_freights_freights1`
    FOREIGN KEY (`freight_id`)
    REFERENCES `mplogistics`.`freights` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_passengers_has_freights_freights1_idx` ON `mplogistics`.`passengers_has_freights` (`freight_id` ASC) VISIBLE;

CREATE INDEX `fk_passengers_has_freights_passengers1_idx` ON `mplogistics`.`passengers_has_freights` (`passenger_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
