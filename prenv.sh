#!/usr/bin/bash

function prenv(){


	sudo yum install -y yum-utils
	sudo yum-config-manager \
	   --add-repo \
	   https://download.docker.com/linux/centos/docker-ce.repo

	sudo yum -y install docker-ce docker-ce-cli containerd.io 

	systemctl start docker
	systemctl enable docker


	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}

main(){
	prenv
}

main
