

## LAB:

### Lets build fifth.dockerfile:  
`docker build -f fifth.dockerfile -t fifthimage .`  

### lets run the container
`docker run fifthimage`

### and now with environment variable override:
`docker run -e TITLE=GameOfThrones fifthimage`  

### lets build sixth.dockerfile
`docker build -f sixth.dockerfile -t sixthimage .`  

### lets run the container
`docker run --name six sixthimage`

### What if we want to stop the container
`sudo docker stop six`

the program still count downs to 0.  

### start the container again  
`sudo docker start six`

### Now use kill command 
`sudo docker kill six`
program immediately ends.

The difference between stop and kill is that stop is soft process
means your program can accept certain signals to stop. during the stop
the program can take necessary steps to cleanup like closing a database connection
while killing a container abruptly kills the process running in the container.
database connections are left open.
Use stop to gracefully stop the container while use kill to end container abruptly.
When using stop, docker waits for the program to end before stopping the container
while kill immediately kills the container.

### To show all objects with a given label, specify the label's key name without the value:  
`docker ps --filter "label=com.example.demo"  `
`docker images --filter "label=com.example.demo"  `

### To filter container where author is khan  
`docker ps --filter "label=com.personal.author=Khan" -a`

### To filter container where author is hisenburg  
`docker ps --filter "label=com.personal.author=Hisenburg" -a`  

### to view labels  
`docker inspect six`  

### restarting a container  
`sudo docker restart six`

### to clear build cache:
`docker builder prune`.
`
### Remove local containers that are stopped
`docker container prune`

`docker image remove fifthimage:latest`    
will remove only image named "fifthimage:latest"    

### Remove local images  
`sudo docker image prune -a`  
-a means all , only works when there is no container using the images. first
remove the container before image



# Persisting data in docker containers

Good to read:  
https://dev.to/subham_nandi/docker-day-5-1c2a

As we have learned in previous sessions:
docker containers are immutable
This immutability provides us consistent behaviour across environments
But this comes at a price
Since the containers are immutable, any changes needs to be done, we need to
redeploy the container with new configuration or rebuild image and redeploy.

This may make docker no suitable for persisted data applications
like databases which stores data.
When a database container crashes or re deployed, all the data is lost.

The containers are provided with ephimeral storage. This storage is the **writable
container layer** which only retains data only during their lifecycle. so the data
in these containers will be lost if its crashes or redeployed or stopped.**data volatility**

There is a reason for this as to make containers more secure and isolated from
the host.

To handle this problem:
Docker provides Docker volumes and bind mounts

## Docker Volumes:
Volumes are stored in a part of host file system(aka our ec2 machines)
Its managed by docker
can be created by volume command in docker file
Volumes can be shared between multiple docker containers
Will not be destroyed when user destroy the containers
Can be used in dockerfile(because we create the volumes)

### Docker volume commands

#### Create a volume
`sudo docker volume create myvolume`  
This will create a volume in the host file system

#### Create volume while running the container
`sudo docker run -v myvolume:/mydockervolumes imagename`

#### list all volumes
`sudo docker volume ls`  

#### Remove a volume
`sudo docker volume rm <volumne_name or id>  
this only works when volume is not attached to any running containers

#### Remove all unused volumes
`sudo docker volume prune`


## Docker bind mounts  
Used to mount a file or directory from host machine in to a container
Difference between bind mounts and volumes is that when we use volume, if the
volume does not exist, it is created automatically, while a bind mount will 
throw error. 
Non docker process can access files/directory that is used in bind mount.
bind mounts cant be used in dockerfile(we use existing files/directory)
Uses:
sharing config files between host and containers
sharing source code or build artifacts between development environment on host
and container.


## Lab - docker volumes

### Create a volume:
`docker volumne create todo-db`




