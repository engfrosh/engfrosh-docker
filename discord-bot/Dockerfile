FROM engfrosh/engfrosh-deps

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV TZ="America/Toronto"

RUN apt-get update && apt-get upgrade -y && apt-get install -y git libpq-dev sudo python3 python3-pip tzdata libmysqlclient-dev
RUN cd /home/ubuntu && git clone https://github.com/carleton-student-engineering-society/nem-scav-discord-bot discord-bot && cd discord-bot && pip install -r requirements.txt && git submodule init && git submodule update
COPY start.sh /home/ubuntu/start.sh
RUN chmod +x /home/ubuntu/start.sh
COPY environment /home/ubuntu/discord-bot/environment
COPY configs.py /home/ubuntu/discord-bot/common_models/configs.py

RUN cd /home/ubuntu/discord-bot/ && python3 manage.py makemigrations && python3 manage.py migrate

RUN chown -R ubuntu:ubuntu /home/ubuntu

ENTRYPOINT ["/home/ubuntu/start.sh"]
