# Build and deploy ltb-shinyproxy image
1. Open ssh terminal to server
2. Change to container folder
```sh
cd /opt/docker/landscapedatacommons/ltb-shinyproxy
```
3. Pull base image
```sh
docker pull openanalytics/shinyproxy:2.6.1
```
4. Pull tool images
```sh
docker pull landscapedatacommons/sp-balanced-design-tool:4.2.2
docker pull landscapedatacommons/sp-benchmark-exploration-tool:4.2.2
docker pull landscapedatacommons/sp-rangeland-indicator-calculator:4.2.2
```
5. Build image
```sh
docker build --no-cache -t landscapedatacommons/ltb-shinyproxy:2.6.1 .
```
6. Push image to Docker Hub
```sh
docker login
docker push landscapedatacommons/ltb-shinyproxy:2.6.1
```
7. Create network (if it does not exist)
```sh
docker network create --driver=overlay --attachable shiny-net
```
8. Deploy stack
```sh
DOMAIN=ltb-shinyproxy.jornada-swhub.nmsu.edu PORT=8075 docker stack deploy -c ltb-shinyproxy.yml ltb-shinyproxy
```