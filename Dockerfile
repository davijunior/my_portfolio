FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /my_portfolio
COPY Gemfile /my_portfolio/Gemfile
COPY Gemfile.lock /my_portfolio/Gemfile.lock
RUN gem install bundler:2.5.21
RUN bundle install
COPY . /my_portfolio
RUN bundle exec rails db:create db:migrate
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
