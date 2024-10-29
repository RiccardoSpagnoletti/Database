CREATE DEFINER=`root`@`localhost` PROCEDURE `Inserimento_Turno`(IN CFO VARCHAR(45),IN DataLavoro DATE ,IN CLavoro INT,IN MLavoro VARCHAR(45), IN OreLavoro INT)
BEGIN

-- Impostazione Iniziale Turno da max 6 ore --

DECLARE NoperaiMAX INT;

IF OreLavoro > 6 OR OreLavoro <= 0 THEN    
  signal sqlstate "45000" 
   set message_text = "Le ore lavorative per giorno sono della durata massima di 6 e minima di 1";
END IF;

SET NoperaiMAX = (SELECT SUM(MaxOperai) FROM Direzione D INNER JOIN Capocantiere C ON C.COdFiscale = D.CodiceFiscale WHERE Lavoro = CLavoro);

IF NoperaiMAX = (SELECT COUNT(DISTINCT CodiceFiscale) FROM Turno WHERE CodiceLavoro = CLavoro AND Data = DataLavoro) THEN
  signal sqlstate "45000" 
   set message_text = "Numero massimo di operai già registrati raggiunto nella data indicata";
END IF;

INSERT INTO Turno 
	VALUES (DataLavoro, OreLavoro, MLavoro, CFO, CLavoro);

END