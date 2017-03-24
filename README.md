# TastyIgniter Docker

clone the repo

    git clone https://github.com/ThisIsQasim/TastyIgniter

build the docker image

    cd TastyIgniter
    docker build -t TastyIgniter .
    
Run the docker

    docker run -d -p 80:80 TastyIgniter
    
Run the setup, connect to db and you're done.
