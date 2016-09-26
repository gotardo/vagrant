INSTALLATION_PATH=./sonarqube-6.0

echo "============================================="
echo "- Installing System Dependencies"
echo "============================================="
sudo apt-get update -y
sudo apt-get install -y git curl zip unzip 
sudo apt-get install -y nano


echo "============================================="
echo "- Installing Java. Good luck, boy :S"
echo "============================================="

sudo apt-get install -y default-jre default-jdk

echo "============================================="
echo "- Installing MySQL"
echo "============================================="

sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password 123456'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password 123456'
sudo apt-get -y install mysql-server-5.7
sudo apt-get -y install mysql-client-5.7

echo "============================================="
echo "- Installing SonarQube"
echo "============================================="

wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.0.zip
unzip sonarqube-6.0.zip
sudo ln -s sonarqube-6.0/bin/linux-x86-64/sonar.sh /usr/bin/sonar

mysql -uroot -p123456 < /vagrant/script/sonarqube.sql

echo "# MySql
sonar.jdbc.username=sonarqube
sonar.jdbc.password=sonarqube
sonar.jdbc.url=jdbc:mysql://localhost:3306/sonarqube?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfig=maxPerformance
sonar.web.host=192.168.51.11
sonar.web.port=9000
sonar.web.context=/
"| sudo tee --append $INSTALLATION_PATH/conf/sonar.properties

sudo cp /vagrant/script/sonar_as_service /etc/init.d/sonar 
sudo chmod 755 /etc/init.d/sonar
sudo update-rc.d sonar defaults

# Add SonarQube bins to the path
PATH=$PATH:$INSTALLATION_PATH/bin/

# install sonar scanner
# http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner
wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.8.zip
unzip sonar-scanner-2.8.zip