FROM engfrosh/engfrosh-deps

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN cd /home/ubuntu && git clone https://github.com/engfrosh/engfrosh.git && cd engfrosh && git submodule init && git submodule update && pip3 install -r requirements.txt && cd engfrosh_site && python3 manage.py migrate && python3 manage.py collectstatic && chown -R ubuntu:www-data /home/ubuntu
COPY start.sh /home/ubuntu/start.sh
COPY environment /home/ubuntu/environment
COPY nginx.conf /etc/nginx/sites-available/heads.engfrosh.com
RUN ln -s /etc/nginx/sites-available/heads.engfrosh.com /etc/nginx/sites-enabled && rm /etc/nginx/sites-enabled/default
COPY credentials.py /home/ubuntu/engfrosh/engfrosh_site/credentials.py
RUN chmod +x /home/ubuntu/start.sh
RUN chmod +x /home/ubuntu/environment
RUN rm -f /home/ubuntu/engfrosh/engfrosh_site/engfrosh_site.sock

ENTRYPOINT ["/home/ubuntu/start.sh"]
