FROM zrpaplicacoes/docker-in-rails:2.5.1

EXPOSE 3000
WORKDIR /home/app/web

COPY Gemfile .
COPY Gemfile.lock .

ENV RUNTIME_PACKAGES="alpine-sdk postgresql-client postgresql-dev nodejs nodejs-npm"

RUN apk add --no-cache $RUNTIME_PACKAGES && \
    bundle install;
