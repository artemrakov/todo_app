FROM ruby:2.5.3-alpine3.9

RUN apk --no-cache add bash build-base tzdata postgresql-dev nodejs yarn

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler && bundle install

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
