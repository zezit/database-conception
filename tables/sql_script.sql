-- MySQL Script generated by MySQL Workbench
-- Sat May 13 13:53:19 2023
-- Model: New Model    Version: 1.0
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
-- -----------------------------------------------------
-- Schema pokemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pokemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pokemon` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokemon` (
  `id_pokemon` INT NOT NULL,
  `altura` INT NULL,
  `velocidade_ataque` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pokemon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo` (
  `tipo_id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`tipo_id`))
ENGINE = InnoDB;

USE `pokemon` ;

-- -----------------------------------------------------
-- Table `pokemon`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokemon`.`categoria` (
  `categoria_id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`categoria_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pokemon`.`habilidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokemon`.`habilidade` (
  `habilidade_id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`habilidade_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pokemon`.`especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokemon`.`especie` (
  `especie_id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`especie_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pokemon`.`pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokemon`.`pokemon` (
  `pokemon_id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `peso` DECIMAL(12,2) NOT NULL,
  `valor_ataque` DECIMAL(12,2) NOT NULL,
  `valor_defesa` DECIMAL(12,2) NOT NULL,
  `velocidade_media` DECIMAL(12,2) NOT NULL,
  `especie_especie_id` INT NOT NULL,
  `categoria_categoria_id` INT NOT NULL,
  `tipo_1` INT NULL,
  PRIMARY KEY (`pokemon_id`),
  INDEX `fk_pokemon_especie1_idx` (`especie_especie_id` ASC) VISIBLE,
  INDEX `fk_pokemon_categoria1_idx` (`categoria_categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_pokemon_especie1`
    FOREIGN KEY (`especie_especie_id`)
    REFERENCES `pokemon`.`especie` (`especie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_categoria1`
    FOREIGN KEY (`categoria_categoria_id`)
    REFERENCES `pokemon`.`categoria` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pokemon`.`pokemon_has_habilidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokemon`.`pokemon_has_habilidade` (
  `oculta` TINYINT NULL DEFAULT NULL,
  `habilidade_habilidade_id` INT NOT NULL,
  `pokemon_pokemon_id` INT NOT NULL,
  PRIMARY KEY (`habilidade_habilidade_id`, `pokemon_pokemon_id`),
  INDEX `fk_pokemon_has_habilidade_habilidade1_idx` (`habilidade_habilidade_id` ASC) VISIBLE,
  INDEX `fk_pokemon_has_habilidade_pokemon1_idx` (`pokemon_pokemon_id` ASC) VISIBLE,
  CONSTRAINT `fk_pokemon_has_habilidade_habilidade1`
    FOREIGN KEY (`habilidade_habilidade_id`)
    REFERENCES `pokemon`.`habilidade` (`habilidade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_has_habilidade_pokemon1`
    FOREIGN KEY (`pokemon_pokemon_id`)
    REFERENCES `pokemon`.`pokemon` (`pokemon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pokemon`.`pokemon_has_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokemon`.`pokemon_has_tipo` (
  `pokemon_pokemon_id` INT NOT NULL,
  `tipo_tipo_id` INT NOT NULL,
  `tipo` INT NULL,
  PRIMARY KEY (`pokemon_pokemon_id`, `tipo_tipo_id`),
  INDEX `fk_pokemon_has_tipo_tipo1_idx` (`tipo_tipo_id` ASC) VISIBLE,
  INDEX `fk_pokemon_has_tipo_pokemon1_idx` (`pokemon_pokemon_id` ASC) VISIBLE,
  CONSTRAINT `fk_pokemon_has_tipo_pokemon1`
    FOREIGN KEY (`pokemon_pokemon_id`)
    REFERENCES `pokemon`.`pokemon` (`pokemon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_has_tipo_tipo1`
    FOREIGN KEY (`tipo_tipo_id`)
    REFERENCES `mydb`.`tipo` (`tipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;