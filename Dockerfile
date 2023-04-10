
# syntax=docker/dockerfile:1
FROM ruby:3.2.2
RUN apt-get update 
WORKDIR /app
COPY . .
RUN gem install bundler
RUN bundle install


# Configure the main process to run when running the image
CMD ["rails", "s"]