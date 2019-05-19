# 创建网络
docker network create --driver bridge hello_network || true

# 构建前端
sudo cp -r ./client/dist /var/www/hello_docker_client
sudo cp -r ./client/Dockerfile /var/www/hello_docker_client
sudo cp -r ./client/nginx /var/www/hello_docker_client

# 拷贝后端目录
sudo cp -r ./server/* /var/www/hello_docker_server

cd /var/www/hello_docker_client

docker build -t hello_docker_client_image .

if [ ! "$(docker ps -q -f name=hello_docker_client_container)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=hello_docker_client_container)" ]; then
        docker rm hello_docker_client_container
    fi
    docker run -d -p 5001:8889 --name hello_docker_client_container --network hello_network hello_docker_client_image
fi

# 构建后端
cd /var/www/hello_docker_server

npm install

docker build -t hello_docker_server_image .

if [ ! "$(docker ps -q -f name=hello_docker_server_container)" ]; then
	if [ "$(docker ps -aq -f status=exited -f name=hello_docker_server_container)" ]; then
		docker rm hello_docker_server_container
	fi
	docker run -d -p 5002:8890 --name hello_docker_server_container --network hello_network hello_docker_server_image
fi

