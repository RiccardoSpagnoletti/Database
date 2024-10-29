CREATE DEFINER=`root`@`localhost` FUNCTION `UtilizzoMateriale`(codice INT) RETURNS varchar(45) CHARSET utf32
    DETERMINISTIC
BEGIN
		DECLARE MaterialeUsato VARCHAR(45);

WITH MAT AS (SELECT CodLotto, sum(quantita) as somma
FROM Materiale M INNER JOIN Acquisto A
ON M.CodLotto = A.Lotto
Where A.Lavoro IN (SELECT CodLavoro
			FROM Progetto P INNER JOIN (SELECT CodLavoro,progetto FROM Lavoro L INNER JOIN StadioAvanzamento S ON L.Stadio = S.CodStadio) AS F
            ON P.CodProgetto = F.progetto
            WHERE P.CodProgetto = codice
			)
group by CodLotto)

SELECT Codlotto INTO MaterialeUsato
from MAT
where somma = (select Max(somma) from MAT);

RETURN MaterialeUsato;
END