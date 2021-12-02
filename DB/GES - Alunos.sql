-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ges-alunos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ges-alunos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ges-alunos` ;
USE `ges-alunos` ;

-- -----------------------------------------------------
-- Table `ges-alunos`.`tipoconta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ges-alunos`.`tipoconta` (
  `idtipoconta` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoconta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ges-alunos`.`utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ges-alunos`.`utilizador` (
  `idutilizador` INT NOT NULL AUTO_INCREMENT,
  `idtipoconta` INT NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(50) NOT NULL DEFAULT 'gesAlunos',
  `nome` VARCHAR(45) NULL,
  `morada` VARCHAR(45) NULL,
  `dataNascimento` DATE NULL,
  `telemovel` INT(9) NULL,
  `urlFoto` VARCHAR(255) NULL,
  PRIMARY KEY (`idutilizador`),
  INDEX `fk_utilizador_tipoconta_idx` (`idtipoconta` ASC) VISIBLE,
  CONSTRAINT `fk_utilizador_tipoconta`
    FOREIGN KEY (`idtipoconta`)
    REFERENCES `ges-alunos`.`tipoconta` (`idtipoconta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ges-alunos`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ges-alunos`.`curso` (
  `idcurso` INT NOT NULL AUTO_INCREMENT,
  `designacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ges-alunos`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ges-alunos`.`turma` (
  `idturma` INT NOT NULL AUTO_INCREMENT,
  `designacao` VARCHAR(45) NOT NULL,
  `idcurso` INT NOT NULL,
  PRIMARY KEY (`idturma`),
  INDEX `fk_turma_curso1_idx` (`idcurso` ASC) VISIBLE,
  CONSTRAINT `fk_turma_curso1`
    FOREIGN KEY (`idcurso`)
    REFERENCES `ges-alunos`.`curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ges-alunos`.`turma_utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ges-alunos`.`turma_utilizador` (
  `idturma` INT NOT NULL,
  `idutilizador` INT NOT NULL,
  PRIMARY KEY (`idturma`, `idutilizador`),
  INDEX `fk_turma_has_utilizador_utilizador1_idx` (`idutilizador` ASC) VISIBLE,
  INDEX `fk_turma_has_utilizador_turma1_idx` (`idturma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_utilizador_turma1`
    FOREIGN KEY (`idturma`)
    REFERENCES `ges-alunos`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_utilizador_utilizador1`
    FOREIGN KEY (`idutilizador`)
    REFERENCES `ges-alunos`.`utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
