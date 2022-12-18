SELECT (
  Vorname,
  Nachname,
  Geburtsdatum,
  Strasse,
  Postleitzahl,
  Stadt
) FROM mitarbeiter as ma
INNER JOIN mitglieder as mg ON ma.Mitgliedsnummer = mg.Mitgliedsnummer;
