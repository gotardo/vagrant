# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
 	# config.vm.box = "ubuntu/trusty64"
	config.vm.box = "gbarbieru/xenial"
	config.vm.synced_folder "./www/", "/var/www/",  
		# NFS config is only valid for Linxu and MacOSX
		type: "nfs"
	config.vm.network :forwarded_port, host: 80, guest: 80
    config.vm.network :forwarded_port, host: 27017, guest: 27017
    config.vm.network :forwarded_port, host: 3606, guest: 3606
    config.vm.network :private_network, ip: "192.168.51.10"
	
	config.vm.provision "shell", path: "script/01-up.sh"
	config.vm.provision "shell", path: "script/02-personal.sh"	
	
	config.vm.provider "virtualbox" do |v|
		v.name = "php7dev"

		v.customize [
			"modifyvm", :id, 
			"--memory", 2048, 
			"--cpus", 1,
			"--natdnshostresolver1", "on",
            "--natdnsproxy1", "on"]		
	end	
end
