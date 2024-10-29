CREATE DEFINER=`root`@`localhost` PROCEDURE `InfoEdificio`(IN codice INT)
BEGIN
	SELECT Edificio, Piano, CodVano AS Vano, (Lunghezza/100*Larghezza/100) AS Area
	FROM Edificio NATURAL JOIN Piano NATURAL JOIN Vano
	WHERE CodEdificio = codice
	GROUP BY Piano, CodVano;
END