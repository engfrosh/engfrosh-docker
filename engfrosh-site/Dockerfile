FROM engfrosh/engfrosh-deps

WORKDIR /app

RUN git clone --depth 1 --branch main https://github.com/engfrosh/engfrosh.git engfrosh \
    && cd engfrosh \
    && git submodule update --init --recursive

RUN cd engfrosh/engfrosh_site \
    && python3 manage.py makemigrations \
    && python3 manage.py migrate \
    && python3 manage.py collectstatic

COPY start.sh /app/start.sh
COPY environment /app/environment
COPY credentials.py /app/engfrosh/engfrosh_site/credentials.py
COPY server.engfrosh.com.conf /etc/nginx/sites-available/server.engfrosh.com
COPY nginx.conf /etc/nginx/nginx.conf

USER root
RUN ln -s /etc/nginx/sites-available/server.engfrosh.com /etc/nginx/sites-enabled \
    && rm /etc/nginx/sites-enabled/default
RUN chmod +x /app/start.sh
USER app

ENTRYPOINT ["/app/start.sh"]