#!/bin/sh

# Export .env contents at the bottom of .bashrc.
echo 'export $(cat .env)' >> ~/.bashrc

# Source it before we bring jekyll up.
# This command ensures bash loads the new environment variables.
source ~/.bashrc

# Finally, serve the site with jekyll.
# .env vars will be available for use in _config.yml.
# Exported keys (above) available when prefixed by ENV_.
jekyll serve -d /_site --watch --force_polling --incremental -H 0.0.0.0 -P 4000
