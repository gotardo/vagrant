# vagrantfiles

## PHP7
This is a virtual environment for PHP7/Symfony development.

To execute it just go to your vm folder and create your www directory (to be shared with the machine), clone the directory and raise the vagrant machine by executing this in your terminal:
```
$ mkdir ./www
$ git clone https://github.com/gotardo/vagrantfiles . && vagrant up
```
### Features
- Based on UBuntu16.04 gbarbieru/xenial (thanks for this box) <https://atlas.hashicorp.com/gbarbieru/boxes/xenial>
- PHP7
- Extensions: php-mcrypt php-zip php-curl php-json php-opcache php-mysqli php-xml php-mongodb php-redis php-bz2
- Databases: MongoDB and Redis
- NodeJS & NPM
- ApiDoc

### Tools
- PHPUnit ```phpunit``` https://phpunit.de/
- Composer ```compmoser``` https://getcomposer.org/
- PHP Mess Detector ```phpmd``` https://phpmd.org/
- PHP Code Sniffer ```phpcs``` https://github.com/squizlabs/PHP_CodeSniffer
- PHP Coding Standards Fixer ```php-cs-fixer``` http://cs.sensiolabs.org/

### Shortcuts

You can execute some aliases from the Vagrant's .bash_profile file to dispatch certain common tasks from your Symfony project's root directory: 

#### project_uncache
Cleans project's cache by using the Symfony's command.

It equals to:
```
php bin/console -v cache:clear
```

#### project_run
Clean cache and launch the web server on the vagrant's IP and port 8080:
```
project_uncache && php bin/console -v server:run 192.168.51.10:8080
```

#### project_dependencies 
Update the project dependencies set up in composer.json file and install them.

It equals to:
```
composer update && composer install
```

#### project_codecheck
Execute a set of tools to evaluate the code quality on both sources and tests folders:
- PHP Code Sniffer.
- PHP Mess Detector.

It equals to:
```
clear && phpcs ./src && phpcs ./test && phpmd ./src text cleancode,codesize,controversial,design,naming,unusedcode && phpmd ./tests text cleancode,codesize,controversial,design,naming,unusedcode
```

#### project_test
It will clear cache and execute PHP Unit to launch the tests by using the Symfony's default configuration. 

It equals to:
```
clear && php bin/console cache:clear &&  phpunit ./tests --verbose --colors
```
