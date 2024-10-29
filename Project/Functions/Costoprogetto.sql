CREATE DEFINER=`root`@`localhost` FUNCTION `CostoProgetto`(codice INT) RETURNS double
    DETERMINISTIC
BEGIN
	
DECLARE CostoR,CostoO, CostoCc , CostoM, costo double (10,2);

SET CostoR = (SELECT SUM(Compenso) FROM Responsabile INNER JOIN Progetto ON CodiceFiscale = CodFiscale);


SET CostoM = (SELECT SUM(CostoUnita*Quantita)
FROM Acquisto A INNER JOIN Materiale M ON M.CodLotto = A.Lotto
WHERE A.Lavoro IN ( SELECT L.CodLavoro
	FROM Lavoro L INNER JOIN StadioAvanzamento SA
    ON SA.CodStadio = L.stadio
    WHERE Sa.Progetto = codice));


WITH TurniTOT AS (SELECT *
FROM Turno T INNER JOIN ( SELECT L.CodLavoro
	FROM Lavoro L INNER JOIN StadioAvanzamento SA
    ON SA.CodStadio = L.stadio
    WHERE Sa.Progetto = codice) AS F1
    ON F1.CodLavoro = CodiceLavoro ) 
  
  SELECT SUM(PagaH*OraTot) INTO CostoCC
				FROM capocantiere C INNER JOIN (SELECT distinct Data,OraTot,Mansione,D.CodiceFiscale AS CFC
														FROM Direzione D INNER JOIN TurniTOT ON CodiceLavoro = D.Lavoro) AS F
                                                        ON C.CodFiscale = CFC;
WITH TurniTOT AS (SELECT *
FROM Turno T INNER JOIN ( SELECT L.CodLavoro
	FROM Lavoro L INNER JOIN StadioAvanzamento SA
    ON SA.CodStadio = L.stadio
    WHERE Sa.Progetto = codice) AS F1
    ON F1.CodLavoro = CodiceLavoro ) 
    
SELECT SUM(O.PagaH*OraTot) INTO CostoO FROM TurniTOT TT INNER JOIN Operaio O ON TT.CodiceFiscale = O.CodFiscale;


SET costo = CostoR+CostoCC+CostoO+CostoM;


RETURN costo;
END