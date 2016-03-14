# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	
	# config.vm.box = "ncaro/php7-debian8-apache-nginx-mysql"
	config.vm.box = "peterrehm/symfony-php7"
 	config.vm.synced_folder "./www/", "/var/www/",  
		# NFS config is only valid for Linxu and MacOSX
		type: "nfs"
	
	config.vm.network :forwarded_port, host: 80, guest: 80
	config.vm.network "forwarded_port", guest: 8010, host: 8010
    	config.vm.network :forwarded_port, host: 27017, guest: 27017
    	config.vm.network "private_network", ip: "192.168.51.10"
	config.vm.provision "shell", path: "script/up.sh"
end
