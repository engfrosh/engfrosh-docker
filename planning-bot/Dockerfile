FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN useradd -ms /bin/bash ubuntu
RUN apt-get update && apt-get upgrade -y && apt-get install -y git libpq-dev sudo python3 python3-pip
RUN cd /home/ubuntu && git clone https://github.com/engfrosh/planning-bot && cd planning-bot && pip install -r requirements.txt
COPY start.sh /home/ubuntu/start.sh
RUN chmod +x /home/ubuntu/start.sh
COPY environment /home/ubuntu/planning-bot/environment
RUN chown -R ubuntu:ubuntu /home/ubuntu

ENTRYPOINT ["/home/ubuntu/start.sh"]
