FROM ruby:2.5

# Install container dependencies
# RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get update && apt-get install -y libc-ares2 libv8-3.14.5 postgresql-client nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
# RUN update-alternatives --force --install /usr/bin/node node /usr/bin/nodejs 10

# Install Chrome to use with Capybara JavaScript specs
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable

# Set the work directory inside container
RUN mkdir /app
WORKDIR /app

# Copy the Gemfile inside the container
COPY Gemfile* /app/

# Install dependencies
RUN gem install bundler
RUN bundle install --jobs 32 --retry 4

# Copy all the rest inside work directory
COPY . /app
