# Docker introduction
## What is docker
 platform for developing, shipping and running applications. Provides a way to run applications in an loosely isolated environment.
 Docker provides a set of tools to manage lifecycle of containers, like creation, updation, deletions.
 Lets you package your application along with its dependency to make it run the same everywhere.
 
 
## why we need docker
In devops its used to provide consistent development environment for developers
 In application development, it lets you freeze your environment and deploy it exactly as it is in local on different hosts like datacenter and
 cloud.
 Lets you run multiple containers on the same host. Application that may use common dependencies but different versions of those dependencies
 can be ran on same host.
 docker lets you run variable workloads in the same machine. 

## real life example
 Let say, your development teams has Nodejs and python developers for frontend and backend.
 You want to provide a consistent development environment for them to develop. things like same framework version, their dependency
 are important in such matters. You can create docker images with development related installations. package them
 and push the images to registry. then developers can pull the images from registry and create containers out of them to have a consistent
 development environment exactly same as the one you created in yours.
 

## docker objects
	### docker  images
		- docker images are readonly-templates for creating docker containers. Its like a blueprint along with materials that is required to build a car.
		- usually docker images are based on another images with some added layer of customization.
		Ex: a python 3.11 base image, set of libraries required to develop and run FASTAPI server. when combined can be used for API server
		- we can create our own docker images or use countless prebuild ones from public docker hub registry or private registry inside our organization like
		AWS ECR or artifactory
		- docker images are immutable, means they are readonly they cannot be changed after building. when you make changes, you need to create new image.
		- when you want to create your own image, you will create a dockerfile and include instructions like base image and instructions to build the new image.
		- each instructions in dockerfile will create a new layer. whenever those instruction changes, only the layer corresponding to changed instruction will
		be rebuilt.
		
		
	### docker containers
		- is a runnable instance of an image
		-  you can create, stop, delete, run a container using docker api or client
		- you can connect containers to multiple networks, storages or even make new images based on its current state.
		- containers are isolated from other containers and also the host machine.
		- you can control how isolated containers network, storage and underlying subsystems are from other containers and host machine.
		- containers are defined by the images and configuration provided to them when we create or start it.
		- when a container is removed any state not stored in persistant storage is removed.
		

## docker registry, private vs public
	- docker registry is where public docker images are pushed to and pulled from. 
	- it is like repository for docker images.
	- there are also private registries like artifactory and aws ecr that lets you manage your docker images privately.
	
## docker engine:
	- main part of the docker ecosystem. It is the containerzation technology that let us create and main docker containers.
	
## docker daemon:
	- it is the part of docker engine. It is a background service, that listens to docker api requests and manages docker components like
	container, network, images, volumes etc.
	
## docker client:
	- this is primary way users interact with docker services. its used to communicate with docker daemon.
	
## docker compose:
	- Its a tool used to define and run multiple containers from a single YAML file.
	
## difference between containers and hypervisor based virtual machines
	containers:
	share host os kernel and contain only application and its dependencies
	fairly isolated but may have risks as they share OS kernel
	requires less resources as OS is shared with host
	less start time

	VMs:
	runs its own operating system
	completely isolated environment from host os
	requires more cpu resources as it runs complete os
	longer than containers
