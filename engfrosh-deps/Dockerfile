FROM python:3.12-slim AS base

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    tzdata \
    libpq-dev \
    libmariadb-dev \
    pkg-config \
    build-essential \
    nginx \
    #gunicorn \
    #certbot \
    #python3-certbot-nginx \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash app

FROM base AS app

WORKDIR /app

RUN date +%s > /tmp/no_cache

RUN git clone --depth 1 --branch main https://github.com/engfrosh/engfrosh engfrosh \
    && cd engfrosh \
    && pip install --no-cache-dir --force-reinstall --break-system-packages -r requirements.txt \
    && cd .. && rm -rf engfrosh

RUN git clone --depth 1 --branch main https://github.com/engfrosh/discord-bot discord-bot \
    && cd discord-bot \
    && pip install --no-cache-dir --force-reinstall --break-system-packages -r requirements.txt \
    && cd .. && rm -rf discord-bot

RUN apt-get purge -y --auto-remove \
    build-essential \
    pkg-config \
 && rm -rf /var/lib/apt/lists/*

RUN chown -R app:app /app
RUN mkdir /usr/share/engfrosh_site && chown -R app:app /usr/share/engfrosh_site
RUN chown -R app:app /var/lib/nginx

USER app
WORKDIR /app