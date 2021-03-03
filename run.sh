# This script launches a docker instance

xhost +local:docker

docker-compose run duckietownsim
docker-compose stop duckietownsim
