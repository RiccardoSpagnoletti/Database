SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Area`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Area` (`CodArea`) VALUES ('Campania');
INSERT INTO `Area` (`CodArea`) VALUES ('Toscana');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Rischio`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Rischio` (`Data`, `Tipo`, `CoeffRischio`, `Area`) VALUES ('2022-05-23', 'Terremoto', 5.8, 'Toscana');
INSERT INTO `Rischio` (`Data`, `Tipo`, `CoeffRischio`, `Area`) VALUES ('2022-04-19', 'Alluvione', 7.1, 'Toscana');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Calamita`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Calamita` (`Data`, `Tipo`, `Latitudine`, `Longitudine`, `Intensita`, `Area`) VALUES ('2022-05-23 18:09:55', 'Terremoto', 42.5643567, 12.0142563, 3.5, 'Toscana');
INSERT INTO `Calamita` (`Data`, `Tipo`, `Latitudine`, `Longitudine`, `Intensita`, `Area`) VALUES ('2022-04-19 17:56:01', 'Alluvione', 40.5142378, 13.9051564, 5, 'Toscana');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Edificio`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Edificio` (`CodEdificio`, `Latitudine`, `Longitudine`, `Area`, `Criticita`) VALUES (1, 43.7212096, 10.3913083, 'Toscana', NULL);


COMMIT;


-- -----------------------------------------------------
-- Data for table `Piano`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Piano` (`Numero`, `Edificio`) VALUES (0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Vano`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Vano` (`CodVano`, `Lunghezza`, `Hmax`, `Larghezza`, `Impiego`, `Piano`, `Edificio`) VALUES (1, 200, 300, 800, 'Veranda', 0, 1);
INSERT INTO `Vano` (`CodVano`, `Lunghezza`, `Hmax`, `Larghezza`, `Impiego`, `Piano`, `Edificio`) VALUES (2, 600, 200, 400, 'Camera#1', 0, 1);
INSERT INTO `Vano` (`CodVano`, `Lunghezza`, `Hmax`, `Larghezza`, `Impiego`, `Piano`, `Edificio`) VALUES (3, 600, 300, 400, 'Camera#2', 0, 1);
INSERT INTO `Vano` (`CodVano`, `Lunghezza`, `Hmax`, `Larghezza`, `Impiego`, `Piano`, `Edificio`) VALUES (4, 200, 300, 400, 'Bagno', 0, 1);
INSERT INTO `Vano` (`CodVano`, `Lunghezza`, `Hmax`, `Larghezza`, `Impiego`, `Piano`, `Edificio`) VALUES (5, 300, 300, 400, 'Cucina', 0, 1);
INSERT INTO `Vano` (`CodVano`, `Lunghezza`, `Hmax`, `Larghezza`, `Impiego`, `Piano`, `Edificio`) VALUES (6, 500, 300, 400, 'Soggiorno', 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Muro`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (1, 0, 0, 200, 0, 1, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (2, 0, 0, 0, 800, 1, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (3, 0, 800, 200, 800, 1, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (4, 200, 0, 200, 400, 1, 2);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (5, 200, 400, 200, 800, 1, 3);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (6, 200, 0, 800, 0, 2, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (7, 200, 0, 200, 400, 2, 1);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (8, 800, 0, 800, 400, 2, 4);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (9, 200, 400, 800, 400, 2, 3);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (10, 200, 400, 800, 400, 3, 2);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (11, 200, 800, 800, 800, 3, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (12, 200, 400, 200, 800, 3, 1);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (13, 800, 400, 800, 800, 3, 6);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (14, 800, 0, 1000, 0, 4, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (15, 800, 400, 1000, 400, 4, 6);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (16, 800, 0, 800, 400, 4, 2);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (17, 1000, 0, 1000, 400, 4, 5);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (18, 1000, 0, 1300, 0, 5, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (19, 1000, 400, 1300, 400, 5, 6);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (20, 1000, 0, 1000, 400, 5, 4);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (21, 1300, 0, 1300, 400, 5, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (22, 800, 400, 1000, 400, 6, 4);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (23, 800, 800, 1300, 800, 6, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (24, 800, 400, 800, 800, 6, 3);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (25, 1300, 400, 1300, 800, 6, null);
INSERT INTO `Muro` (`CodMuro`, `xi`, `yi`, `xf`, `yf`, `Vano1`, `Vano2`) VALUES (26, 1000, 400, 1300, 400, 6, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PuntoAperto`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (350, 160, 100, 120, 'Finestra', 'NORD', 6);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (550, 160, 100, 120, 'Finestra', 'NORD', 6);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (500, 100, 100, 200, 'Porta', 'SUD', 9);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (500, 160, 200, 120, 'Finestra', 'SUD', 11);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (600, 100, 100, 200, 'Porta', 'OVEST', 13);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (300, 300, 130, 120, 'Finestra', 'OVEST', 2);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (200, 100, 100, 200, 'Porta', 'OVEST', 4);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (600, 100, 100, 200, 'Porta', 'OVEST', 5);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (900, 160, 150, 120, 'Finestra', 'NORD', 14);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (900, 100, 100, 200, 'Porta', 'SUD', 15);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (1150, 160, 180, 120, 'Finestra', 'NORD', 18);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (1150, 100, 100, 200, 'Porta', 'SUD', 19);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (1050, 160, 300, 120, 'Finestra', 'SUD', 23);
INSERT INTO `PuntoAperto` (`Px`, `Py`, `Lunghezza`, `Altezza`, `Tipo`, `Orientazione`, `Muro`) VALUES (600, 100, 100, 200, 'Porta', 'OVEST', 25);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Responsabile`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Responsabile` (`CodFiscale`, `Nome`, `Cognome`, `Compenso`) VALUES ('RSSMRA70A01H501S', 'Mario', 'Rossi', 1289.67);
INSERT INTO `Responsabile` (`CodFiscale`, `Nome`, `Cognome`, `Compenso`) VALUES ('RTYFYUIO6457FGHJ', 'Julie', 'Franciosi', 1560.78);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Progetto`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Progetto` (`CodProgetto`, `CodiceFiscale`, `Edificio`, `CostoProgetto`) VALUES (1, 'RSSMRA70A01H501S', 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `StadioAvanzamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `StadioAvanzamento` (`CodStadio`, `DataInizio`, `StimaFine`, `Progetto`) VALUES (1, '2022-11-01', '2022-11-21', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Lavoro`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Lavoro` (`CodLavoro`, `DataInizio`, `DataFine`, `OgettoLavoro`, `Vano`, `Stadio`, `Muro`) VALUES (1, '2022-11-01', '2022-11-03', 'Installazione Impianti', 5, 1, 20);
INSERT INTO `Lavoro` (`CodLavoro`, `DataInizio`, `DataFine`, `OgettoLavoro`, `Vano`, `Stadio`, `Muro`) VALUES (2, '2022-11-05', '2022-11-06', 'Coibentazione', 3, 1, 11);
INSERT INTO `Lavoro` (`CodLavoro`, `DataInizio`, `DataFine`, `OgettoLavoro`, `Vano`, `Stadio`, `Muro`) VALUES (3, '2022-11-10', '2022-11-17', 'Pitturazione', 3, 1, 20);
INSERT INTO `Lavoro` (`CodLavoro`, `DataInizio`, `OgettoLavoro`, `Vano`, `Stadio`, `Muro`) VALUES (4, '2022-05-01', 'Posizionamento Piastrelle', 6, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Operaio`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Operaio` (`CodFiscale`, `Nome`, `Cognome`, `PagaH`) VALUES ('HJKAFDTR3UUAGHPO', 'Jacob', 'Muraca', 5.48);
INSERT INTO `Operaio` (`CodFiscale`, `Nome`, `Cognome`, `PagaH`) VALUES ('AFGDTR34AFGCLMNN', 'Antonio', 'Trimonte', 6.40);
INSERT INTO `Operaio` (`CodFiscale`, `Nome`, `Cognome`, `PagaH`) VALUES ('FFGABGH78ALKMGGF', 'Filippo', 'Filippi', 7.12);
INSERT INTO `Operaio` (`CodFiscale`, `Nome`, `Cognome`, `PagaH`) VALUES ('AFGC45POLKMIARDG', 'Alessio', 'Garzi', 7.66);
INSERT INTO `Operaio` (`CodFiscale`, `Nome`, `Cognome`, `PagaH`) VALUES ('ALPO30AGHZIOQRAG', 'Andrea', 'Polli', 5.90);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Turno`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-01', 6, 'Rompere Muro', 'HJKAFDTR3UUAGHPO', 1);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-01', 6, 'Rompere Muro', 'AFGDTR34AFGCLMNN', 1);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-02', 5, 'Inserimento Tubi', 'ALPO30AGHZIOQRAG', 1);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-02', 1, 'Applicazione Cemento', 'AFGC45POLKMIARDG', 1);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-03', 1, 'Applicazione Stucco', 'HJKAFDTR3UUAGHPO', 1);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-03', 5, 'Tinteggiare Muro', 'ALPO30AGHZIOQRAG', 1);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-03', 5, 'Tinteggiare Muro', 'FFGABGH78ALKMGGF', 1);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-05', 6, 'Levigare Muro', 'AFGDTR34AFGCLMNN', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-05', 6, 'Levigare Muro', 'FFGABGH78ALKMGGF', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-05', 6, 'Levigare Muro', 'HJKAFDTR3UUAGHPO', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-05', 6, 'Levigare Muro', 'AFGC45POLKMIARDG', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-05', 6, 'Levigare Muro', 'ALPO30AGHZIOQRAG', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-06', 3, 'Applicazione Colla', 'HJKAFDTR3UUAGHPO', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-06', 3, 'Applicazione Colla', 'FFGABGH78ALKMGGF', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-06', 3, 'Applicazione Colla', 'AFGDTR34AFGCLMNN', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-06', 3, 'Applicazione Pannelli', 'AFGC45POLKMIARDG', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-06', 3, 'Applicazione Pannelli', 'ALPO30AGHZIOQRAG', 2);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-10', 4, 'Applicazione Stucco', 'HJKAFDTR3UUAGHPO', 3);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-10', 4, 'Applicazione Stucco', 'AFGDTR34AFGCLMNN', 3);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-10', 4, 'Applicazione Stucco', 'FFGABGH78ALKMGGF', 3);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-10', 4, 'Applicazione Stucco', 'AFGC45POLKMIARDG', 3);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-10', 4, 'Applicazione Stucco', 'ALPO30AGHZIOQRAG', 3);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-17', 5, 'Tinteggiare Muro', 'AFGC45POLKMIARDG', 3);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-17', 5, 'Tinteggiare Muro', 'AFGDTR34AFGCLMNN', 3);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-11-17', 5, 'Tinteggiare Muro', 'ALPO30AGHZIOQRAG', 3);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-05-23', 6, 'Applicazione Colla', 'AFGDTR34AFGCLMNN', 4);
INSERT INTO `Turno` (`Data`, `OraTot`, `Mansione`, `CodiceFiscale`, `CodiceLavoro`) VALUES ('2022-05-23', 6, 'Apllicazione Piastrelle', 'FFGABGH78ALKMGGF', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CapoCantiere`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `CapoCantiere` (`CodFiscale`, `Nome`, `Cognome`, `PagaH`, `MaxOperai`) VALUES ('SPGLDI339HJAPJJQ', 'Domenico', 'Spagnoletti', 10.09, 10);
INSERT INTO `CapoCantiere` (`CodFiscale`, `Nome`, `Cognome`, `PagaH`, `MaxOperai`) VALUES ('SPGMLLATGOQPGD2A', 'Riccardo', 'Spagnoletti', 12.09, 8);
INSERT INTO `CapoCantiere` (`CodFiscale`, `Nome`, `Cognome`, `PagaH`, `MaxOperai`) VALUES ('YTGATDRE132087GY', 'Yohanna', 'Molinario', 15.08, 13);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Materiale`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('LI237309', 3.80);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('LI972351', 1.79);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('LO234789', 3.12);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('LJ808265', 9.10);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('LG098216', 12.99);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('LI054277', 0.99);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('LK592760', 1.27);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('L7651900', 25.3);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('U7856343', 8.99);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('X8912343', 2.18);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('F8912803', 3.99);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('F5467821', 5.99);
INSERT INTO `Materiale` (`CodLotto`, `CostoUnita`) VALUES ('XD547130', 23.45);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Mattone`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Mattone` (`Composizione`, `x`, `y`, `z`, `Alveolatura`, `Lotto`) VALUES ('In Cemento', 25, 12, 6, 'Forato', 'LI972351');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Piastrella`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Piastrella` (`tipo`, `Lati`, `Disegno`, `x`, `y`, `z`, `Lotto`) VALUES ('Porcellanato', 4, 'Assente', 20, 20, 2, 'LG098216');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Intonaco`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Intonaco` (`Tipo`, `Lotto`) VALUES ('Protettivo', 'LK592760');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pietra`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Pietra` (`Tipo`, `x`, `y`, `z`, `Lotto`) VALUES ('Quarzite', 50, 60, 4, 'LJ808265');

COMMIT;


-- -----------------------------------------------------
-- Data for table `MaterialeNR`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Cemento Portland', NULL, NULL, NULL, 'LI237309');
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Cemento pozzolanico', NULL, NULL, NULL, 'LO234789');
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Sabbia', NULL, NULL, NULL, 'LI054277');
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Colla', NULL, NULL, NULL, 'X8912343');
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Tubo', 10, 15, 9, 'U7856343');
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Pannello ', 80, 60, 8, 'L7651900');
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Pittura', NULL, NULL, NULL, 'F8912803');
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Pittura Antimuffa', NULL, NULL, NULL, 'F5467821');
INSERT INTO `MaterialeNR` (`Info`, `x`, `y`, `z`, `Lotto`) VALUES ('Acciaio', 100, 50, 10, 'XD547130');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Sensore`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Sensore` (`CodSensore`, `Soglia`, `Tipo`, `x`, `y`, `z`, `Vano`) VALUES (1001, 34, 'Temperatura', 90, 100, 0, 1);
INSERT INTO `Sensore` (`CodSensore`, `Soglia`, `Tipo`, `x`, `y`, `z`, `Vano`) VALUES (3455, 90, 'Umidita', 10, 150, 0, 1);
INSERT INTO `Sensore` (`CodSensore`, `Soglia`, `Tipo`, `x`, `y`, `z`, `Vano`) VALUES (1002, 34, 'Temperatura', 90, 100, 0, 6);
INSERT INTO `Sensore` (`CodSensore`, `Soglia`, `Tipo`, `x`, `y`, `z`, `Vano`) VALUES (7712, 0.04, 'Accelerometro', 10, 20, 30, 5);
INSERT INTO `Sensore` (`CodSensore`, `Soglia`, `Tipo`, `x`, `y`, `z`, `Vano`) VALUES (5541, 0.04, 'Giroscopio', 100, 150, 30, 2);
INSERT INTO `Sensore` (`CodSensore`, `Soglia`, `Tipo`, `x`, `y`, `z`, `Vano`) VALUES (4564, 2, 'Allagamento', 65, 2, 0, 4);
INSERT INTO `Sensore` (`CodSensore`, `Soglia`, `Tipo`, `x`, `y`, `z`, `Vano`) VALUES (1003, 34, 'Temperatura', 90, 100, 0, 3);
INSERT INTO `Sensore` (`CodSensore`, `Soglia`, `Tipo`, `x`, `y`, `z`, `Vano`) VALUES (3456, 90, 'Umidita', 80, 100, 0, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Misura`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-07-11 20:01:44', 30, null, null, 1001);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-11-12 11:21:43', 85, null, null, 3455);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-01-15 09:16:10', 3, null, null, 4564);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-09-07 06:12:33', 0.02, 0.02, 0.02, 7712);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-07-11 02:12:54', 27, null, null, 1002);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-02-20 06:56:22', 94, null, null, 3455);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-05-23 12:16:59', 0.01, 0.01, 0.01, 5541);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-01-09 18:47:00', 1, null, null, 4564);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-07-11 08:50:43', 27, null, null, 1003);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-06-15 05:45:23', 38, null, null, 1001);
INSERT INTO `Misura` (`Timestamp`, `x`, `y`, `z`, `Sensore`) VALUES ('2022-11-11 15:32:21', 80, null, null, 3456);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Alert`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Alert` (`Timestamp`, `Sensore`) VALUES ('2022-01-15 09:16:10', 4564);
INSERT INTO `Alert` (`Timestamp`, `Sensore`) VALUES ('2022-02-20 06:56:22', 3455);
INSERT INTO `Alert` (`Timestamp`, `Sensore`) VALUES ('2022-06-15 05:45:23', 1001);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Direzione`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Direzione` (`CodiceFiscale`, `Lavoro`) VALUES ('SPGMLLATGOQPGD2A', 1);
INSERT INTO `Direzione` (`CodiceFiscale`, `Lavoro`) VALUES ('SPGLDI339HJAPJJQ', 2);
INSERT INTO `Direzione` (`CodiceFiscale`, `Lavoro`) VALUES ('SPGLDI339HJAPJJQ', 3);
INSERT INTO `Direzione` (`CodiceFiscale`, `Lavoro`) VALUES ('YTGATDRE132087GY', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Acquisto`
-- -----------------------------------------------------
START TRANSACTION;
USE `PBD`;
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('U7856343', 1, 'Siderurgica Pisana Srl', '2022-11-01', 7);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('LI972351', 1, 'Colabeton S.R.L.', '2022-11-01', 25);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('LK592760', 1, 'ITCEA', '2022-11-01', 0.5);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('X8912343', 2, 'Bricoman', '2022-11-04', 1.5);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('L7651900', 2, 'Bricoman', '2022-11-04', 20);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('LK592760', 2, 'ITCEA', '2022-11-04', 10);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('F5467821', 2, 'Centrocolor S.A.S.', '2022-11-04', 10);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('F5467821', 1, 'Centrocolor S.A.S.', '2022-11-01', 1.2);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('F8912803', 3, 'Idea Colore s.r.l.', '2022-11-02', 8);
INSERT INTO `Acquisto` (`Lotto`, `Lavoro`, `Fornitore`, `DataAcquisto`, `Quantita`) VALUES ('LG098216', 4, 'Bricoman', '2022-05-02', 7);

COMMIT;

