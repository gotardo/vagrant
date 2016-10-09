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
echo "- Installing SolR"
echo "============================================="
wget http://apache.rediris.es/lucene/solr/6.2.1/solr-6.2.1-src.tgz
tar xvfz solr-6.2.1-src.tgz
rm solr-6.2.1-src.tgz
