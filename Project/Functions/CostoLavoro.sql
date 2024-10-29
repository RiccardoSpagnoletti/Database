CREATE DEFINER=`root`@`localhost` FUNCTION `CostoLavoro`(codice INT) RETURNS double(8,2)
    DETERMINISTIC
BEGIN
DECLARE CostoO, CostoCc , CostoM, costo double (10,2);


SET CostoM = (SELECT SUM(CostoUnita*Quantita)
FROM Acquisto A INNER JOIN Materiale M ON M.CodLotto = A.Lotto
WHERE A.Lavoro = codice);

  
SELECT SUM(PagaH*OraTot) INTO CostoCC
FROM capocantiere C 
INNER JOIN (SELECT distinct Data,OraTot,Mansione,D.CodiceFiscale AS CFC
								FROM Direzione D INNER JOIN Turno 
                                ON CodiceLavoro = D.Lavoro
								WHERE CodiceLavoro = codice) AS F
ON C.CodFiscale = CFC;
                
SELECT SUM(O.PagaH*OraTot) INTO CostoO 
FROM Turno INNER JOIN Operaio O 
ON CodiceFiscale = CodFiscale
WHERE CodiceLAvoro = codice;


SET costo = CostoCC+CostoO+CostoM;


RETURN costo;
END