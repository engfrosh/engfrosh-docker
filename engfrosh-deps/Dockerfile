FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV TZ="America/Toronto"

RUN useradd -ms /bin/bash ubuntu
RUN apt-get update && apt-get upgrade -y && apt-get install -y git libpq-dev sudo tzdata libmariadb-dev
RUN cd /home/ubuntu && git clone https://github.com/engfrosh/engfrosh.git && cd engfrosh && sh setup.sh && cd .. && rm -rf engfrosh && git clone https://github.com/engfrosh/discord-bot && cd discord-bot && pip install -r requirements.txt && cd .. && rm -rf discord-bot
