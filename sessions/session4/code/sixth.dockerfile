FROM ubuntu:latest
LABEL com.personal.author="Hisenburg"
      
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

# cloning a remote repository into the WORKINGDIR
# RUN git clone https://github.com/lzmkhan/dockercourse.git /app
COPY hello_world_2.py /app/
# defining ENV variables
ENV TITLE=Session4

WORKDIR /app
# WORKDIR app/sessions/session4/code

# Setting the entry point to the hello_world_2.py script
# ENTRYPOINT ["python3", "hello_world_2.py"]
# This Dockerfile sets up a Python environment, clones a repository, and prepares to run a script with an argument.
ENTRYPOINT ["sh", "-c", "ls -la && python3 hello_world_2.py"]