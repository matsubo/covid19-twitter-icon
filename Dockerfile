FROM ruby:4-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends imagemagick libmagickwand-dev pngquant zip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' \
    && bundle install --jobs 4

COPY . .

RUN mkdir -p output

CMD ["bundle", "exec", "ruby", "main.rb"]
