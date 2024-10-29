SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PBD
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PBD` ;

-- -----------------------------------------------------
-- Schema PBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PBD` DEFAULT CHARACTER SET utf32 ;
USE `PBD` ;

-- -----------------------------------------------------
-- Table `Area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Area` ;

CREATE TABLE IF NOT EXISTS `Area` (
  `CodArea` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodArea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rischio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rischio` ;

CREATE TABLE IF NOT EXISTS `Rischio` (
  `Data` DATE NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `CoeffRischio` FLOAT NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Data`, `Tipo`, `Area`),
  INDEX `fk_Rischio_Area1_idx` (`Area` ASC) VISIBLE,
  CONSTRAINT `fk_Rischio_Area1`
    FOREIGN KEY (`Area`)
    REFERENCES `Area` (`CodArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Calamita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Calamita` ;

CREATE TABLE IF NOT EXISTS `Calamita` (
  `Data` DATETIME NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Latitudine` DECIMAL(9,6) NOT NULL,
  `Longitudine` DECIMAL(9,6) NOT NULL,
  `Intensita` FLOAT NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Data`, `Tipo`),
  INDEX `fk_Calamità_Area1_idx` (`Area` ASC) VISIBLE,
  CONSTRAINT `fk_Calamità_Area1`
    FOREIGN KEY (`Area`)
    REFERENCES `Area` (`CodArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Edificio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Edificio` ;

CREATE TABLE IF NOT EXISTS `Edificio` (
  `CodEdificio` INT NOT NULL AUTO_INCREMENT,
  `Latitudine` DECIMAL(9,6) NOT NULL,
  `Longitudine` DECIMAL(9,6) NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  `Criticita` INT NULL,
  PRIMARY KEY (`CodEdificio`),
  INDEX `fk_Edificio_Area1_idx` (`Area` ASC) VISIBLE,
  UNIQUE INDEX `Latitudine_UNIQUE` (`Latitudine` ASC) VISIBLE,
  UNIQUE INDEX `Longitudine_UNIQUE` (`Longitudine` ASC) VISIBLE,
  CONSTRAINT `fk_Edificio_Area1`
    FOREIGN KEY (`Area`)
    REFERENCES `Area` (`CodArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Piano`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Piano` ;

CREATE TABLE IF NOT EXISTS `Piano` (
  `Numero` INT NOT NULL,
  `Edificio` INT NOT NULL,
  PRIMARY KEY (`Numero`, `Edificio`),
  INDEX `fk_Piano_Edificio1_idx` (`Edificio` ASC) VISIBLE,
  CONSTRAINT `fk_Piano_Edificio1`
    FOREIGN KEY (`Edificio`)
    REFERENCES `Edificio` (`CodEdificio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vano`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vano` ;

CREATE TABLE IF NOT EXISTS `Vano` (
  `CodVano` INT NOT NULL AUTO_INCREMENT,
  `Lunghezza` INT NOT NULL,
  `Hmax` INT NOT NULL,
  `Larghezza` INT NOT NULL,
  `Impiego` VARCHAR(45) NOT NULL,
  `Piano` INT NOT NULL,
  `Edificio` INT NOT NULL,
  PRIMARY KEY (`CodVano`),
  INDEX `fk_Vano_Piano1_idx` (`Piano` ASC, `Edificio` ASC) VISIBLE,
  CONSTRAINT `fk_Vano_Piano1`
    FOREIGN KEY (`Piano` , `Edificio`)
    REFERENCES `Piano` (`Numero` , `Edificio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Muro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Muro` ;

CREATE TABLE IF NOT EXISTS `Muro` (
  `CodMuro` INT NOT NULL,
  `xi` INT NOT NULL,
  `yi` INT NOT NULL,
  `xf` INT NOT NULL,
  `yf` INT NOT NULL,
  `Vano1` INT NOT NULL,
  `Vano2` INT NULL,
  PRIMARY KEY (`CodMuro`),
  INDEX `fk_Muro_Vano1_idx` (`Vano1` ASC) VISIBLE,
  INDEX `fk_Muro_Vano2_idx` (`Vano2` ASC) VISIBLE,
  CONSTRAINT `fk_Muro_Vano1`
    FOREIGN KEY (`Vano1`)
    REFERENCES `Vano` (`CodVano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Muro_Vano2`
    FOREIGN KEY (`Vano2`)
    REFERENCES `Vano` (`CodVano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PuntoAperto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PuntoAperto` ;

CREATE TABLE IF NOT EXISTS `PuntoAperto` (
  `Px` INT NOT NULL,
  `Py` INT NOT NULL,
  `Lunghezza` INT NOT NULL,
  `Altezza` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Orientazione` VARCHAR(5) NOT NULL,
  `Muro` INT NOT NULL,
  PRIMARY KEY (`Px`, `Muro`, `Py`),
  INDEX `fk_PuntoAperto_Muro1_idx` (`Muro` ASC) VISIBLE,
  CONSTRAINT `fk_PuntoAperto_Muro1`
    FOREIGN KEY (`Muro`)
    REFERENCES `Muro` (`CodMuro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Responsabile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Responsabile` ;

CREATE TABLE IF NOT EXISTS `Responsabile` (
  `CodFiscale` CHAR(26) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Cognome` VARCHAR(45) NOT NULL,
  `Compenso` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`CodFiscale`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Progetto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Progetto` ;

CREATE TABLE IF NOT EXISTS `Progetto` (
  `CodProgetto` INT NOT NULL,
  `CodiceFiscale` CHAR(16) NOT NULL,
  `Edificio` INT NOT NULL,
  `CostoProgetto` DECIMAL(10,2) NULL,
  PRIMARY KEY (`CodProgetto`),
  INDEX `fk_Progetto_Responsabile1_idx` (`CodiceFiscale` ASC) VISIBLE,
  INDEX `fk_Progetto_Edificio1_idx` (`Edificio` ASC) VISIBLE,
  CONSTRAINT `fk_Progetto_Responsabile1`
    FOREIGN KEY (`CodiceFiscale`)
    REFERENCES `Responsabile` (`CodFiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Progetto_Edificio1`
    FOREIGN KEY (`Edificio`)
    REFERENCES `Edificio` (`CodEdificio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StadioAvanzamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StadioAvanzamento` ;

CREATE TABLE IF NOT EXISTS `StadioAvanzamento` (
  `CodStadio` INT NOT NULL,
  `DataInizio` DATE NOT NULL,
  `StimaFine` DATE NOT NULL,
  `Progetto` INT NOT NULL,
  PRIMARY KEY (`CodStadio`),
  INDEX `fk_StadioAvanzamento_Progetto1_idx` (`Progetto` ASC) VISIBLE,
  CONSTRAINT `fk_StadioAvanzamento_Progetto1`
    FOREIGN KEY (`Progetto`)
    REFERENCES `Progetto` (`CodProgetto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lavoro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Lavoro` ;

CREATE TABLE IF NOT EXISTS `Lavoro` (
  `CodLavoro` INT NOT NULL,
  `DataInizio` DATE NOT NULL,
  `DataFine` DATE NULL,
  `OgettoLavoro` VARCHAR(45) NOT NULL,
  `Vano` INT NOT NULL,
  `Stadio` INT NOT NULL,
  `Muro` INT NULL,
  PRIMARY KEY (`CodLavoro`),
  INDEX `fk_Lavoro_Vano1_idx` (`Vano` ASC) VISIBLE,
  INDEX `fk_Lavoro_StadioAvanzamento1_idx` (`Stadio` ASC) VISIBLE,
  INDEX `fk_Lavoro_Muro1_idx` (`Muro` ASC) VISIBLE,
  CONSTRAINT `fk_Lavoro_Vano1`
    FOREIGN KEY (`Vano`)
    REFERENCES `Vano` (`CodVano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lavoro_StadioAvanzamento1`
    FOREIGN KEY (`Stadio`)
    REFERENCES `StadioAvanzamento` (`CodStadio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lavoro_Muro1`
    FOREIGN KEY (`Muro`)
    REFERENCES `Muro` (`CodMuro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Operaio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Operaio` ;

CREATE TABLE IF NOT EXISTS `Operaio` (
  `CodFiscale` CHAR(16) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Cognome` VARCHAR(45) NOT NULL,
  `PagaH` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`CodFiscale`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Turno` ;

CREATE TABLE IF NOT EXISTS `Turno` (
  `Data` DATE NOT NULL,
  `OraTot` INT NOT NULL,
  `Mansione` VARCHAR(45) NOT NULL,
  `CodiceFiscale` CHAR(16) NOT NULL,
  `CodiceLavoro` INT NOT NULL,
  PRIMARY KEY (`Data`, `OraTot`, `CodiceFiscale`),
  INDEX `fk_Turno_Operaio1_idx` (`CodiceFiscale` ASC) VISIBLE,
  INDEX `fk_Turno_Lavoro1_idx` (`CodiceLavoro` ASC) VISIBLE,
  CONSTRAINT `fk_Turno_Operaio1`
    FOREIGN KEY (`CodiceFiscale`)
    REFERENCES `Operaio` (`CodFiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turno_Lavoro1`
    FOREIGN KEY (`CodiceLavoro`)
    REFERENCES `Lavoro` (`CodLavoro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CapoCantiere`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CapoCantiere` ;

CREATE TABLE IF NOT EXISTS `CapoCantiere` (
  `CodFiscale` VARCHAR(16) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Cognome` VARCHAR(45) NOT NULL,
  `PagaH` DECIMAL(4,2) NOT NULL,
  `MaxOperai` INT NOT NULL,
  PRIMARY KEY (`CodFiscale`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Materiale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Materiale` ;

CREATE TABLE IF NOT EXISTS `Materiale` (
  `CodLotto` VARCHAR(8) NOT NULL,
  `CostoUnita` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`CodLotto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mattone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mattone` ;

CREATE TABLE IF NOT EXISTS `Mattone` (
  `Composizione` VARCHAR(45) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `Alveolatura` VARCHAR(45) NOT NULL,
  `Lotto` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Lotto`),
  CONSTRAINT `fk_Mattone_Materiale1`
    FOREIGN KEY (`Lotto`)
    REFERENCES `Materiale` (`CodLotto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Piastrella`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Piastrella` ;

CREATE TABLE IF NOT EXISTS `Piastrella` (
  `tipo` VARCHAR(45) NOT NULL,
  `Lati` INT NOT NULL,
  `Disegno` VARCHAR(45) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `Lotto` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Lotto`),
  CONSTRAINT `fk_Piastrella_Materiale1`
    FOREIGN KEY (`Lotto`)
    REFERENCES `Materiale` (`CodLotto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Intonaco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Intonaco` ;

CREATE TABLE IF NOT EXISTS `Intonaco` (
  `Tipo` VARCHAR(45) NOT NULL,
  `Lotto` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Lotto`),
  CONSTRAINT `fk_Intonaco_Materiale1`
    FOREIGN KEY (`Lotto`)
    REFERENCES `Materiale` (`CodLotto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pietra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pietra` ;

CREATE TABLE IF NOT EXISTS `Pietra` (
  `Tipo` VARCHAR(45) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `Lotto` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Lotto`),
  CONSTRAINT `fk_Pietra_Materiale1`
    FOREIGN KEY (`Lotto`)
    REFERENCES `Materiale` (`CodLotto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MaterialeNR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MaterialeNR` ;

CREATE TABLE IF NOT EXISTS `MaterialeNR` (
  `Info` VARCHAR(45) NOT NULL,
  `x` FLOAT NULL,
  `y` FLOAT NULL,
  `z` FLOAT NULL,
  `Lotto` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Lotto`),
  CONSTRAINT `fk_MaterialeNR_Materiale1`
    FOREIGN KEY (`Lotto`)
    REFERENCES `Materiale` (`CodLotto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sensore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sensore` ;

CREATE TABLE IF NOT EXISTS `Sensore` (
  `CodSensore` INT NOT NULL AUTO_INCREMENT,
  `Soglia` FLOAT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `x` INT NOT NULL,
  `y` INT NOT NULL,
  `z` INT NOT NULL,
  `Vano` INT NOT NULL,
  PRIMARY KEY (`CodSensore`),
  INDEX `fk_Sensore_Vano1_idx` (`Vano` ASC) VISIBLE,
  CONSTRAINT `fk_Sensore_Vano1`
    FOREIGN KEY (`Vano`)
    REFERENCES `Vano` (`CodVano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Misura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Misura` ;

CREATE TABLE IF NOT EXISTS `Misura` (
  `Timestamp` DATETIME NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NULL DEFAULT NULL,
  `z` FLOAT NULL DEFAULT NULL,
  `Sensore` INT NOT NULL,
  PRIMARY KEY (`Timestamp`, `Sensore`),
  INDEX `fk_Misura_Sensore1_idx` (`Sensore` ASC) VISIBLE,
  CONSTRAINT `fk_Misura_Sensore1`
    FOREIGN KEY (`Sensore`)
    REFERENCES `Sensore` (`CodSensore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alert`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Alert` ;

CREATE TABLE IF NOT EXISTS `Alert` (
  `Timestamp` DATETIME NOT NULL,
  `Sensore` INT NOT NULL,
  PRIMARY KEY (`Timestamp`, `Sensore`),
  CONSTRAINT `fk_Alert_Misura1`
    FOREIGN KEY (`Timestamp` , `Sensore`)
    REFERENCES `Misura` (`Timestamp` , `Sensore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Direzione`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Direzione` ;

CREATE TABLE IF NOT EXISTS `Direzione` (
  `CodiceFiscale` VARCHAR(16) NOT NULL,
  `Lavoro` INT NOT NULL,
  PRIMARY KEY (`CodiceFiscale`, `Lavoro`),
  INDEX `fk_CapoCantiere_has_Lavoro_Lavoro1_idx` (`Lavoro` ASC) VISIBLE,
  INDEX `fk_CapoCantiere_has_Lavoro_CapoCantiere1_idx` (`CodiceFiscale` ASC) VISIBLE,
  CONSTRAINT `fk_CapoCantiere_has_Lavoro_CapoCantiere1`
    FOREIGN KEY (`CodiceFiscale`)
    REFERENCES `CapoCantiere` (`CodFiscale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CapoCantiere_has_Lavoro_Lavoro1`
    FOREIGN KEY (`Lavoro`)
    REFERENCES `Lavoro` (`CodLavoro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Acquisto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Acquisto` ;

CREATE TABLE IF NOT EXISTS `Acquisto` (
  `Lotto` VARCHAR(8) NOT NULL,
  `Lavoro` INT NOT NULL,
  `Fornitore` VARCHAR(45) NOT NULL,
  `DataAcquisto` DATE NOT NULL,
  `Quantita` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`Lotto`, `Lavoro`),
  INDEX `fk_Materiale_has_Lavoro_Lavoro1_idx` (`Lavoro` ASC) VISIBLE,
  INDEX `fk_Materiale_has_Lavoro_Materiale1_idx` (`Lotto` ASC) VISIBLE,
  CONSTRAINT `fk_Materiale_has_Lavoro_Materiale1`
    FOREIGN KEY (`Lotto`)
    REFERENCES `Materiale` (`CodLotto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materiale_has_Lavoro_Lavoro1`
    FOREIGN KEY (`Lavoro`)
    REFERENCES `Lavoro` (`CodLavoro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
