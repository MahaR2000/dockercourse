# Debugging docker containers

Sometimes things may go south when running a container
and you may need to debug the container for any problems

#### attach and detach container output to terminal
`sudo docker run -a STDOUT -p 80:80 frontendimage`  
Alternate(while the container is already running):  
`docker attach frontendimage`  
this attaches the standard out to terminal(We will see the output in terminal)

`sudo docker run -d -p 80:80 frontendimage`
this will detach the container's standard in/output allowing us
to run the container in headless mode and we are free to use the same terminal.

# how to detach
To detach from the container, you define the key while attaching.
and press the key combinations to detach from streaming.
`docker attach --detach-keys="ctrl-x" <container-name>`

#### to view logs in running container 
`sudo docker container logs <container_name>`
lets  us see the logs from the container

#### to execute commands inside container shell
`docker exec -it <container-id> /bin/bash`  
type `exit` to exit the container shell
Alternative:
`docker debug`

# Best practices
1. use official/verified docker image as base image
   Ex: instead of using ubuntu and installing node, use node image as base image.
2. Always specify the version of the docker image against latest 
   as there may be version changes between builds and this may
   cause breaking changes in your application.
   node:latest :cross: node:21.0.1
3. Use small size official images instead of operating system  
   images as they may be bloated with tools and software not useful for us. Base images may also bring more security vulnerability attack surface. Use leaner images ex: Alpine tagged.
4. Optimize caching image layers - makes building images faster.
   when pulling docker images, unchanged layers are not downloaded.
   Once a layer changes all the following layers will also be rebuilt. So you need to optimize the order of the layers/commands
   in the docker file. Order your docker commands in dockerfile from least changing commands to most frequently changing commands.
5. Reduce the image size by leveraging **.dockerignore** file. For
   applications that requires us to  build and use the binary files, we can use multistage builds like in session5/code/backend
6. Do not use root users to run the docker containers. As root 
   users have elevated privilleges which would let the attacker getting control over the host instance/machine.
   #### Create group and user  
   `RUN groupadd -r tom && useradd -g tom tom`  
   #### Set ownership and permission  
   `RUN chown -R tom:tom /app`  
   #### switch to user
   `USER tom`
   #### proceed with rest of the dockerfile commands
7. Scan your images for vulnerabilities using
   `docker scan image:tag`  
   this requires logging in to docker hub(scanned in ECR also) 


# Docker swarm
Docker swarm is a service which allows users to create and manage a cluster of Docker nodes(Host machine, EC2, Virtual machines) and schedule containers.
Each node is a docker daemon and all docker daemons interact using the docker API
Docker swarm provides a single point of contact for all the containers running in a single host.
Docker swarm also takes backup and allows us to restore after a container fails.
It also allows us to schedule containers to run during node failures.
Features:
1. Decentralized access
2. High security
3. Auto load balancing
4. High scalability
5. Roll backs tasks
   
In Docker swarms,
 containers are launched using services(REST APIs)
 a service is a group of containers of the same image
 services enables to scale your application
 before you can deploy a service in docker swarm, you must have atleast one node deployed
 there are two types of nodes in docker swarm - Manager node and worker node.
 Manager node maintains cluster management tasks
 Worker nodes receive and execute instructions.
 every worker node has an agent that reports the state of the node's tasks to the manager.
 In docker swarm any services can be deployed and accessed by any node of same clusters.
 while creating a service, a user has to specify which container image to use
 A service is either global or replicated.
 A global service will run on every swarm node
 In a replicated service, the manager node distributes tasks to worker nodes.
 A task assigned to one node cannot be given to another node.

 Manager node has 
 1. API
 2. Orchestration
 3. Task Allocation
 4. Dispatcher and Scheduler
 Worker node
 1. checks for the tasks
 2. executes the tasks
https://youtu.be/lnVqEh6FOPE

