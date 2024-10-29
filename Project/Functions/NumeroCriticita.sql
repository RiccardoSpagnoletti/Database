CREATE DEFINER=`root`@`localhost` FUNCTION `NumeroCriticita`(codice INT) RETURNS int
    DETERMINISTIC
BEGIN

DECLARE Criticita INT;

WITH Sensori AS (Select Timestamp, Sensore, Vano
FROM Sensore INNER JOIN Alert A ON A.sensore = CodSensore)

SELECT COUNT(distinct timestamp,Sensore) INTO Criticita
FROM Vano V INNER JOIN Sensori S
On V.CodVano = S.Vano
Where V.edificio = codice;

RETURN Criticita;
END