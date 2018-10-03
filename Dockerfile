FROM zrpaplicacoes/docker-in-rails:2.5.1

EXPOSE 3000
WORKDIR /home/app/web

COPY Gemfile Gemfile.lock ./

ENV RUNTIME_PACKAGES="postgresql-client tzdata"

RUN apk add --no-cache $RUNTIME_PACKAGES;

RUN apk --update add --virtual build-dependencies alpine-sdk postgresql-dev nodejs nodejs-npm && \
    bundle install --without development test && \
    apk del build-dependencies;

COPY . ./

CMD ["bundle", "exec", "rails", "server"]

