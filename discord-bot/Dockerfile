FROM engfrosh/engfrosh-deps

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN cd /home/ubuntu && git clone https://github.com/engfrosh/discord-bot && cd discord-bot && pip install -r requirements.txt && git submodule init && git submodule update && chown -R ubuntu:ubuntu /home/ubuntu
COPY start.sh /home/ubuntu/start.sh
RUN chmod +x /home/ubuntu/start.sh
COPY environment /home/ubuntu/discord-bot/environment
COPY configs.py /home/ubuntu/discord-bot/common_models/configs.py

RUN cd /home/ubuntu/discord-bot/ && python3 manage.py makemigrations && python3 manage.py migrate

ENTRYPOINT ["/home/ubuntu/start.sh"]
