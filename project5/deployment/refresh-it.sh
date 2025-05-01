#!/bin/bash

docker kill banana
docker rm banana
docker pull masedagr80ne/ceg3120:latest
docker run -d -p 80:4200 --name banana --restart=always masedagr80ne/ceg3120:latest
