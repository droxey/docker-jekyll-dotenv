FROM starefossen/ruby-node:2-6-alpine

# We don't change these settings much.
# Keep these environment variables local to Docker.
ENV JSON_GEM_VERSION 1.8.6
ENV GITHUB_GEM_VERSION 172

# Install all the prerequisites.
# Also install rails-dotenv.
# This package works in conjunction with _plugins/environment_variables.rb,
# and facilitates the autoloading of .env variables for use throughout your static site.
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    && gem install --verbose --no-document \
    json:${JSON_GEM_VERSION} \
    github-pages:${GITHUB_GEM_VERSION} \
    jekyll-github-metadata \
    minitest \
    dotenv-rails \
    && apk del build_deps \
    && apk add git \
    && mkdir -p /usr/src/app \
    && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

# Give Docker a directory for our GH Pages app to live.
WORKDIR /usr/src/app

# Open up ports 4000, 80 to serve the static site.
# Use http://localhost:40000 locally for development.
EXPOSE 4000 80

# Copy and execute the script that kicks off:
# 1. .env loading
# 2. jekyll server.
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
