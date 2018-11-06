FROM ruby:2.3

RUN apt-get update && \
    apt-get install -y \
        wget \
        unzip \
        openssh-server \
        build-essential \
        libpq-dev \
        nodejs \
        libsasl2-dev \
        qt5-default \
        libqt5webkit5-dev

VOLUME /usr/src/app

COPY Gemfile Gemfile.lock  /usr/src/app/


WORKDIR /usr/src/app
RUN bundle install


ENV RAILS_ENV development

EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0"]
