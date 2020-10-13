/* DB SEED */
INSERT INTO PostAdresse
    (PostNr, Poststed)
VALUES
    (1324, 'Lysaker'),
    (1370, 'Asker'),
    (1500, 'Moss'),
    (3100, 'Tønsberg'),
    (5000, 'Bergen');

INSERT INTO KundeType
    (KundeTypeNavn, Beskrivelse)
VALUES
    ('Agent', 'No Description'),
    ('Rederi', 'No Description'),
    ('Megler', 'No Description');

/*DBCC CHECKIDENT ('Kunde', RESEED, 999);*/

INSERT INTO Kunde
    (FirmaNavn, KundeTypeNavn, TelefonNr, Epost, Adresse, PostNr)
VALUES
    ('Maersk Norge AS', 'Agent', '44455577', 'maersk@mersk.com', 'Bryggekanten 4', 1324),
    ('V Ships Norway AS', 'Rederi', '11223344', 'Vships@vshipsnorway.no', 'Sjøveien 8', 1370),
    ('Viking International Transport og Spedition AS', 'Megler', '12123434', 'info@vits.no', 'Fjordgaten 11', 1500),
    ('Blue Water Shipping AS', 'Megler', '33445566', 'info@bluewater.com', 'Strandpromenaden 32', 1324),
    ('Glander International Bunkering (Norway) AS', 'Megler', '87654321', 'contact@glanderbunkering.com', 'Torget 1', 5000),
    ('Western Bulk Carriers AS', 'Agent', '45556575', 'info@westernbulk.no', 'havnegata 7', 3100);




INSERT INTO KontaktPerson
    (KundeNr, Etternavn, Fornavn, Tittel, MobilNr, Epost)
VALUES
    (1000, 'Jansen', 'Jan', 'CEO', '11223344', 'jan.jansen@maersk.com'),
    (1001, 'Bull', 'Ole', 'Head of sales', '99887766', 'ole.bull@vshipsnorway.no'),
    (1002, 'Hansen', 'Anette', 'CEO', '55455545', 'anette@vits.no'),
    (1003, 'Johansen', 'Arild', '', '90807060', 'arild@vits.no'),
    (1004, 'Olsen', 'Marit', '', '65654545', 'maritolsen@bluewater.com'),
    (1005, 'Karlsen', 'Karl', '', '83756758', 'karl@landerbunkering.com'),
    (1005, 'Dahl', 'Eira', '', '98987878', 'dahl@westernbulk.no');

INSERT INTO Kunde_KundeType
    (KundeNr, KundeTypeNavn)
VALUES
    (1001, 'Megler'),
    (1002, 1),
    (1003, 2),
    (1003, 1),
    (1004, 2),
    (1005, 1);
