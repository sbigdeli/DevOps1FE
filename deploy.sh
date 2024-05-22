#!/bin/bash

# Kompliera chmod
# chmod +x deploy.sh

# Bygg Docker-image
docker build -t frontend .

# Kontrollera om container redan körs och stoppa den
if [ $(docker ps -q -f name=container_frontend) ]; then
    docker stop container_frontend
    docker rm container_frontend
fi

# Starta en ny container
docker run -d -p 80:80 --name container_frontend frontend