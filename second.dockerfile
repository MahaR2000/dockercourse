# notice how we are using our newly created first image as base image.
FROM firstimage:latest

WORKDIR /app

# here we are using the COPY Command instead of ADD command
COPY hello_world_2.py  /app/

CMD ["python3", "hello_world_2.py"]
