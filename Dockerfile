FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

# COPY Gemfile Gemfile.lock iroha_sort.gemspec ./
COPY . .
RUN bundle install

COPY . .

CMD ["pry"]