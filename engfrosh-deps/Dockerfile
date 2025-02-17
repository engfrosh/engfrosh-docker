FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN useradd -ms /bin/bash ubuntu

RUN apt-get update && apt-get upgrade -y && apt-get install -y git libpq-dev sudo tzdata pkg-config libmysqlclient-dev
RUN cd /home/ubuntu && git clone https://github.com/carleton-student-engineering-society/nem-scav engfrosh && cd engfrosh && sh setup.sh && cd .. && rm -rf engfrosh && git clone https://github.com/engfrosh/discord-bot && cd discord-bot && pip install -r requirements.txt && cd .. && rm -rf discord-bot