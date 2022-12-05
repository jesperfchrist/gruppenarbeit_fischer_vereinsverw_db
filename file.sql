USE beehive;
CREATE TABLE IF NOT EXISTS mitglieder (
  Mietgliedsnummer TINYINT PRIMARY KEY auto_increment,
  Vorname char(20) NOT NULL,
  Nachname char(20) NOT NULL,
  Strasse char(20) NOT NULL,
  Hausnummer int NOT NULL,
  PLZ int NOT NULL,
  Geschlecht char(4) NOT NULL,
  Gewicht int,
  Groesse int,
  Geburtsdatum DATE NOT NULL,
  IBAN int,
  Beitrittsdatum DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS mitarbeiter (
  Anfangsdatum DATE NOT NULL,
  Stundenlohn int NOT NULL,
  Steuerklasse int NOT NULL,
  Rolle char(12) NOT NULL,
  Mietgliedsnummer TINYINT,
  FOREIGN KEY (Mietgliedsnummer) REFERENCES mitglieder(Mietgliedsnummer)
);
CREATE TABLE IF NOT EXISTS sportarten (
  Sportartnummer TINYINT PRIMARY KEY auto_increment,
  SportartName char(20),
  Equipment char(50)
);
CREATE TABLE IF NOT EXISTS spielfelder (
  Spielfeldnummer TINYINT PRIMARY KEY auto_increment,
  Untergrund char(12),
  Markierungen char(12),
  Netz char(12),
  Länge int,
  Breite int,
  Ort char(30)
);
CREATE TABLE IF NOT EXISTS teams (
  Teamnummer TINYINT PRIMARY KEY auto_increment,
  Bedingungen char(20),
  Altersklasse int,
  Groesse int
);
CREATE TABLE IF NOT EXISTS mitglieder_spielen_in (
  Teamnummer TINYINT,
  Mietgliedsnummer TINYINT,
  FOREIGN KEY (Mietgliedsnummer) REFERENCES mitglieder (Mietgliedsnummer),
  FOREIGN KEY (Teamnummer) REFERENCES teams (Teamnummer)
);
CREATE TABLE IF NOT EXISTS teams_spielen (
  Sportartnummer TINYINT,
  Teamnummer TINYINT,
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer),
  FOREIGN KEY (Teamnummer) REFERENCES teams (Teamnummer)
);
CREATE TABLE IF NOT EXISTS sportarten_benoetigen (
  Sportartnummer TINYINT,
  Spielfeldnummer TINYINT,
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer),
  FOREIGN KEY (Spielfeldnummer) REFERENCES spielfelder (Spielfeldnummer)
);
CREATE TABLE IF NOT EXISTS mitglieder_können_sportarten (
  Mietgliedsnummer TINYINT,
  Sportartnummer TINYINT,
  FOREIGN KEY (Mietgliedsnummer) REFERENCES mitglieder (Mietgliedsnummer),
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer)
);