-- Die grundlegende MySQL Datenbank erstellen
CREATE DATABASE IF NOT EXISTS beehive;
-- Sicherstellen, dass die Datenbank ausgewaehlt ist
USE beehive;
-- Die Mitgliedertabelle erstmal ohne Foreign Keys
CREATE TABLE IF NOT EXISTS mitglieder (
  Mitgliedsnummer TINYINT PRIMARY KEY auto_increment,
  Vorname char(20) NOT NULL,
  Nachname char(20) NOT NULL,
  Strasse char(20) NOT NULL,
  Hausnummer char(4) NOT NULL,
  PLZ char(5) NOT NULL,
  Geschlecht char(1) NOT NULL,
  Gewicht int,
  Groesse int,
  Geburtsdatum DATE NOT NULL,
  IBAN char(22) NOT NULL,
  Beitrittsdatum DATE NOT NULL
);
-- MITARBEITER
CREATE TABLE IF NOT EXISTS mitarbeiter (
  Anfangsdatum DATE NOT NULL,
  Stundenlohn int NOT NULL,
  Steuerklasse int NOT NULL,
  Rolle char(12) NOT NULL,
  Mitgliedsnummer TINYINT,
  FOREIGN KEY (Mitgliedsnummer) REFERENCES mitglieder(Mitgliedsnummer)
);
-- SPORTARTEN
CREATE TABLE IF NOT EXISTS sportarten (
  Sportartnummer TINYINT PRIMARY KEY auto_increment,
  SportartName char(20),
  Equipment char(50)
);
-- SPIELFELDER
CREATE TABLE IF NOT EXISTS spielfelder (
  Spielfeldnummer TINYINT PRIMARY KEY auto_increment,
  Untergrund char(12),
  Markierungen char(12),
  Netz char(12),
  Laenge int,
  Breite int,
  Ort char(30)
);
-- TEAMS
CREATE TABLE IF NOT EXISTS teams (
  Teamnummer TINYINT PRIMARY KEY auto_increment,
  Bedingungen char(20),
  Altersklasse int,
  Groesse int
);
-- Beziehung: mitglieder spielen in teams
CREATE TABLE IF NOT EXISTS mitglieder_spielen_in (
  Teamnummer TINYINT,
  Mitgliedsnummer TINYINT,
  FOREIGN KEY (Mitgliedsnummer) REFERENCES mitglieder (Mitgliedsnummer),
  FOREIGN KEY (Teamnummer) REFERENCES teams (Teamnummer)
);
-- Beziehung: teams spielen sportarten
CREATE TABLE IF NOT EXISTS teams_spielen (
  Sportartnummer TINYINT,
  Teamnummer TINYINT,
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer),
  FOREIGN KEY (Teamnummer) REFERENCES teams (Teamnummer)
);
-- Beziehung: sportarten benuetigen spielfelder
CREATE TABLE IF NOT EXISTS sportarten_benoetigen (
  Sportartnummer TINYINT,
  Spielfeldnummer TINYINT,
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer),
  FOREIGN KEY (Spielfeldnummer) REFERENCES spielfelder (Spielfeldnummer)
);
CREATE TABLE IF NOT EXISTS mitglieder_koennen_sportarten (
  Mitgliedsnummer TINYINT,

  FOREIGN KEY (Mitgliedsnummer) REFERENCES mitglieder (Mitgliedsnummer),
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer)
);
-- insert values
INSERT INTO sportarten (SportartName, Equipment)
VALUES ('Handball', 'Handballfeld');
INSERT INTO sportarten (SportartName, Equipment)
VALUES ('Tennis', 'Tennisfeld');
INSERT INTO sportarten (SportartName, Equipment)
VALUES ('Basketball', 'Basketballfeld');
INSERT INTO sportarten (SportartName, Equipment)
VALUES ('Volleyball', 'Volleyballfeld');
INSERT INTO sportarten (SportartName, Equipment)
VALUES ('Badminton', 'Badmintonfeld');
INSERT INTO sportarten (SportartName, Equipment)
VALUES ('Darts', 'Dartsscheiben');