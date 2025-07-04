# Docker file:

- Contains instructions to build a docker image  
- Docker image consists of read only layers. each layer == each instruction  

## build command:
`docker build -f <dockerfile_path>`  
 
Example of dockerfile:  
https://hub.docker.com/_/hello-world  
https://github.com/docker-library/hello-world/tree/master/amd64/hello-world  

Ex: dockerfile for hello-world image  
`
	FROM scratch
	COPY hello /
	CMD ["/hello"]
`

here FROM, COPY and CMD are the dockerfile instructions  

Ex: more advanced Docker file  
https://hub.docker.com/layers/grafana/grafana/main-ubuntu/images/sha256-0062b05202abc967c40832142159ea2f8001cb07fe1cc3ee46597002fd7d3d27  


More about dockerfile instructions:  
https://docs.docker.com/reference/dockerfile/  

There are rules to be followed for dockerfile:  
1. A Dockerfile must begin with a FROM instruction.   
2. '#' is used to comment a line in docker file( they will be removed during build)  
3. Only one CMD or ENTRY_POINT should be present, if multiple of these commands  
present, then only last command will be considered  

## Some of the important instructions:  

### FROM:
`
	FROM [--platform=<platform>] <image> [AS <name>]  
	FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]  
	FROM [--platform=<platform>] <image>[@<digest>] [AS <name>]  
`
	=> should be the first instruction in any docker file  
	=> initializes new build stage and sets the base image  
	=> Only ARG instruction can be used before FROM  

### RUN:

	# Shell form:  
	`RUN [OPTIONS] <command> ...`
	# Exec form:  
	`RUN [OPTIONS] [ "<command>", ... ]`

	=> Execute any commands to create new layer on top of the current image  
	=> Two forms, shell and exec forms.  
	=> shell forms  is similar to how we use cli executables options  
	Ex: `RUN apt-get install -y curl`  
	=> exec forms is similar to how we pass the arguments to a program  
	Ex: `RUN ["python", "hello world.py"]`  
	=> RUN instruction happens during build time  

### CMD:

	`CMD python hello-world.py`  
	`CMD ["python", "hello-world.py"]`  

	=> The CMD instruction sets the command to be executed when running a container from an image.  
	=> There can only be one CMD instruction per dockerfile. If more than one, only  
	the last command will take effect.  
	=> CMD instruction does not execute during build time. only provide the command  
	for running the image.  
	
### ADD
`
	ADD [OPTIONS] <src> ... <dest>  
	ADD [OPTIONS] ["<src>", ... "<dest>"]  
 `
	Ex:
	`ADD file1.txt file2.txt /destination/folder/`  
	
	=> allows you to copy files from local to filesystem of the image  
	=> you can use wildcard to specify source  
	Ex:  
	`Add folder1/* destination/folder/` = > copies all the folders inside folder1  
	to destination/folder/  
	=> destination must end with /  

### COPY

	`COPY [OPTIONS] <src> ... <dest>`  
	`COPY [OPTIONS] ["<src>", ... "<dest>"]`  

	=> The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the image at the path <dest>.  
	
### ENTRYPOINT:  
	Exec form:  
	`ENTRYPOINT ["executable", "param1", "param2"]`  
	shell form:  
	`ENTRYPOINT command param1 param2`  
	
	=> An ENTRYPOINT allows you to configure a container that will run as an executable  
 
### WORKDIR:  
	`WORKDIR /path/to/workdir`  
	=> sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD  

## Useful cli commands:  

### To build a dockerfile  
`docker build -f first.dockerfile -t firstimage .`  

### lists the firstimage   
`sudo docker images `  


### To run a dockerfile  
`docker run firstimage`  

### To override argument in dockerfile  
`docker run thirdimage khan`  

## Lab:  
### Install docker in EC2 using commands from below url:  
https://docs.docker.com/engine/install/ubuntu/  

### clone github repo to local  
`git clone https://github.com/lzmkhan/dockercourse.git`  

### use change directory to navigate to dockercourse folder  
`cd dockercourse`  

### use ls to see what files are present  
`ls `  

### use cat to read content of hello_world.py  
`cat hello_world.py`  

### use cat to view first.dockerfile  
`cat first.dockerfile`  
check the content of first.dockerfile    

### build your first docker image  
`docker build -f first.dockerfile -t firstimage .`    
=> -t means tag    
=> -f means filepath of the dockerfile    
=> . means use the files from the current directory. If your source files are present in other directory    
specify the path. The files in the specified directly will be sent to docker daemon to build images.    

### check if image is created  
`docker images`  

### run your first docker container image  
`docker run firstimage`  

### check if the firstimage is listed in ps command  
`docker ps -a`  

repeat for secondimage, thirdimage and fourthimage  
read the dockerfiles for difference and how we are leverage base layers  
and extending them.  
