CREATE DATABASE sonarqube
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON sonarqube.* TO 'sonarqube'@'%' IDENTIFIED BY 'sonarqube';

flush privileges;
