#Create MySQL Image for beehive db
FROM mysql
LABEL AUTHOR mail@jesper.christ.de

ADD file.sql /docker-entrypoint-initdb.d

EXPOSE 3306
