/* UPDATE ON KundeType*/
/* SUCCESS ON 05.10.2020 */
INSERT INTO KundeType
    (KundeTypeNavn, Beskrivelse)
VALUES('Rederi', 'Beskrivelse av et rederi');
INSERT INTO PostNummer
    (PostNr, PostSted)
VALUES
    (3179, 'Åsgårdstrand');
SELECT *
FROM KundeType;

UPDATE KundeType SET KundeTypeNavn='test' WHERE KundeTypeNavn='Agent';
SELECT *
FROM KundeType;
SELECT *
FROM Kunde;
SELECT *
FROM KundeTypeAntall;

UPDATE KundeType SET KundeTypeNavn='Agent' WHERE KundeTypeNavn='test';



/* UPDATE ON PostNummer */
/* SUCCESS ON 05.10.2020 */
INSERT INTO PostNummer
    (PostNr, PostSted)
VALUES
    (3179, 'Åsgårdstrand');

INSERT INTO Kunde
    (KundeTypeNavn, FirmaNavn, TelefonNr, Epost, Adresse, HusNr, PostNr)
VALUES
    ('Agent', 'Ukjent', 99999999, 'ukjent@ukjent.no', 'Grevwedelsgate', 9, 3179);

INSERT INTO PostAdresse
    (KundeNr, Adresse, HusNr, PostNr)
VALUES
    (1001, 'Bryggekanten', 4, 3179);

SELECT *
FROM PostAdresse;
SELECT *
FROM PostNummer;
SELECT *
FROM Kunde;

UPDATE PostNummer SET PostNr='3178', PostSted='Våle' WHERE PostNr='1500';
UPDATE PostNummer SET PostNr='3179', PostSted='Åsgårdstrand' WHERE PostNr='5000';

/* UPDATE ON Kunde */
INSERT INTO Kunde
    (KundeTypeNavn, FirmaNavn, TelefonNr, Epost, Adresse, HusNr, PostNr)
VALUES
    ('Agent', 'Ukjent', 99999999, 'ukjent@ukjent.no', 'Grevwedelsgate', 9, 3179);

UPDATE Kunde SET PostNr='3178' WHERE KundeNr='1000';