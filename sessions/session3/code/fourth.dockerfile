ARG VERSION=latest
FROM ubuntu:${VERSION}
# the args defined before FROM will not be available after FROM.
# you can use it if you define it again without any value like
# ARG VERSION
# this is just metadata information.
LABEL author="Khan" \
      description="Dockerfile for running a Python script with arguments" \
      version="1.0"

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

# defining ENV variables
ENV WORKINGDIR=/app

# cloning a remote repository into the WORKINGDIR
RUN git clone https://github.com/lzmkhan/dockercourse.git

# using the ENV variable
WORKDIR $WORKINGDIR

# Copying the hello_world_args.py script to the /app directory
COPY dockercourse/code/hello_world_args.py /app/

# Setting the default command to run the hello_world_args.py script with a default argument
CMD ["Hodor Lanister"]
# Setting the entry point to the hello_world_args.py script
ENTRYPOINT ["python3", "hello_world_args.py"]
# This Dockerfile sets up a Python environment, clones a repository, and prepares to run a script with an argument.
