#!/bin/sh

if [[ ! -d "$DEMO_VAR" ]]; then
    echo "DEMO_VAR (.env): $DEMO_VAR"
    echo 'export $(cat .env)' >> ~/.bashrc
    source ~/.bashrc
fi

jekyll serve -d /_site --watch --force_polling --incremental -H 0.0.0.0 -P 4000
