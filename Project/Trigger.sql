USE `PBD`;

DELIMITER $$

USE `PBD`$$
DROP TRIGGER IF EXISTS `Calamita_BEFORE_UPDATE` $$
USE `PBD`$$
CREATE DEFINER = CURRENT_USER TRIGGER `PBD`.`Calamita_BEFORE_UPDATE` BEFORE UPDATE ON `Calamita` FOR EACH ROW
BEGIN
IF new.Data > current_timestamp() THEN 
     signal sqlstate '45000'
		set message_text='Non è possibile inserire la fine di una calamita avvenuta in data successiva a quella odierna' ;
	END IF;
END$$


USE `PBD`$$
DROP TRIGGER IF EXISTS `Lavoro_BEFORE_UPDATE_1` $$
USE `PBD`$$
CREATE DEFINER = CURRENT_USER TRIGGER `PBD`.`Lavoro_BEFORE_UPDATE_1` BEFORE UPDATE ON `Lavoro` FOR EACH ROW
BEGIN
DECLARE codice INT;
    
    IF new.DataFine > current_date() THEN 
     signal sqlstate '45000'
		set message_text='Non è possibile inserire la fine di un lavoro avvenuto in data successiva a quella odierna' ;
	END IF;
    
	SELECT Progetto INTO codice
    FROM StadioAvanzamento 
    WHERE new.Stadio = CodStadio;

	IF old.DataFine IS NULL AND new.DataFine IS NOT NULL AND (SELECT CostoProgetto FROM Progetto WHERE CodProgetto = codice)  IS NULL THEN
		
		UPDATE Progetto
			SET CostoProgetto = (Select CostoProgetto(codice)); 
	END IF;
    
END$$


USE `PBD`$$
DROP TRIGGER IF EXISTS `Lavoro_AFTER_UPDATE` $$
USE `PBD`$$
CREATE DEFINER = CURRENT_USER TRIGGER `PBD`.`Lavoro_AFTER_UPDATE` AFTER UPDATE ON `Lavoro` FOR EACH ROW
BEGIN
IF old.DataFine IS NULL AND new.DataFine IS NOT NULL THEN 
		
		UPDATE Progetto
			SET CostoProgetto = CostoProgetto + CostoLavoro(new.CodLavoro)
            WHERE CodProgetto = (SELECT Progetto FROM StadioAvanzamento WHERE new.Stadio = CodStadio);
	END IF;
END$$


USE `PBD`$$
DROP TRIGGER IF EXISTS `Alert_AFTER_INSERT` $$
USE `PBD`$$
CREATE DEFINER = CURRENT_USER TRIGGER `PBD`.`Alert_AFTER_INSERT` AFTER INSERT ON `Alert` FOR EACH ROW
BEGIN

		UPDATE Edificio set Criticita = Criticita + 1 
         where CodEdificio = (SELECT distinct edificio
		FROM Vano INNER JOIN Sensore  
		ON Vano = CodVAno 
		WHERE new.Sensore = CodSensore);
        END IF;
    
END$$


USE `PBD`$$
DROP TRIGGER IF EXISTS `Acquisto_BEFORE_INSERT` $$
USE `PBD`$$
CREATE DEFINER = CURRENT_USER TRIGGER `PBD`.`Acquisto_BEFORE_INSERT` BEFORE INSERT ON `Acquisto` FOR EACH ROW
BEGIN
IF new.DataAcquisto > current_date() THEN 
     signal sqlstate '45000'
		set message_text='Non è possibile inserire un acquisto avvenuto in data successiva a quella odierna' ;
	END IF;
END$$


DELIMITER ;