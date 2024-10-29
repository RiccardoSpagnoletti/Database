CREATE DEFINER=`root`@`localhost` PROCEDURE `Criticita`()
BEGIN
	WITH Sensori AS (Select Timestamp, Sensore, Vano
FROM Sensore INNER JOIN Alert A ON A.sensore = CodSensore)

SELECT Edificio, COUNT(distinct timestamp,Sensore) AS Criticita
FROM Vano V INNER JOIN Sensori S
On V.CodVano = S.Vano
GROUP BY V.edificio;
END