# vagrantfiles

## PHP7

### Tools
- PHPUnit
- Composer
- PHPMD
- PHPCS

### Shortcuts

You can execute some aliases from the Vagrant's .bash_profile file to dispatch certain common tasks from your Symfony project's root driectory: 

#### project_uncache
It will delete project's cache by using the Symfony's command
```
php bin/console -v cache:clear
```

#### project_run
```
project_uncache && php bin/console -v server:run 192.168.51.10:8080
```

#### project_dependencies 
```
composer update && composer install
```

#### project_codecheck
```
clear && phpcs ./src && phpcs ./test && phpmd ./src text cleancode,codesize,controversial,design,naming,unusedcode && phpmd ./tests text cleancode,codesize,controversial,design,naming,unusedcode
```

#### project_test
It will clear cache and execute PHP Unit to launch
```
clear && php bin/console cache:clear &&  phpunit ./tests --verbose --colors
```
