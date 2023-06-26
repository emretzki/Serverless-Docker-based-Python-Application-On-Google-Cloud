# which version of python

FROM python:3.11.4-slim

# what code and docs
# Copy local_dit to container_dir
# COPY requirements.txt /app/requirements.txt
COPY . /app
WORKDIR /app/

# default linux installations
RUN apt-get update && \   
    apt-get install -y \
    build-essential \
    python3-dev \
    python3-setuptools \
    gcc \
    make

# create a virtualenv
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/python -m pip install pip --upgrade && \
    /opt/venv/bin/python -m pip install -r /app/requirements.txt

# make entrypoint executable
RUN chmod +x entrypoint.sh

# run the app
CMD ["./entrypoint.sh"]
