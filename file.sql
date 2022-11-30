  CREATE TABLE mitglieder (
    Mietgliedsnr TINYINT PRIMARY KEY auto_increment,
    Vorname char(20) NOT NULL,
    Nachname char(20) NOT NULL,
    Strasse char(20) NOT NULL,
    Hausnummer int NOT NULL,
    PLZ int NOT NULL,
    Geschlecht char(4) NOT NULL,
    Gewicht int ,
    Groesse int,
    Geburtsdatum DATE NOT NULL,
    IBAN int,
    Beitrittsdatum DATE NOT NULL
  );

CREATE TABLE mitarbeiter (
  Anfangsdatum DATE NOT NULL,
  Stundenlohn int NOT NULL,
  Steuerklasse int NOT NULL,
  Rolle char(12) NOT NULL
);

CREATE TABLE spielfelder (
  Spielfeldnummer  TINYINT PRIMARY KEY auto_imcrement,
);