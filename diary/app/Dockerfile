FROM tdiary/tdiary

ENV GROUP_NAME=tdiary \
    USER_NAME=tdiary

ARG APP_UID
ARG APP_GID

RUN groupadd -g $APP_GID tdiary && \
    useradd -u $APP_UID -g $APP_GID -m tdiary && \
    chown -R $APP_UID:$APP_GID /usr/src/app

USER tdiary
