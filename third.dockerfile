# here we are basing the second image as our base image.
FROM secondimage:latest

WORKDIR /app

# Notice how we are not copying anything to /app directory in this file
# because we already have the python files from the second image.

# here using CMD, i am setting default argument for the script
CMD ["Hodor Lanister"]

# while running the container, we can override the default argument
# Ex docker run thirdimage "khan" will print 'Hello world khan' instead of 'Hello world hodor lanister'

# Here we are setting the image entry point to hello_world_args.py, so when you run docker container, 
# it will call the hello_world_args.py script with the arguments provided in CMD or overridden at runtime.
ENTRYPOINT ["python3", "hello_world_args.py"]