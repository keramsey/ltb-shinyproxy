#!/bin/sh
# ***************************************************************************************
# Script to remove shinyproxy stack and toolbox image
#     Run script:
#         sh /opt/docker/landscapedatacommons/toolbox/src/remove-toolbox.sh
#
# ***************************************************************************************
# Remove any previously deployed stack
docker stack rm shinyproxy --orchestrator=swarm
# Wait for stack removal
sleep 60
# Remove old image
docker image rm landscapedatacommons/toolbox:2.6.1 -f
# Wait for image removal
sleep 240
# Remove stopped containers and dangling images
docker container prune -f
docker image prune -f