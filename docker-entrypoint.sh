#!/bin/sh
jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000
echo "DEMO_VAR (.env): $DEMO_VAR"