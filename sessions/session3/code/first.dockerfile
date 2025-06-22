FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

WORKDIR /app

ADD hello_world.py hello_world_args.py /app/

RUN groupadd -r tom && useradd -g tom tom

RUN chown -R tom:tom /app

USER tom

CMD ["python3", "hello_world.py"]

