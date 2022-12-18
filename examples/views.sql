-- Mitarbeiter mit erweiterten Informationen anzeigen
CREATE VIEW Mitarbeiter AS
SELECT Vorname,
  Nachname,
  Geburtsdatum,
  Strasse,
  Postleitzahl,
  Stadt,
  Stundenlohn,
  Steuerklasse,
  Anfangsdatum,
  Beitrittsdatum
FROM mitarbeiter as ma
  INNER JOIN mitglieder as mg ON ma.Mitgliedsnummer = mg.Mitgliedsnummer;
-- Anzahl der Einträge festellen, interessant z.B. bei jährlicher Betrachtung
SELECT count(*)
FROM mitglieder;
SELECT count(*)
FROM mitarbeiter;
SELECT count(*)
FROM sportarten;
SELECT count(*)
FROM spielfelder;
SELECT count(*)
FROM mitglieder;
-- 
WHERE Beitrittsdatum < DATE('2020-01-01');
-- 
CREATE VIEW VerteilunAufSportarten AS
SELECT count(mks.Mitgliedsnummer),
  s.SportartName
FROM mitglieder_koennen_sportarten mks
  INNER JOIN sportarten s ON mks.Sportartnummer = s.Sportartnummer
GROUP BY mks.Sportartnummer;
-- durchschnittsalter aller mitglieder 
SELECT avg(TIMESTAMPDIFF(YEAR, Geburtsdatum, CURDATE())) AS alter
FROM mitglieder;
-- ältestestes mitglied
CREATE VIEW ältestesMitglied AS 
SELECT Vorname, Nachname, TIMESTAMPDIFF(YEAR, Geburtsdatum, CURDATE()) AS age, Geburtsdatum FROM mitglieder
WHERE Geburtsdatum = (SELECT MIN(Geburtsdatum) FROM mitglieder)
ORDER BY Geburtsdatum ASC
LIMIT 1;

-- juengstes mitglied
CREATE VIEW jüngstesMitglied AS 
SELECT Vorname, Nachname, TIMESTAMPDIFF(YEAR, Geburtsdatum, CURDATE()) AS age, Geburtsdatum FROM mitglieder
WHERE Geburtsdatum = (SELECT MIN(Geburtsdatum) FROM mitglieder)
ORDER BY Geburtsdatum DESC
LIMIT 1;
-- Mitglieder und ihre Sportarten
CREATE VIEW mitgliederUndSportarten AS
SELECT  m.Vorname, m.Nachname, GROUP_CONCAT(s.SportartName SEPARATOR ', ') AS Sportarten
FROM mitglieder m
JOIN mitglieder_koennen_sportarten mks ON m.Mitgliedsnummer = mks.Mitgliedsnummer
JOIN sportarten s ON mks.Sportartnummer = s.Sportartnummer
GROUP BY m.Mitgliedsnummer;
-- Teams und ihre Mitglieder
CREATE VIEW teamsUndMitglieder AS
SELECT t.Teamnummer, t.Altersklasse, t.Groesse, CONCAT_WS(' ', m.Vorname, m.Nachname) AS `Name`, s.SportartName
FROM teams t
JOIN mitglieder_spielen_in msi ON t.Teamnummer = msi.Teamnummer
JOIN mitglieder m ON msi.Mitgliedsnummer = m.Mitgliedsnummer
JOIN teams_spielen ts ON ts.Teamnummer = t.Teamnummer
JOIN sportarten s on s.Sportartnummer = ts.Sportartnummer
GROUP BY t.Teamnummer, m.Mitgliedsnummer, s.SportartName;
-- Sportarten und ihre Spielfelder
CREATE VIEW sportartenUndSpielfelder AS
SELECT s.SportartName, GROUP_CONCAT(sf.Spielfeldnummer SEPARATOR ', ') AS Spielfelder
FROM sportarten s
JOIN sportarten_benoetigen sb ON s.Sportartnummer = sb.Sportartnummer
JOIN spielfelder sf ON sb.Spielfeldnummer = sf.Spielfeldnummer
GROUP BY s.SportartName;
-- Teams und ihre Mitglieder
SELECT t.Teamnummer, GROUP_CONCAT(CONCAT_WS(' ', m.Vorname, m.Nachname) SEPARATOR ', ') AS Teammitglieder
FROM teams t
JOIN mitglieder_spielen_in msi ON t.Teamnummer = msi.Teamnummer
JOIN mitglieder m ON msi.Mitgliedsnummer = m.Mitgliedsnummer
GROUP BY t.Teamnummer;