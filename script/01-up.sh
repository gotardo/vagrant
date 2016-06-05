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
echo "- Installing PHP and extensions"
echo "============================================="

sudo apt-get -y install php7.0-fpm php7.0-cli php7.0-common php7.0-dev
sudo apt-get -y install php-mcrypt php-zip php-curl php-json php-opcache php-mysqli php-xml php-mongodb php-redis php-bz2


echo "============================================="
echo "- Installing PHP tools"
echo "============================================="

# install composer from site, composer pkg from repositories have dependencies 
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php composer-setup.php --filename=composer
php -r "unlink('composer-setup.php');"
sudo mv composer /usr/local/bin/composer

# Install PHP Code Sniffer and PHP Mess Detector utilities
curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
sudo mv phpcs.phar /usr/local/bin/phpcs
sudo chmod +x /usr/local/bin/phpcs
phpcs -h

curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
sudo mv phpcbf.phar /usr/local/bin/phpcbf
sudo chmod +x /usr/local/bin/phpcbf
phpcbf -h

curl -OL http://static.phpmd.org/php/latest/phpmd.phar
sudo mv phpmd.phar /usr/local/bin/phpmd
sudo chmod +x /usr/local/bin/phpmd
phpmd -h

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
alias project_codecheck=\"clear && phpcs ./src && phpcs ./test && phpmd ./src text cleancode,codesize,controversial,design,naming,unusedcode && phpmd ./tests text cleancode,codesize,controversial,design,naming,unusedcode\"
alias project_test=\"clear && php bin/console cache:clear &&  phpunit ./tests --verbose --colors\"
"| sudo tee --append /home/vagrant/.bash_profile

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
