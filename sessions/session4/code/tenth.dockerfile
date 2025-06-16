FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

WORKDIR /app

ADD hello_world.py /app/

CMD ["python3", "hello_world.py"]

