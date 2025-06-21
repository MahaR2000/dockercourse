ARG VERSION=latest
FROM ubuntu:${VERSION}
# the args defined before FROM will not be available after FROM.
# you can use it if you define it again without any value like
# ARG VERSION
# this is just metadata information.
LABEL com.personal.author="Khan"
      
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

# cloning a remote repository into the WORKINGDIR
RUN git clone https://github.com/MahaR2000/dockercourse.git /app

# defining ENV variables
ENV TITLE=Session4

WORKDIR app/sessions/session4/code

# Setting the entry point to the hello_world_2.py script
ENTRYPOINT ["python3", "hello_world_2.py"]
