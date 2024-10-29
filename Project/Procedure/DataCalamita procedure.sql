CREATE DEFINER=`root`@`localhost` PROCEDURE `DataCalamita`(IN datax DATE )
BEGIN
	

WITH Capi AS (SELECT CodFiscale , Lavoro
			  FROM Capocantiere 
              INNER JOIN Direzione 
              ON CodiceFiscale = CodFiscale)

SELECT CC.CodFiscale AS CapoCantiere , F.CodiceFiscale AS Operai
FROM Capi CC INNER JOIN (SELECT distinct CodiceFiscale , CodiceLavoro
						FROM Turno T INNER JOIN Operaio O 
                        ON T.CodiceFiscale = O.CodFiscale
						WHERE T.CodiceLavoro IN (SELECT CodLavoro
												 FROM Progetto P INNER JOIN stadioavanzamento SA INNER JOIN Lavoro L
												 WHERE SA.Progetto = P.CodProgetto 
												 AND L.Stadio = SA.CodStadio 
												 AND P.Edificio IN (SELECT E.CodEdificio
																	FROM edificio E INNER JOIN calamita CA
																	ON E.Area = CA.Area 
																	WHERE date_format(CA.Data, '%Y-%m-%d') = datax))
						AND T.DATA = datax) AS F
ON CC.Lavoro = F.CodiceLavoro;
    
END