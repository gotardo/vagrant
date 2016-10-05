INSTALLATION_PATH=./sonarqube-6.0

echo "============================================="
echo "- Installing System Dependencies"
echo "============================================="
sudo apt-get update -y
sudo apt-get -y install git curl zip unzip 
sudo apt-get -y install nano
sudo apt-get -y install maven

echo "============================================="
echo "- Installing Java Dependencies"
echo "============================================="
sudo apt-get install -y openjdk-8-jre
sudo apt-get install -y openjdk-8-jdk

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
sudo rm sonarqube-6.0.zip

mysql -uroot -p123456 < /vagrant/script/sonarqube.sql

echo "# MySql
sonar.jdbc.username=sonarqube
sonar.jdbc.password=sonarqube
sonar.jdbc.url=jdbc:mysql://localhost:3306/sonarqube?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfig=maxPerformance
#sonar.web.host=192.168.51.11
sonar.web.port=80
sonar.web.context=/
"| sudo tee --append $INSTALLATION_PATH/conf/sonar.properties

# sudo cp /vagrant/script/sonar_as_service /etc/init.d/sonar 
# sudo chmod 755 /etc/init.d/sonar
# sudo update-rc.d sonar defaults


# Add SonarQube bins to the path
PATH=$PATH:$INSTALLATION_PATH/bin/

echo "============================================="
echo "- Sonar Sonar Scanner"
echo "============================================="

# install sonar scanner
# http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner
wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.8.zip
unzip sonar-scanner-2.8.zip
sudo rm sonar-scanner-2.8.zip

echo "

sonar.host.url=http://localhost
" | sudo tee --append /home/vagrant/sonar-scanner-2.8/conf/sonar-scanner.properties

PATH=$PATH:/home/vagrant/sonar-scanner-2.8/bin/

echo "============================================="
echo "- Sonar PHP extension"
echo "============================================="

sudo wget http://sonarsource.bintray.com/Distribution/sonar-php-plugin/sonar-php-plugin-2.8.jar -P $INSTALLATION_PATH/extensions/plugins/

echo "============================================="
echo "- Launch SonarQube"
echo "============================================="

sudo ./sonarqube-6.0/bin/linux-x86-64/sonar.sh start


echo "============================================="
echo "- Create Shortcuts"
echo "============================================="


echo "alias project_scan=\"/home/vagrant/sonar-scanner-2.8/bin/sonar-scanner\"
"| sudo tee --append /home/vagrant/.bash_profile
