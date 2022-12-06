# gruppenarbeit_fischer_vereinsverw_db
Beehive vereinsverwaltungs datenbank realisiert in MySQL von Jesper Christ und Maurice Hakan Yigitbasi.
Der Code ist Teil einer Gruppenarbeit im Studium im Modul Datenbanken.

## Docker
Wir haben auch Support für eine Docker-Ubuntu Instanz für unsere Datenbank mit der Dockerfile hinzugefügt.
```bash
docker build -t beehive_db:1.0 .
docker run --detach run --name=beehive_db --publish 6603:3306 beehive_db:1.0
```

Jetzt wird über den localhost:6603/ oder localhost:3306/ der MySQL-Server öffentlich gemacht.
Man kann auch über den Docker Support in die Ubuntu Instanz einsteigen und dort eigens Befehle
im Terminal ausführen. Dazu empfehlen wir VisualStudio Code, die SQL Tools Extension und die 
Docker Extensions, um alle Teile unserer Codebase benutzen zu können.
