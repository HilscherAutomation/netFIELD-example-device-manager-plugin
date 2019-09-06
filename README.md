# Hilscher cockpit plugin template

This template helps you create a cockpit plugin for the Hilscher Connect Gateway.


enter your the Menu name you wish to have in the uiplugin/manifest.json file in the "label" value.

enter the "start" file of your app in the uiplugin/manifest.json file in the "path" value.


adjust your dockerfile accordingly


then

# Docker build for arm

docker build < Dockerfile.arm32v7

or

# Docker build for x86

docker build < Dockerfile.x86

then

# Docker run 
```
docker run \
    -v /usr/local/share/cockpit:/usr/local/share/cockpit/ \
    -v /etc/gateway/mqtt-config.json:/etc/gateway/mqtt-config.json:ro \
    hilschercockpitpinger:latest
```
