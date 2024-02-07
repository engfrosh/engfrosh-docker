FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV TZ="America/Toronto"

RUN useradd -ms /bin/bash ubuntu
RUN apt-get update && apt-get upgrade -y && apt-get install -y git libpq-dev sudo tzdata libmariadb-dev
RUN cd /home/ubuntu && git clone https://github.com/carleton-student-engineering-society/nem-scav engfrosh && cd engfrosh && sh setup.sh
RUN rm -rf /home/ubuntu/engfrosh
