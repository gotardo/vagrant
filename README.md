# vagrantfiles

## PHP7

### Tools
- PHPUnit
- Composer
- PHPMD
- PHPCS

### Shortcuts

You can execute some aliases from the Vagrant's .bash_profile file to dispatch certain common tasks from your Symfony project's root directory: 

#### project_uncache
Cleans project's cache by using the Symfony's command
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
```
composer update && composer install
```

#### project_codecheck
Execute a set of tools to evaluate the code quality on both sources and tests folders:
- PHP Code Sniffer.
- PHP Mess Detector.

```
clear && phpcs ./src && phpcs ./test && phpmd ./src text cleancode,codesize,controversial,design,naming,unusedcode && phpmd ./tests text cleancode,codesize,controversial,design,naming,unusedcode
```

#### project_test
It will clear cache and execute PHP Unit to launch the tests by using the Symfony's default configuration.
```
clear && php bin/console cache:clear &&  phpunit ./tests --verbose --colors
```
