FROM starefossen/github-pages:onbuild
RUN ruby -S gem install dotenv
