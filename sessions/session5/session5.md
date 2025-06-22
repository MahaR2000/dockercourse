# Multi container applications
Till now we have handled individual containers, which is fine for small applications that could be run in single container.

In Real life, Applications are made up of multiple moving parts
each of which may be developed by different teams and may use different technologies.

In this scenario, it will be tedious to go and start each containers
for each moving parts. That is where Docker compose comes in help.

# What is docker compose?
Docker compose lets you define entire multi container applications
in a single YAML file called **compose.yaml**.
Benefits of docker compose:
1. lets you define all your containers in specific order.
2. lets you manage your network connections
3. allows you to scale individual containers 
4. allows you to implement persistent volumes with ease
5. you can set  your environment variables in compose file


# Lab

## build our frontend image
`cd frontend`
`sudo docker build -f frontend.Dockerfile -t frontendimage .`

## build our backend image
`cd backend`
`sudo docker build -f backend.Dockerfile -t backendimage .`
`cd ..`

## build our database image
`cd database`
`sudo docker build -f database.Dockerfile -t databaseimage .`

## Order in which the container has to run.
1. our frontend depends on backend
2. our backend server fetches and writes data to database

So first we need to run our database container
second we need to run our backend server
third we need to run our frontend.

If you get port 80 in use do the following commands in ubuntu:
`sudo systemctl kill apache2`


# Lets run the containers
`sudo docker run -p 80:80 frontendimage`

`sudo docker network create my_network`

`sudo docker network ls`

`sudo docker run --name backend_database -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password databaseimage`

`sudo docker network connect my_network backend_database`

`sudo docker run --network=my_network -p 8080:8080 backendimage`


Homework: 
What could go wrong when you run backend server and frontend before running the database? Try it out. You can try to add a user.

# lets remove all docker containers
`sudo docker stop $(docker ps -a -q)`
`sudo docker rm $(docker ps -a -q)`

## look at docker-compose.yaml

## to startup containers in YAML file:
`sudo docker compose up --build`

## to stop 
`sudo docker compose down`