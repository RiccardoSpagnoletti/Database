CREATE DEFINER=`root`@`localhost` PROCEDURE `ManoDopera`(IN giorno DATE , OUT NumeroOp INT, OUT CostoOp DECIMAL (10,2), OUT NumeroCc INT , OUT CostoCc DECIMAL(10,2))
BEGIN
	
SET CostoOp =  (SELECT sum(PagaH*OraTot)
			   FROM turno T
			   INNER JOIN operaio O ON T.CodiceFiscale = O.CodFiscale
			   WHERE Data = giorno);

SET NumeroOp = (SELECT count(distinct CodiceFiscale)
			   FROM turno T2
			   INNER JOIN operaio O ON T2.CodiceFiscale = O.CodFiscale
			   WHERE Data = giorno);


SELECT COUNT(DISTINCT CodiceFiscale) INTO NumeroCc
FROM capocantiere C INNER JOIN (SELECT D.CodiceFiscale , L1.codice, L1.Ore
								FROM direzione D INNER JOIN (SELECT sum(OraTot) AS Ore , CodLavoro AS codice
															 FROM turno T1
															 INNER JOIN lavoro L ON T1.CodiceLavoro = L.CodLavoro 
															 WHERE T1.Data = giorno) AS L1
								ON D.Lavoro = L1.codice)AS F1;

SELECT SUM(PagaH* Ore) INTO CostoCc
FROM capocantiere C INNER JOIN (SELECT D.CodiceFiscale , L1.codice, L1.Ore
								FROM direzione D INNER JOIN (SELECT sum(OraTot) AS Ore , CodLavoro AS codice
															 FROM turno T1
															 INNER JOIN lavoro L ON T1.CodiceLavoro = L.CodLavoro 
															 WHERE T1.Data = giorno) AS L1
								ON D.Lavoro = L1.codice)AS F;
                                
select NumeroOp, CostoOp, NumeroCc, CostoCc;

END