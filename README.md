# TastyIgniter Docker

clone the repo

    git clone https://github.com/ThisIsQasim/TastyIgniter

Run with docker compose for automatic database configuration

    cd TastyIgniter
    docker compose up -d
    docker compose exec app php artisan igniter:passwd admin
    
Browse to port 8001 of your docker host and setup

## Credits
TastyIgniter: https://github.com/tastyigniter/TastyIgniter
