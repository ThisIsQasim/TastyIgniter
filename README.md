# TastyIgniter Docker
[![Docker Pulls](https://img.shields.io/docker/pulls/thisisqasim/tastyigniter)](https://hub.docker.com/r/thisisqasim/tastyigniter/)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/thisisqasim/tastyigniter/latest)](https://hub.docker.com/r/thisisqasim/tastyigniter/tags)

Run with docker compose for automatic database configuration

    mkdir tastyigniter && cd tastyigniter
    curl -LO https://github.com/ThisIsQasim/TastyIgniter/raw/master/docker-compose.yml
    docker compose up -d
    docker compose exec app php artisan igniter:passwd admin
    
Browse to port 8001 of your docker host. The TastyIgniter setup wizard will show up. Wait for a minute for the database container to come up and then run the setup. 

## Credits
TastyIgniter: https://github.com/tastyigniter/TastyIgniter
