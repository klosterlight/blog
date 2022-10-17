FROM ruby:3.1.2
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
# Add a script to be executed every time the container starts.
RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
RUN chown -R $USER_ID:$GROUP_ID /usr/src/app
USER user
COPY Gemfile /usr/src/Gemfile
COPY Gemfile.lock /usr/src/Gemfile.lock
RUN bundle install
COPY . /usr/src/app

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
