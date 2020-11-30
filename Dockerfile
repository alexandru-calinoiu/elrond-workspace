FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
	git-core \
	build-essential \
	libssl-dev \
	libffi-dev \
	wget \
	python3 \
	python3-pip \
	python3-venv

RUN pip3 install wheel

RUN useradd -ms /bin/bash elrond
USER elrond

WORKDIR /home/elrond

RUN wget -O erdpy-up.py https://raw.githubusercontent.com/ElrondNetwork/elrond-sdk/master/erdpy-up.py
RUN python3 erdpy-up.py
