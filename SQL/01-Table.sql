DROP TABLE IF EXISTS PostAdresse, KontaktPerson, Kunde_KundeType, KundeKontakt, Kunde, KundeType;

CREATE TABLE [KundeType]
(
  [Id] Int IDENTITY(1,1) ,
  [KundeTypeNavn] Varchar(30) PRIMARY KEY,
  [Beskrivelse] Varchar(50)
);

CREATE TABLE [PostAdresse]
(
  [PostNr] Int PRIMARY KEY,
  [Poststed] Varchar(50)
);

CREATE TABLE [Kunde]
(
  [KundeNr] Int IDENTITY(1000, 1) PRIMARY KEY,
  [KundeTypeNavn] Varchar(30),
  [FirmaNavn] Varchar(50) NOT NULL,
  [TelefonNr] Int,
  [Epost] Varchar(50) NOT NULL,
  [Adresse] Varchar(50),
  [PostNr] Int
    CONSTRAINT fk_kunde_postnr FOREIGN KEY (PostNr)
  REFERENCES PostAdresse(PostNr)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
  CONSTRAINT fk_kunde_KundeType FOREIGN KEY (KundeTypeNavn)
  REFERENCES KundeType(KundeTypeNavn)
  ON DELETE NO ACTION
  ON UPDATE CASCADE
);

CREATE TABLE [Kunde_KundeType]
(
  [Id] Int IDENTITY(1,1),
  [KundeNr] Int,
  [KundeTypeNavn] Varchar(30)
    CONSTRAINT fk_Kunde_KundeType_kundenr FOREIGN KEY (KundeNr)
  REFERENCES Kunde(KundeNr)
  ON DELETE CASCADE,
  CONSTRAINT fk_Kunde_KundeType_KundeType FOREIGN KEY (KundeTypeNavn)
  REFERENCES KundeType(KundeTypeNavn)
  ON DELETE NO ACTION
  ON UPDATE CASCADE
);

ALTER TABLE Kunde_KundeType
  ADD CONSTRAINT uq_Kunde_KundeType UNIQUE(KundeNr, KundeTypeNavn);

CREATE TABLE [KontaktPerson]
(
  [id] Int IDENTITY (1,1),
  [KundeNr] Int,
  [Etternavn] Varchar(50) NOT NULL,
  [Fornavn] Varchar(50) NOT NULL,
  [Tittel] Varchar(50),
  [MobilNr] Int,
  [Epost] Varchar(50) NOT NULL
    CONSTRAINT fk_kontaktperson FOREIGN KEY (KundeNr) 
        REFERENCES Kunde(KundeNr)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

/* TRIGGER ON INSERT */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[t_insert_Kunde_KundeType]
   ON  [dbo].[Kunde]
   AFTER INSERT
AS 
BEGIN
  SET NOCOUNT ON;
  DECLARE @KundeNr Int;
  DECLARE @KundeType Varchar(30);
  SELECT @KundeNr = KundeNr, @KundeType = KundeTypeNavn
  FROM INSERTED;
  INSERT INTO Kunde_KundeType
    (KundeNr, KundeTypeNavn)
  VALUES
    (@KundeNr, @KundeType);
END
GO

/* TIGGER ON UPDATE */

CREATE TRIGGER [dbo].[t_update_Kunde_KundeType]
   ON  [dbo].[Kunde]
   AFTER UPDATE
AS 
BEGIN
  SET NOCOUNT ON;
  DECLARE @KundeNr Int;
  DECLARE @KundeType Varchar(30);
  SELECT @KundeNr = KundeNr, @KundeType = KundeTypeNavn
  FROM INSERTED;
  UPDATE Kunde_KundeType
  SET KundeTypeNavn=@KundeType
  WHERE KundeNr=@KundeNr;
END
GO