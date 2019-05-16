# nginx作为父镜像
FROM nginx

# 拷贝前端资源到nginx.conf中root文件夹中
COPY ./dist/* /var/www/hello_docker

# 拷贝nginx的配置
COPY ./nginx/default.conf /etc/nginx/nginx.conf