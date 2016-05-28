#
#	Tested with "ubuntu/wily64"
#
echo "============================================="
echo "- ¡Hola! :-)"
echo "============================================="
lsb_release -a
# install main dependencies
echo "============================================="
echo "- Installing Main Dependencies"
echo "============================================="
sudo apt-get install -y openssl pkg-config libssl-dev libsslcommon2-dev
sudo apt-get install -y git

# install databases
echo "============================================="
echo "- Installing Databases"
echo "============================================="
sudo apt-get -y install mysql-server
sudo apt-get -y install mongodb
sudo apt-get -y install redis-server


# install php dev tools
echo "============================================="
echo "- Installing PHP"
echo "============================================="
sudo apt-get -y install php7.0-fpm php7.0-cli php7.0-common 
# install extensions
echo "============================================="
echo "- Installing PHP Extensions and tools"
echo "============================================="
sudo apt-get -y install php7.0-curl php7.0-json php7.0-opcache php7.0-mysqli 

#install redis extension
sudo pecl install mongodb;
echo "extension = mongodb.so" | sudo tee --append /etc/php/7.0/cli/php.ini 
echo "extension = mongodb.so" | sudo tee --append /etc/php/7.0/fpm/php.ini 

#install redis extension
sudo apt-get -y install php-redis


# install composer from site, composer pkg from repositories have dependencies 
# problems with php7.0
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
sudo npm install apidoc -g

echo "============================================="
echo "Create shortcuts"
echo "============================================="

echo "alias project_uncache=\"php bin/console -v cache:clear\"
alias project_run=\"project_uncache && php bin/console -v server:run 192.168.51.10:8080\"
alias project_dependencies=\"composer update && composer install\"
alias project_test=\"clear && php bin/console cache:clear &&  phpunit ./tests --verbose --colors\"
" | sudo tee --append ~/.bash_profile

source ~/.bash_profile
sudo service php7.0-fpm restart

# Done
echo "
        .=.
       '==c|
       [)-+|
       //'_|
  .ok /]==;\
"
