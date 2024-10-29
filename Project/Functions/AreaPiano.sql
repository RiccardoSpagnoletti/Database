CREATE DEFINER=`root`@`localhost` FUNCTION `AreaPiano`(codiceP INT, codiceE INT) RETURNS double(8,2)
    DETERMINISTIC
BEGIN

DECLARE AreaTot double(8,2);

WITH AreeVani AS (SELECT Max(xf-xi)/100*Max(yf-yi)/100 AS AreaVano
	FROM muro 
	WHERE Vano1 IN (SELECT CodVano FROM vano WHERE Edificio = 1 AND Piano = 0)
	GROUP BY Vano1)


SELECT sum(AreaVano) INTO AreaTot
FROM AreeVani;

RETURN AreaTot;
END