USE beehive;
CREATE TABLE IF NOT EXISTS mitglieder (
  Mietgliedsnr TINYINT PRIMARY KEY auto_increment,
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
  Rolle char(12) NOT NULL
);
CREATE TABLE IF NOT EXISTS sportarten (
  SportartNummer TINYINT PRIMARY KEY auto_increment,
  Name char(20),
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
)