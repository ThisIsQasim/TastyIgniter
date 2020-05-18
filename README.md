# TastyIgniter Docker
[![Docker Pulls](https://img.shields.io/docker/pulls/thisisqasim/tastyigniter)](https://hub.docker.com/r/thisisqasim/tastyigniter/)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/thisisqasim/tastyigniter/latest)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/thisisqasim/tastyigniter)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/thisisqasim/tastyigniter)

Run with docker compose for automatic database configuration

    mkdir tastyigniter
    curl -LO https://github.com/ThisIsQasim/TastyIgniter/raw/master/docker-compose.yml
    docker-compose up -d
    
Browse to port 8001 of your docker host and setup


Alternatively if you don't want to use docker compose you can run it manually

    docker run -d -p 80:80 thisisqasim/tastyigniter
    
Run the setup and connect to a mysql db.

## Credits
TastyIgniter: https://github.com/tastyigniter/TastyIgniter
