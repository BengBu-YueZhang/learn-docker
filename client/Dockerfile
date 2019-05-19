FROM nginx

COPY ./* /var/www/hello_docker_client/

COPY ./nginx/hello_docker.conf /etc/nginx/conf.d/

RUN service nginx restart