CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserimento_Misurazione`(IN codice INT, IN valx FLOAT , IN valy FLOAT, IN valz FLOAT, IN orario DATETIME )
BEGIN
	-- Devo ricavare il valore di soglia nel caso la misurazione sia da classificare alert--
    DECLARE ValoreMax FLOAT;
    SET ValoreMax = (SELECT Soglia FROM Sensore WHERE CodSensore = codice);
    
    IF orario IS NULL THEN
		SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "L'informazione orario deve avere valore non nullo";
        END IF;
	IF orario > current_timestamp() THEN
		SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "L'informazione orario deve avere valore minore o uguale a current_timestamp()";
        END IF;
        
    INSERT INTO Misura
    VALUES (orario,valx,valy,valz,codice);
    
    IF valx >= ValoreMax
    OR valy	>= ValoreMax
    OR valz	>= ValoreMax 
    THEN INSERT INTO Alert
		 VALUES (orario,codice);
	END IF;
END