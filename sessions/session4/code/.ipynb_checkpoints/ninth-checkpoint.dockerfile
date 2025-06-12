FROM ubuntu:latest
LABEL com.personal.author="Khaleesi"
      
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

# cloning a remote repository into the WORKINGDIR
RUN git clone https://github.com/lzmkhan/dockercourse.git /app

WORKDIR app/sessions/session4/code

ENTRYPOINT ["python3", "bindmounts.py"]