# Docker images:

An image is a combination of file system and parameters. Images contains the binaries and 
dependencies  
Image contains the necessary things to run a container  



## Installation:
https://docs.docker.com/engine/install/ubuntu/  
Remove all unofficial docker packages that might be packaged with ubuntu:  

`
  for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
`

Install docker in ubuntu  

prerequisite:  
https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository  
### Add Docker's official GPG key:

`
  sudo apt-get update
  sudo apt-get install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
`

### Add the repository to Apt sources:

`
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
`

### install docker

`
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
`

To create docker group and add your user:  

`
  sudo groupadd docker
  sudo usermod -aG docker $USER
`  
Start the docker service:  

`sudo systemctl start docker`  

To list running containers:  
`sudo docker ps`  

To list all containers  
`sudo docker ps -a`  

List docker images  
`sudo docker images`  
will show empty  

# Lab

## Pull the first image:
`sudo docker run hello-world`  
see the output to understand how docker pulls and runs an image.  

## List docker images
`sudo docker images`  
will show hello world image  

## pull a docker image from dockerhub
https://hub.docker.com/_/nginx  
`sudo docker pull nginx:latest`  
pulls the image from nginx repository with the "latest" tag.  
tags convey useful information about image version/variant  

## list the docker images to see nginx image  
`sudo docker images`  

## pull an image with different tag from nginx repository
`sudo docker pull nginx:1.27.5`  

when pulling an image, docker first checks if the image exists in local machine  

## list to see two different version of nginx
`sudo docker images`  

When we just give the name of image, then it takes 'latest' by default  
`sudo docker pull redis`  
will download the latest redis image  

Each docker image is a series of layers.  
Layers corresponds to instruction in docker file.  
Docker makes use of union file systems to combine these layers in to single image  
### To view layers 
`sudo docker history <image_name>`  
`sudo docker history redis`  
History command shows each layer and what command is used for each layer.  


Docker tags can be explicitly tagged to an image.  
An image can be duplicated using the docker tag command  
`docker tag source:tag destination:tag`  
`docker tag redis:latest myredis:0.1`  
Used to version our images  

## How to push a docker image to repository:
1. Before pushing, login to dockerhub  
`sudo docker login -u khanation`  

`sudo docker image push user/image-name`  
ex:
`sudo docker image push khanation/myredis:0.1`  
=> throws error that image with tag does not exist locally  

so we need to tag our myredis image with our username/myredis:0.1  
`sudo docker tag myredis:0.1 khanation/myredis:0.1`  

`sudo docker image push khanation/myredis:0.1`  

