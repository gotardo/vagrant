# install main dependencies and system tools
sudo apt-get install -y curl

# install needed databases
sudo apt-get -y install mysql-server
sudo apt-get -y install mongodb
sudo apt-get -y install redis-server

# install PHP, pear and extensions
# sudo apt-get -y install php5-mcrypt php5-zip php5-curl php5-json php5-xml php5-mongodb php5-redis php5-bz2 php5-xdebug php5-zip

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
