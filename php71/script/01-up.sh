#
#	Tested with "ubuntu/xenial64"
#	Gotardo González
#

echo "============================================="
echo "- ¡Hola! :-)"
echo "============================================="
sudo apt-get update
lsb_release -a

echo "============================================="
echo "- Installing Main Dependencies"
echo "============================================="

sudo apt-get install -y git curl zip unzip
sudo apt-get install -y php-fpm 
sudo apt-get install -y php-mysqli php-redis php-mongodb php-zip php-yaml php-mcrypt php-curl php-json php-opcache php-xml php-bz2

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

#install PHP Coding Standards Fixer
wget http://get.sensiolabs.org/php-cs-fixer.phar -O php-cs-fixer
sudo chmod a+x php-cs-fixer
sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
php-cs-fixer --help

#install phpunit
sudo curl -LsS https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit
sudo chmod a+x /usr/local/bin/phpunit
phpunit --version

# install symfony2
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

echo "============================================="
echo "- Tools I like	"
echo "============================================="
sudo apt-get install -y nano
sudo apt-get install -y nodejs npm 
sudo npm install apidoc -g

source /home/vagrant/.bash_profile

# Done
echo "
        .=.
       '==c|
       [)-+|
       //'_|
  .ok /]==;\
"
