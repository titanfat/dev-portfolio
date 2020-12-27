
FROM ruby:2.6.3-alpine3.11

# hadolint ignore=DL3008,DL3018
RUN apk update && \
  apk add --update --no-cache \
    build-base \
    bash \
    curl \
    git \
    less \
    tzdata \
    mysql-dev && \
  rm -rf /var/cache/apk/*

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

ARG ARG_TZ=Asia/Tokyo
RUN cp /usr/share/zoneinfo/${ARG_TZ} /etc/localtime

ARG ARG_GEM_HOME=/bundle
ENV GEM_HOME=${ARG_GEM_HOME}

ENV BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3 \
  BUNDLE_PATH=${GEM_HOME} \
  BUNDLE_BIN=${GEM_HOME}/bin \
  BUNDLE_APP_CONFIG=${GEM_HOME} \
  LANG=C.UTF-8 \
  LC_ALL=C.UTF-8

ARG ARG_BUNDLER_VERSION="2.1.4"
RUN gem update --system && \
    gem install bundler:${ARG_BUNDLER_VERSION}

ENV APP_ROOT=/app
RUN mkdir ${APP_ROOT}
ENV PATH=${APP_ROOT}/bin:${BUNDLE_BIN}:${GEM_HOME}/gems/bin:${PATH}
WORKDIR ${APP_ROOT}

ENV RAILS_ENV=development

ARG ARG_COMPOSE_WAIT_VER=2.7.3
RUN curl -SL https://github.com/ufoscout/docker-compose-wait/releases/download/${ARG_COMPOSE_WAIT_VER}/wait -o /wait
RUN chmod +x /wait
