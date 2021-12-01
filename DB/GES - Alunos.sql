-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GES-Alunos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GES-Alunos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GES-Alunos` DEFAULT CHARACTER SET utf8 ;
USE `GES-Alunos` ;

-- -----------------------------------------------------
-- Table `GES-Alunos`.`tipoconta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GES-Alunos`.`tipoconta` (
  `idtipoconta` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoconta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GES-Alunos`.`utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GES-Alunos`.`utilizador` (
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
    REFERENCES `GES-Alunos`.`tipoconta` (`idtipoconta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GES-Alunos`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GES-Alunos`.`turma` (
  `idturma` INT NOT NULL,
  `designacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idturma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GES-Alunos`.`turma_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GES-Alunos`.`turma_aluno` (
  `idturma` INT NOT NULL,
  `idutilizador` INT NOT NULL,
  PRIMARY KEY (`idturma`, `idutilizador`),
  INDEX `fk_turma_has_utilizador_utilizador1_idx` (`idutilizador` ASC) VISIBLE,
  INDEX `fk_turma_has_utilizador_turma1_idx` (`idturma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_utilizador_turma1`
    FOREIGN KEY (`idturma`)
    REFERENCES `GES-Alunos`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_utilizador_utilizador1`
    FOREIGN KEY (`idutilizador`)
    REFERENCES `GES-Alunos`.`utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
