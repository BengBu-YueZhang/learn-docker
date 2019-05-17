# nginx作为父镜像
FROM nginx

# 拷贝前端资源到nginx.conf中root文件夹中
COPY ./* /var/www/hello_docker/

# 添加nginx的配置，不是直接覆盖
COPY ./nginx/hello_docker.conf /etc/nginx/conf.d/

# 重启nginx服务器
RUN service nginx restart