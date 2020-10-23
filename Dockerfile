FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    bluez \
    build-essential \
    curl \
    gawk \
    libbluetooth-dev \
    libboost-python-dev \
    libboost-thread-dev \
    libglib2.0-dev \
    pkg-config \
    python-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    bluepy \
    pexpect \
    pybluez

WORKDIR /root
COPY patchfile conv.awk post.sh ./

RUN curl -O https://raw.githubusercontent.com/OpenWonderLabs/python-host/master/switchbot_meter_py3.py \
  && patch < patchfile

HEALTHCHECK --interval=5m \
  CMD /bin/bash post.sh || exit 1
