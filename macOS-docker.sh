#!/bin/bash

echo "==============================="
echo "       PULL docker image       "
echo "==============================="
docker pull grssalex/grssalex-docker:latest

echo "==============================="
echo "       RUN docker image        "
echo "==============================="
echo "YOU ARE IN ./ DIRECTORY. GO TO ./FILES TO ACCESS DIRECTORY COMPUTER FILES"
echo "==============================="
echo "       AUTHOR : GRSSALEX       "
echo "==============================="
docker run -it -v "$(pwd)":/files grssalex/grssalex-docker:latest