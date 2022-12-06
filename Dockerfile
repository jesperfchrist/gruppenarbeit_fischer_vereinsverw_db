#Create MySQL Image for JSP Tutorial Application
FROM mysql
LABEL AUTHOR mail@jesper.christ.de

ENV MYSQL_ROOT_PASSWORD Pswd123?
ADD file.sql /docker-entrypoint-initdb.d

EXPOSE 3306