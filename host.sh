#!/bin/bash

# Project variables.
URL=php70.example.com
CONTAINER_NAME=dockerphp70_php70web_1

# DO NOT EDIT BELOW

# Remove IP address entry for the host name.
sudo sed -i_bak -e "/$URL/d" /etc/hosts

# Add IP address to hosts file.
sudo bash -c "echo $( docker inspect -f '{{ .NetworkSettings.Networks.bridge.IPAddress }}' \
$CONTAINER_NAME) $URL >> /etc/hosts"

echo
echo Login to container: sudo docker exec -it $CONTAINER_NAME su - ubuntu
echo Opening site: xdg-open http://$URL
