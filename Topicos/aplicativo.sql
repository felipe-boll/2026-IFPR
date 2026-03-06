-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`materia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`topico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`topico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NULL,
  `materia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_topico_materia_idx` (`materia_id` ASC) VISIBLE,
  CONSTRAINT `fk_topico_materia`
    FOREIGN KEY (`materia_id`)
    REFERENCES `mydb`.`materia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`registro_estudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`registro_estudo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NULL,
  `data` DATE NOT NULL,
  `duracao` INT NOT NULL,
  `qt_corretas` INT NOT NULL,
  `qt_feitas` INT NOT NULL,
  `materia_id` INT NOT NULL,
  `topico_id` INT NOT NULL,
  PRIMARY KEY (`id`, `topico_id`),
  INDEX `fk_registro_geral_materia1_idx` (`materia_id` ASC) VISIBLE,
  INDEX `fk_registro_geral_topico1_idx` (`topico_id` ASC) VISIBLE,
  CONSTRAINT `fk_registro_geral_materia1`
    FOREIGN KEY (`materia_id`)
    REFERENCES `mydb`.`materia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_geral_topico1`
    FOREIGN KEY (`topico_id`)
    REFERENCES `mydb`.`topico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;