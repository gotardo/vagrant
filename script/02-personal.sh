echo "============================================="
echo "Create shortcuts"
echo "============================================="

echo "alias project_uncache=\"php bin/console -v cache:clear\"
alias project_run=\"project_uncache && php bin/console -v server:run 192.168.51.10:8080\"
alias project_dependencies=\"composer update && composer install\" | sudo tee --append ~/.bash_profile


# Done
echo "
    __.-._
    '-._"7'
     /'.-c
     |  /T
snd _)_/LI
"