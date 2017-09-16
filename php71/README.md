# vagrantfiles

## PHP7.1
This is a virtual environment for PHP7.1/Symfony development.

To execute it just go to your vm folder and create your www directory (to be shared with the machine), clone the directory and raise the vagrant machine by executing this in your terminal:
```
$ git clone https://github.com/gotardo/vagrantfiles . && vagrant up
```
### Features
- Based on Ubuntu17.10 ubuntu/artful64 (thanks for this box) <https://app.vagrantup.com/ubuntu/boxes/artful64>
- PHP 7.1
- Extensions: php-mcrypt php-zip php-curl php-json php-opcache php-mysql php-xml php-mongodb php-redis php-bz2
- NodeJS & NPM
- ApiDoc

### Tools
- PHPUnit ```phpunit``` https://phpunit.de/
- Composer ```compmoser``` https://getcomposer.org/
- PHP Mess Detector ```phpmd``` https://phpmd.org/
- PHP Code Sniffer ```phpcs``` https://github.com/squizlabs/PHP_CodeSniffer
- PHP Coding Standards Fixer ```php-cs-fixer``` http://cs.sensiolabs.org/
