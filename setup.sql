-- Die grundlegende MySQL Datenbank erstellen
CREATE DATABASE IF NOT EXISTS beehive;
-- Sicherstellen, dass die Datenbank ausgewaehlt ist
USE beehive;
-- Die Mitgliedertabelle erstmal ohne Foreign Keys
CREATE TABLE IF NOT EXISTS mitglieder (
  Mitgliedsnummer INT PRIMARY KEY auto_increment,
  Vorname varchar(20) NOT NULL,
  Nachname varchar(23) NOT NULL,
  Strasse varchar(100) NOT NULL,
  Stadt varchar(100) NOT NULL,
  Postleitzahl varchar(5) NOT NULL,
  Geschlecht varchar(1) NOT NULL,
  Gewicht FLOAT,
  Groesse INT,
  Geburtsdatum DATE NOT NULL,
  IBAN varchar(34) NOT NULL,
  Beitrittsdatum DATE
);
-- MITARBEITER
CREATE TABLE IF NOT EXISTS mitarbeiter (
  Anfangsdatum DATE NOT NULL,
  Stundenlohn FLOAT NOT NULL,
  Steuerklasse INT NOT NULL,
  Rolle varchar(50) NOT NULL, 
  Mitgliedsnummer INT,
  FOREIGN KEY (Mitgliedsnummer) REFERENCES mitglieder(Mitgliedsnummer)
);
-- SPORTARTEN
CREATE TABLE IF NOT EXISTS sportarten (
  Sportartnummer INT PRIMARY KEY auto_increment,
  SportartName varchar(20) UNIQUE,
  Equipment varchar(50)
);
-- SPIELFELDER
CREATE TABLE IF NOT EXISTS spielfelder (
  Spielfeldnummer INT PRIMARY KEY auto_increment,
  Untergrund varchar(50),
  Markierungen varchar(50),
  Netz varchar(30),
  Laenge FLOAT,
  Breite FLOAT,
  Ort varchar(50)
);
-- TEAMS
CREATE TABLE IF NOT EXISTS teams (
  Teamnummer INT PRIMARY KEY auto_increment,
  Bedingungen varchar(100),
  Altersklasse varchar(10),
  Groesse INT
);
-- Beziehung: mitglieder spielen in teams
CREATE TABLE IF NOT EXISTS mitglieder_spielen_in (
  Teamnummer INT,
  Mitgliedsnummer INT,
  FOREIGN KEY (Mitgliedsnummer) REFERENCES mitglieder (Mitgliedsnummer),
  FOREIGN KEY (Teamnummer) REFERENCES teams (Teamnummer)
);
-- Beziehung: teams spielen sportarten
CREATE TABLE IF NOT EXISTS teams_spielen (
  Sportartnummer INT,
  Teamnummer INT,
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer),
  FOREIGN KEY (Teamnummer) REFERENCES teams (Teamnummer)
);
-- Beziehung: sportarten benuetigen spielfelder
CREATE TABLE IF NOT EXISTS sportarten_benoetigen (
  Sportartnummer INT,
  Spielfeldnummer INT,
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer),
  FOREIGN KEY (Spielfeldnummer) REFERENCES spielfelder (Spielfeldnummer)
);
-- Beziehung:  mitglieder koennen sportarten
CREATE TABLE IF NOT EXISTS mitglieder_koennen_sportarten (
  Mitgliedsnummer INT,
  Sportartnummer INT,
  FOREIGN KEY (Mitgliedsnummer) REFERENCES mitglieder (Mitgliedsnummer),
  FOREIGN KEY (Sportartnummer) REFERENCES sportarten (Sportartnummer)
) ADD CONSTRAINT keine_sportart_doppelt_pro_mitglied UNIQUE (Mitgliedsnummer, Sportartnummer);
