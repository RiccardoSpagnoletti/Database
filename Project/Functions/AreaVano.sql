CREATE DEFINER=`root`@`localhost` FUNCTION `AreaVano`(codice INT) RETURNS double(8,2)
    DETERMINISTIC
BEGIN

DECLARE LatoX , LatoY decimal(8, 2) ;

SELECT Max(yf-yi)/100 INTO LatoY-- Il muro non condiviso più lungo per le y--
FROM Muro
Where xf-xi = 0
AND Vano1 = codice;

SELECT Max(xf-xi)/100 INTO LatoX-- Il muro non condiviso più lungo per le x--
FROM Muro
Where yf-yi = 0
AND Vano1 = codice;
		
RETURN LatoX*LatoY;
END