# Nginx and PHP7
An alpine linux based docker container with nginx and php7 (fpm) inside.
Also composer is already included.


## Getting started
Create your the docker-compose.yml in you project and paste these lines, or copy the content of [docker-compose.demo.yml](https://raw.githubusercontent.com/Mesa/alpine-nginx-php7/master/docker-compose.demo.yml) :
```
web:
    image: mesa/alpine-nginx-php7:1.0.1
    ports:
      - "80:80"
    volumes:
        - "./var/www:/var/www"
```

then run 

    docker-compose up
    
and you are ready to go, just visit [http://localhost](http://localhost) and you will see the output of phpinfo().

## More PHP Extensions

If you need a php extension and you will, because I added only PHP7-fpm and some packages I require for most of my container.
I you need more packages just let me know or extend this container and install all the packages you require.

Your Dockerfile could look like this. 

```Dockerfile
    FROM mesa/alpine-nginx-php7
    RUN apk add --no-cache \
        php7-bcmath \
        bash \
        curl \
        unzip
        
    COPY ./var /var
```
You can find the packages for alpine at [pkgs.alpinelinux.org](https://pkgs.alpinelinux.org/packages?name=php7*&branch=&repo=&arch=&maintainer=).

##### License #####
The MIT License (MIT)