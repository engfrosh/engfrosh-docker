FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN useradd -ms /bin/bash ubuntu
RUN apt-get update && apt-get upgrade -y && apt-get install -y git libpq-dev sudo
RUN cd /home/ubuntu && git clone https://github.com/engfrosh/engfrosh.git && cd engfrosh && sh setup.sh && cd engfrosh_site && python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py collectstatic
COPY start.sh /home/ubuntu/start.sh
COPY environment /home/ubuntu/environment
COPY nginx.conf /etc/nginx/sites-available/heads.engfrosh.com
RUN ln -s /etc/nginx/sites-available/heads.engfrosh.com /etc/nginx/sites-enabled && rm /etc/nginx/sites-enabled/default
RUN mkdir -p /home/ubuntu/.aws/
COPY credentials /home/ubuntu/.aws/credentials
COPY credentials.py /home/ubuntu/engfrosh/engfrosh_site/credentials.py
RUN chmod +x /home/ubuntu/start.sh
RUN chmod +x /home/ubuntu/environment
RUN rm -f /home/ubuntu/engfrosh/engfrosh_site/engfrosh_site.sock
RUN chown -R ubuntu:www-data /home/ubuntu

ENTRYPOINT ["/home/ubuntu/start.sh"]
