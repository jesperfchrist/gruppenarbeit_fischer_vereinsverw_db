-- ÜBUNGSBLATT 3 VON MAURICE HAKAN YIGITBASI UND JESPER CHRIST
use FerienHausVermietung1;
-- 1.
CREATE TABLE PreiseXX (
  Preisschl tinyint PRIMARY KEY auto_increment,
  Ort char (20) NOT NULL,
  Kategorie char (10) NOT NULL,
  Tagespreis int NOT NULL,
  Wochenpreis int NOT NULL
);
-- 2.
ALTER TABLE PreiseXX
ADD INDEX (Kategorie);
-- 3.
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (1, 'Hinterthal', 'Einfach', 120, 650);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (2, 'Hinterthal', 'Luxus', 300, 1800);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (3, 'Hinterthal', 'Standard', 200, 1100);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (4, 'Zell', 'Einfach', 90, 500);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (5, 'Zell', 'Luxus', 200, 1000);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (6, 'Zell', 'Standard', 130, 700);
-- 4.
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (7, 'Mayrhofen', 'Luxus', 400, 2200);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (8, 'Mayrhofen', 'Luxus', 300, 1800);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (9, 'Kaltenbach', 'Standard', 180, 1000);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (10, 'Kaltenbach', 'Einfach', 90, 490);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (11, 'Fügen', 'Luxus', 200, 1000);
insert into PreiseXX (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  )
values (12, 'Fügen', 'Standard', 130, 700);
-- 5.
UPDATE PreiseXX
SET Wochenpreis = Wochenpreis * 1.10
WHERE Kategorie = "Luxus";
-- 6.
SELECT *
FROM PreiseXX;
-- 7.
SELECT MieterNr,
  FHaus,
  Mietbeginn,
  Mietende
FROM Vermietung;
-- 8. 
SELECT FHaus,
  MieterNr,
  Mietbeginn,
  Mietende
FROM Vermietung;
-- 9.
SELECT DISTINCT Ort
FROM Preise;
-- 10.
SELECT *
FROM Vermietung
WHERE Mietbeginn > "2007-01-01";
-- 11.
SELECT *
FROM Vermietung
WHERE Mietbeginn BETWEEN "2007-01-01" AND "2007-09-01";
-- 12.
SELECT *
FROM Vermietung
WHERE Mietbeginn BETWEEN "2007-07-01" AND "2007-08-31"
  AND Mietende BETWEEN "2007-07-01" AND "2007-08-31";
-- 13.
SELECT *
FROM Vermietung
WHERE bezahlt = FALSE;
-- 14.
SELECT *
FROM Haus
  INNER JOIN Preise ON Haus.Preisschl = Preise.Preisschl
WHERE Kategorie IN ("Standard", "Luxus");
-- 15. 
SELECT Wochenpreis,
  Tagespreis,
  FHaus
FROM Haus
  INNER JOIN Preise ON Haus.Preisschl = Preise.Preisschl
WHERE Kategorie = "Standard";
-- 16.
SELECT Name,
  Telefon
FROM Mieter
WHERE Ort = "Berlin";
-- 17.
SELECT *
FROM Haus
WHERE AnzZimmer = 3
  AND Fläche >= 45;
-- 18.
SELECT *
FROM Mieter
WHERE PLZ REGEXP '^[12]';
-- 19.
SELECT count('FHaus')
FROM Haus;
-- 20.
SELECT count('FHaus')
FROM Haus
WHERE 'AnzZimmer' = 4;
-- 21.
SELECT sum('Betrag')
FROM Vermietung;
-- 22.
SELECT avg('Betrag')
FROM Vermietung;
-- 23.
SELECT min('Betrag') AS "kleinster Betrag",
  max('Betrag') AS "groesster Betrag"
FROM Vermietung;
-- 24.
SELECT avg('Flaeche')
FROM Haus
GROUP BY 'AnzZimmer';
-- 25.
SELECT MieterNr,
  count('VNr')
FROM Vermietung
GROUP BY 'MieterNr';
-- 26.
SELECT Mieter.Name AS Name,
  sum(Vermietung.Betrag)
FROM Vermietung,
  Mieter
WHERE Mieter.MieterNr = Vermietung.MieterNr
GROUP BY Mieter.Name,
  Vermietung.FHaus;
-- 27.
SELECT v.MieterNr,
  v.Summe
FROM (
    SELECT MieterNr,
      sum(Betrag) AS Summe,
      count(*) AS anzahl
    FROM Vermietung
    GROUP BY MieterNr
  ) AS v
WHERE v.anzahl > 1;
-- 28.
SELECT Preise.Kategorie,
  Haus.Flaeche,
  Haus.FHaus,
  Preise.Wochenpreis,
  Preise.Tagespreis
FROM Haus,
  Preise
WHERE Haus.Flaeche >= 50
  AND Preise.Kategorie = "Luxus"
  AND Haus.Preisschl = Preise.Preisschl;
-- 29.
SELECT a.'Ort',
  b.'FHaus',
  b.'Preisschl'
FROM Preise a,
  Haus b
WHERE a.'Ort' = "Hinterthal"
  AND b.'Preisschl' BETWEEN 1 AND 3
GROUP BY b.'FHaus';
-- 30.
SELECT Vermietung.*
FROM Vermietung
  JOIN Haus ON Vermietung.FHaus = Haus.FHaus
  JOIN Preise ON Haus.Preisschl = Preise.Preisschl
WHERE Vermietung.Betrag % Preise.Wochenpreis = 0;
-- 31.
SELECT Mieter.MieterNr AS Mieternummer
FROM Mieter,
  Haus,
  Vermietung
WHERE Haus.AnzZimmer = 3
  AND Mieter.MieterNr = Vermietung.MieterNr
  AND Haus.FHaus = Vermietung.FHaus
GROUP BY Mieter.MieterNr;
-- 32.
SELECT DISTINCT Vermietung.MieterNr,
  Vermietung.bezahlt
FROM Mieter,
  Haus,
  Vermietung
WHERE Vermietung.bezahlt = 0
  AND Vermietung.MieterNr = Mieter.MieterNr;
-- 33.
SELECT Vermietung.MieterNr,
  Vermietung.Anzahlung
FROM Vermietung
WHERE Vermietung.Anzahlung = 0
GROUP BY Vermietung.MieterNr;
-- 34.
SELECT Haus.FHaus,
  Preise.Wochenpreis,
  Preise.Tagespreis
FROM Preise,
  Haus
WHERE Preise.Wochenpreis < Preise.Tagespreis * 7 * 0.8
  AND Preise.Preisschl = Haus.Preisschl;
-- 35.
SELECT Haus.FHaus AS Haus,
  Preise.Wochenpreis
FROM Preise,
  Vermietung,
  Haus
WHERE Haus.Preisschl = Preise.Preisschl
  AND Haus.FHaus = Vermietung.FHaus
  AND Preise.Wochenpreis > (
    SELECT avg(Preise.Wochenpreis)
    FROM Preise
  )
GROUP BY Haus.FHaus;
-- 36.
SELECT DISTINCT Mieter.Name
FROM (
    SELECT Haus.*
    FROM Haus
      JOIN Preise ON Haus.Preisschl = Preise.Preisschl
    WHERE Preise.Wochenpreis > (
        SELECT avg(Wochenpreis) as Wochenpreis
        FROM Preise
      )
  ) AS Haus
  JOIN Vermietung ON Haus.FHaus = Vermietung.FHaus
  JOIN Mieter ON Vermieter.MieterNr = Mieter.MieterNr;
-- 37.
SELECT Haus.FHaus
from Vermietung,
  Haus,
  Preise
WHERE Vermietung.FHaus = Haus.FHaus
  AND Haus.Preisschl = Preise.Preisschl
  AND Preise.Ort = 'Hinterthal'
  AND Haus.FHaus in (
    SELECT FHaus
    from Vermietung
    WHERE NOT CURRENT_DATE() BETWEEN Vermietung.Mietbeginn AND Vermietung.Mietende
  )
GROUP BY Haus.FHaus;
-- 38.
SELECT MieterNr,
  COUNT(MieterNr),
  FHaus,
  COUNT(FHaus)
FROM Vermietung
GROUP BY MieterNr,
  FHaus
HAVING (COUNT(MieterNr) > 1)
  AND (COUNT(FHaus) > 1);
-- 39.
SELECT DISTINCT A.MieterNr AS Mieter1,
  B.MieterNr AS Mieter2,
  A.Betrag
FROM Vermietung A,
  Vermietung B
WHERE A.MieterNr <> B.MieterNr
  AND A.Betrag = B.Betrag
GROUP BY A.Betrag;
-- 40.
INSERT INTO Haus(FHaus, AnzZimmer, Flaeche, Preisschl)
VALUES("Peter", 4, 120, 6);
-- 41.
INSERT INTO Mieter(MieterNr, Name, PLZ, Ort, Strasse, Telefon)
VALUES(
    7,
    "Hanke",
    12685,
    "Berlin",
    "Frankfurtstrasse 69",
    01711488235
  );
-- 42.
SELECT Mieter.Name,
  Vermietung.VNr
FROM Mieter
  LEFT JOIN Vermietung ON Mieter.MieterNr = Vermietung.MieterNr;
-- 43.
SELECT Haus.*
FROM Haus
  LEFT JOIN Vermietung ON Haus.FHaus = Vermietung.FHaus
WHERE Vermietung.FHaus IS NULL;
-- 44.
SELECT h.*
FROM Haus AS h
  LEFT JOIN (
    SELECT *
    FROM Vermietung
    WHERE Mietbeginn BETWEEN STR_TO_DATE('01.09.2007', '%e.%m.%Y') AND STR_TO_DATE('30.09.2007', '%e.%m.%Y')
      OR Mietende BETWEEN STR_TO_DATE('01.09.2007', '%e.%m.%Y') AND STR_TO_DATE('30.09.2007', '%e.%m.%Y')
  ) AS v ON h.FHaus = v.FHaus
WHERE v.FHaus IS NULL;
-- 45.
SELECT Vermietung.FHaus,
  Mieter.Name
FROM Vermietung,
  Mieter
WHERE Mieter.MieterNr = Vermietung.MieterNr
GROUP BY Vermietung.FHaus,
  Vermietung.Mietbeginn;
-- 46.
CREATE VIEW v(Name, Telefon) AS
SELECT Name,
  Telefon
FROM Mieter
WHERE Ort = "Berlin";
-- 47.
CREATE VIEW unbezahlt(
  VNr,
  MieterNr,
  FHaus,
  Mietbeginn,
  Mietende,
  Anzahlung,
  Betrag,
  bezahlt
) AS
SELECT *
FROM Vermietung
WHERE bezahlt = FALSE;
-- Aufgabe 48
SELECT *
FROM nicht_bezahlte_vermietungen
WHERE Mietbeginn < STR_TO_DATE('1.1.2008', '%e.%m.%Y');
-- Aufgabe 49
UPDATE nicht_bezahlte_Vermietungen AS NBV
SET NBV.bezahlt = 1
WHERE NBV.VNr = 17;
-- 50.
CREATE PROCEDURE eingabe()
INSERT INTO PreiseXX
VALUES (13, 'Hochfügen', 'Luxus', 300, 1800);
-- 51.
CREATE PROCEDURE interaktiveEingabe() @Preis @OrtBEGIN
INSERT INTO PreiseXX(Preis, Ort, Kategorie, Tagespreis, Wochenpreis);
-- 52.
DELIMITER $$ CREATE PROCEDURE gesicherte_eingabe (
  Preisschl INT,
  Ort CHAR(20),
  Kategorie CHAR(10),
  Tagespreis INT,
  Wochenpreis INT
) BEGIN IF NOT EXISTS (
  SELECT *
  FROM PreiseXX
  WHERE PreiseXX.Ort = Ort
    AND PreiseXX.Kategorie = Kategorie
) THEN
INSERT INTO PreiseXX
VALUES (
    Preisschl,
    Ort,
    Kategorie,
    Tagespreis,
    Wochenpreis
  );
END IF;
END $$ DELIMITER;
-- 53.
DELIMITER $$ CREATE PROCEDURE vermietung_anlegen(
  MieterNr INT,
  FHaus CHAR(15),
  Mietbeginn DATE,
  Mietende DATE,
  Anzahlung INT
) BEGIN
DECLARE VNr int DEFAULT 0;
DECLARE Betrag int DEFAULT 0;
DECLARE Tage int DEFAULT 0;
DECLARE Wochen int DEFAULT 0;
IF EXISTS (
  SELECT *
  FROM Mieter AS m
  WHERE m.MieterNr = MieterNr
)
AND EXISTS (
  SELECT *
  FROM Haus AS h
  WHERE h.FHaus = FHaus
)
AND NOT EXISTS (
  SELECT *
  FROM Vermietung as v
  WHERE v.Mietbeginn BETWEEN Mietbeginn AND Mietende
    OR v.Mietende BETWEEN Mietbeginn AND Mietende
    AND v.FHaus = FHaus
) THEN
SET VNr = (
    SELECT max(v.VNr)
    FROM Vermietung as v
  ) + 1;
SET Tage = DATEDIFF(Mietende, Mietbeginn) % 7;
SET Wochen = (DATEDIFF(Mietende, Mietbeginn) - Tage) / 7;
SET Betrag = Tage * (
    SELECT p.Tagespreis
    FROM Preise AS p
      JOIN Haus AS h on p.Preisschl = h.Preisschl
    WHERE h.FHaus = FHaus
  ) + Wochen * (
    SELECT p.Wochenpreis
    FROM Preise AS p
      JOIN Haus AS h on p.Preisschl = h.Preisschl
    WHERE h.FHaus = FHaus
  );
INSERT INTO Vermietung
VALUES (
    VNr,
    MieterNr,
    FHaus,
    Mietbeginn,
    Mietende,
    Anzahlung,
    Betrag,
    0
  );
END IF;
END $$ DELIMITER;
-- 54.
DELIMITER $$ CREATE PROCEDURE mietübersicht(Beginn DATE, Ende DATE) BEGIN
SELECT FHaus,
  Mietbeginn,
  Mietende
FROM Vermietung
WHERE Mietbeginn BETWEEN Beginn AND Ende
  OR Mietende BETWEEN Beginn AND Ende
ORDER BY Mietbeginn;
END $$ DELIMITER;
-- 55.
DELIMITER $$ CREATE TRIGGER PreisXX_eingabe_check BEFORE
INSERT ON PreiseXX FOR EACH ROW BEGIN IF (
    SELECT count(*)
    FROM preisexx AS p
    WHERE NEW.Ort = p.Ort
      AND NEW.Kategorie = p.Kategorie
  ) > 0 THEN signal sqlstate '69000'
set message_text = 'Es existiert bereits ein Eintrag für diesen Ort und diese Kategorie.';
END IF;
END $$ DELIMITER;
-- 56.
DELIMITER $$ 
DROP PROCEDURE vermietung_prüfen $$ 
DROP TRIGGER Eingabe_vermietung_insert $$ 
DROP TRIGGER Eingabe_vermietung_update $$ 
CREATE PROCEDURE Vermietung_prüfen(Mietbeginn DATE, Mietende DATE, FHaus CHAR(15)) BEGIN IF (
  SELECT count(*)
  FROM Vermietung AS v
  WHERE (
      v.Mietbeginn BETWEEN Mietbeginn AND Mietende
      OR v.Mietende BETWEEN Mietbeginn AND Mietende
    )
    AND FHaus = v.FHaus
) > 0 THEN signal sqlstate '69000'
set message_text = 'Das gewählte Haus ist im gewünschten Zeitraum nicht verfügbar.';
END IF;
END $$ CREATE TRIGGER eingabe_vermietung_insert BEFORE
INSERT ON Vermietung FOR EACH ROW BEGIN call vermietung_prüfen(NEW.Mietbeginn, NEW.Mietende, NEW.FHaus);
END $$ CREATE TRIGGER eingabe_vermietung_update BEFORE
UPDATE ON Vermietung FOR EACH ROW BEGIN call vermietung_prüfen(NEW.Mietbeginn, NEW.Mietende, NEW.FHaus);
END $$ DELIMITER;