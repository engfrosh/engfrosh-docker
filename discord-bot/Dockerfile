FROM engfrosh/engfrosh-deps

WORKDIR /app

RUN git clone --depth 1 --branch main https://github.com/engfrosh/discord-bot.git discord-bot \
    && cd discord-bot \
    && git submodule update --init --recursive

COPY start.sh /app/start.sh
COPY environment /app/discord-bot/environment
COPY configs.py /app/discord-bot/common_models/configs.py
COPY config /app/discord-bot/config

RUN cd discord-bot \
    && python3 manage.py makemigrations \
    && python3 manage.py migrate

USER root
RUN chmod +x /app/start.sh
USER app
WORKDIR /app/discord-bot

ENTRYPOINT ["/app/start.sh"]