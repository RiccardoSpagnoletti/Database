CREATE DEFINER=`root`@`localhost` PROCEDURE `ElencoLavori`()
BEGIN

	DECLARE AVGCompenso DECIMAL (10,2);
    DECLARE AVGAreaEdificio DECIMAL (10,2);
    DECLARE AVGAreaPiano DECIMAL (10,2);
    DECLARE AVGAreaVano DECIMAL (10,2);
    DECLARE AVGIntonaco DECIMAL (10,2);
	DECLARE AVGPiastrella DECIMAL (10,2);
    DECLARE TOTVani INT;

	DROP TABLE IF EXISTS ElencoLavori;
	CREATE TEMPORARY TABLE IF NOT EXISTS ElencoLavori (
	Correlato VARCHAR (45) NOT NULL,
    Nome VARCHAR (45) NOT NULL,
    Costo DECIMAL (10,2),
    PRIMARY KEY (Nome)
);
TRUNCATE TABLE ElencoLavori;

SET AVGCompenso = (SELECT AVG(Compenso) FROM Responsabile);
SET AVGAreaEdificio = (SELECT AVG(AreaEdificio(CodEdificio)) FROM Edificio); 
SET AVGIntonaco =(SELECT AVG(CostoUnita) FROM Intonaco INNER JOIN Materiale ON Lotto = CodLotto);
SET TOTVani = (Select AVG(CodVano) FROM (SELECT count(CodVano) AS CodVano FROM Vano GROUP BY Edificio) AS D);
SET AVGAreaPiano = (SELECT AVG(AreaPiano(Numero,Edificio)) FROM Piano);
SET AVGPiastrella = (SELECT AVG(CostoUnita) FROM Piastrella INNER JOIN Materiale ON Lotto = CodLotto);
SET AVGAreaVano = (SELECT AVG(AreaVano(CodVano)) FROM Vano);


-- Considero il sopralluogo svolto esclusivamente da un responsabile al quale verrà affidato l'incarico di verificare eventuali interventi  inizialmente non necessari--
-- Essendo il prezzo del responsabile presupposto costante considero una media del Compenso dei responsabili registrati --


INSERT INTO ElencoLavori 
VALUES ('Controlli Ordinari','Sopralluogo',AVGCompenso);

-- Il costo in previsione dell'esistenza di lavori non ancora aggiunti viene in generale bastato su una media prezzo per metro quadro --
-- Ogni lavoro sarà connesso ai Consigli di intervento espressi tramite il sistema di calssificazione di 'StatoEdificio' -- 



INSERT INTO ElencoLavori 
VALUES ('Suggerita Demolizione','Demolizione',AVGAreaEdificio*15.65);


INSERT INTO ElencoLavori 
VALUES ('Manutenzione','Applicazione Intonaco', AVGIntonaco*AVGAreaVano),
	   ('Manutenzione','Coibentazione',AVGAreaEdificio*80), 
	   ('Manutenzione','Nuove Finestre PVC',TOTVani*153.78), -- Media di 1 finestra per vano -- 
	   ('Manutenzione','Controsoffitto',AVGAreaPiano*43.4); 
       

INSERT INTO ElencoLavori 
VALUES ('Ristrutturazione immediata','Sostituzione Pavimentazione',AVGPiastrella*AVGAreaVano),
	   ('Ristrutturazione immediata','Sostituzione Impiano Idraulico',TOTVani*2500),
	   ('Ristrutturazione immediata','Sostituzione Impianto Elettrico',AVGAreaVano*50),
	   ('Ristrutturazione immediata','Rinforzo Fondamenta',AVGAreaPiano*187.9);
       
END