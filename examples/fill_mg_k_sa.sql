DELIMITER //
CREATE PROCEDURE fill_mks(n int DEFAULT 501)
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= n DO
    INSERT INTO mitglieder_koennen_sportarten (Mitgliedsnummer, Sportartnummer) VALUES ( FLOOR (RAND() * 500) + 1,  FLOOR (RAND() * 8) + 1);
    SET i = i + 1;
  END WHILE;
END //
DELIMITER ;
