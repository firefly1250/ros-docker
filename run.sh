xhost +local:root

docker-compose run \
    --rm \
    -u "$(id -u $USER):$(id -g $USER)" \
    ros \
    tmux
