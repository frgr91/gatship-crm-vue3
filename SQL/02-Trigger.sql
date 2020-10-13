SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[t_insert_kundetypeantall]
   ON  [dbo].[Kunde]
   AFTER INSERT
AS 
BEGIN
    SET NOCOUNT ON;
    DECLARE @KundeNr int;
    DECLARE @KundeType varchar(50);
    SELECT @KundeNr = KundeNr, @KundeType = KundeTypeNavn
    FROM INSERTED;
    INSERT INTO kundetypeantall
        (KundeNr, KundeTypeNavn)
    VALUES
        (@KundeNr, @KundeType);
END
GO