#!/bin/sh
echo "DEMO_VAR (.env): $DEMO_VAR"
jekyll serve -d /_site --watch --force_polling --incremental -H 0.0.0.0 -P 4000
