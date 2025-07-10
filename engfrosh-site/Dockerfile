FROM cses/nem-deps

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update && apt-get upgrade -y && apt-get install -y git libpq-dev sudo tzdata libmariadb-dev
RUN cd /home/ubuntu && git clone https://github.com/carleton-student-engineering-society/nem-scav engfrosh && cd engfrosh && sh setup.sh && cd engfrosh_site && python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py collectstatic

COPY start.sh /home/ubuntu/start.sh
COPY environment /home/ubuntu/environment
COPY nginx.conf /etc/nginx/sites-available/heads.engfrosh.com
RUN ln -s /etc/nginx/sites-available/heads.engfrosh.com /etc/nginx/sites-enabled && rm /etc/nginx/sites-enabled/default
COPY credentials.py /home/ubuntu/engfrosh/engfrosh_site/credentials.py
RUN chmod +x /home/ubuntu/start.sh
RUN chmod +x /home/ubuntu/environment
RUN rm -f /home/ubuntu/engfrosh/engfrosh_site/engfrosh_site.sock

ENTRYPOINT ["/home/ubuntu/start.sh"]
