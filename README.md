# Nginx and PHP7
On linux alpine based docker container with nginx and php7 (fpm).





## Getting started

```
web:
    image: mesa/alpine-nginx-php7:1.0.0
    ports:
      - "80:80"
    volumes:
        - "./var/www:/var/www"
        - "/etc/localtime:/etc/localtime"
```
