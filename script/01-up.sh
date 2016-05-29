#
#	Tested with "ubuntu/xenial64"
#	Gotardo González
#

echo "============================================="
echo "- ¡Hola! :-)"
echo "============================================="
lsb_release -a

echo "============================================="
echo "- Installing Main Dependencies"
echo "============================================="

sudo apt-get install -y git curl zip unzip


echo "============================================="
echo "- Installing Databases"
echo "============================================="

# sudo apt-get -y install mysql-server
sudo apt-get -y install mongodb
sudo apt-get -y install redis-server

echo "============================================="
echo "- Installing PHP"
echo "============================================="

sudo apt-get -y install php7.0-fpm php7.0-cli php7.0-common php7.0-dev

echo "============================================="
echo "- Installing PHP Extensions and tools"
echo "============================================="

sudo apt-get -y install php-mcrypt
sudo apt-get -y install php-zip 
sudo apt-get -y install php-curl 
sudo apt-get -y install php-json 
sudo apt-get -y install php-opcache
sudo apt-get -y install php-mysqli
sudo apt-get -y install php-xml 
sudo apt-get -y install php-mongodb 
sudo apt-get -y install php-redis

# install composer from site, composer pkg from repositories have dependencies 
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php composer-setup.php --filename=composer
php -r "unlink('composer-setup.php');"
sudo mv composer /usr/local/bin/composer

#install phpunit
sudo curl -LsS https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit
sudo chmod a+x /usr/local/bin/phpunit

# install symfony2
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

echo "============================================="
echo "- Extra dependencies"
echo "============================================="
sudo apt-get install -y tesseract-ocr	

echo "============================================="
echo "- Tools I like	"
echo "============================================="
sudo apt-get install -y nano
sudo apt-get install -y nodejs npm 
sudo npm install apidoc -g

echo "============================================="
echo "Create shortcuts"
echo "============================================="

echo "alias project_uncache=\"php bin/console -v cache:clear\"
alias project_run=\"project_uncache && php bin/console -v server:run 192.168.51.10:8080\"
alias project_dependencies=\"composer update && composer install\"
alias project_test=\"clear && php bin/console cache:clear &&  phpunit ./tests --verbose --colors\"
" | sudo tee --append /home/vagrant/.bash_profile

source /home/vagrant/.bash_profile
sudo service php7.0-fpm restart

# Done
echo "
        .=.
       '==c|
       [)-+|
       //'_|
  .ok /]==;\
"
