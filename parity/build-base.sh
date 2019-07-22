#!/usr/bin/env bash


docker build -f Dockerfile.base-parity --tag alexbaloc/parity-private:latest . 

# TODO: login to dockerhub with the appropriate (alexbaloc) account

docker login --username alexbaloc

docker push alexbaloc/parity-private:latest
