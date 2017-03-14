#!/usr/bin/env bash

rm -rf document/
gitbook build
mv _book document

tar cvfz - document | ssh root@120.27.125.176  "cd /usr/share/nginx/dist; rm -rf dist.tar.gz; tar xvfz -"
