CREATE DEFINER=`root`@`localhost` PROCEDURE `StatoEdificio`()
BEGIN
-- RTE ha uin valore di base di 3.03 di base ma può variare in correlazione al materiale più utilizzato --

DECLARE RTE decimal (5,2) DEFAULT 6.03;
DECLARE RTEmattone decimal (5,2) DEFAULT 5.08;
DECLARE RTEcementoportland decimal (5,2) DEFAULT 3.43;
DECLARE RTEcementopozzolaico decimal (5,2) DEFAULT 3.56;
DECLARE RTEacciaio decimal (5,2) DEFAULT 0.89;


DROP TABLE IF EXISTS StatoEdificio;
CREATE TEMPORARY TABLE IF NOT EXISTS StatoEdificio (
	IDEdificio INT NOT NULL,
    Punteggio double (5,2),
    Stato VARCHAR(45) default null,
    Materiale VARCHAR(45),
    Data INT,
    Consiglio VARCHAR(45) default NULL,
    PRIMARY KEY (IDEdificio)
	
);
TRUNCATE TABLE StatoEdificio;

INSERT INTO StatoEdificio (IDEdificio, Materiale, Data)
SELECT  CodEdificio,LottoMPU(CodEdificio), DataMPU(CodEdificio)
FROM edificio E INNER JOIN Progetto P
ON E.CodEdificio = P.edificio;

UPDATE StatoEdificio
SET Punteggio = CASE WHEN Materiale = 'LI972351' THEN (100 - RTEmattone*(Year(current_date())-Data))-NumeroCriticita(IDEdificio)*0.5
				 WHEN Materiale = 'LI237309' THEN (100 - RTEcementoportland*(Year(current_date())-Data))-NumeroCriticita(IDEdificio)*0.5
                 WHEN Materiale = 'LO234789' THEN (100 - RTEcementopozzolaico*(Year(current_date())-Data))-NumeroCriticita(IDEdificio)*0.5
                 WHEN Materiale = 'XD547130' THEN (100 - RTEacciaio*(Year(current_date())-Data))-NumeroCriticita(IDEdificio)*0.5
                 WHEN Materiale <> 'LI972351' 
						  AND Materiale <> 'LI237309' 
						  AND Materiale <> 'LO234789' 
						  AND Materiale <> 'XD547130' THEN 100 - RTE*(Year(current_date())-Data)- NumeroCriticita(IDEdificio)*0.5
                END;

 UPDATE StatoEdificio               
set Consiglio = CASE WHEN Punteggio = 100 THEN 'Nessuno'
				 WHEN Punteggio >= 90 AND Punteggio < 100 THEN 'Controlli Ordinari'
                 WHEN Punteggio >= 70 AND Punteggio < 90  THEN 'Manutenzione'
                 WHEN Punteggio >50 AND Punteggio < 70 THEN 'Ristrutturazione immediata'
                 WHEN Punteggio < 50 THEN 'Suggerita Demolizione'
						END;

UPDATE StatoEdificio                    
set Stato   =	CASE WHEN Punteggio = 100 THEN 'Perfetto'
				 WHEN Punteggio >= 90 AND Punteggio < 100 THEN 'Ottime Condizioni'
                 WHEN Punteggio >= 65 AND Punteggio < 90  THEN 'Abitabile'
                 WHEN Punteggio >50 AND Punteggio < 65 THEN 'Pericolante'
                 WHEN Punteggio < 50 THEN 'Critico'
						END;

ALTER TABLE StatoEdificio
DROP COLUMN Data;

ALTER TABLE StatoEdificio
DROP COLUMN Materiale;

END