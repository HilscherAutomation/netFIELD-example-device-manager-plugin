# netFIELD cockpit plugin template

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

This template helps you create a cockpit plugin for the Hilscher Connect Gateway.


enter your the Menu name you wish to have in the *uiplugin/manifest.json* file in the *label* value.

enter the *start* file of your app in the *uiplugin/manifest.json* file in the *path* value.


adjust your dockerfile accordingly


then

## Docker build for arm

```docker build --rm -f "Dockerfile.arm32v7" -t hilschercockpitpinger:latest```

or

## Docker build for x86

```docker build --rm -f "Dockerfile.x86" -t hilschercockpitpinger:latest```

then

## Docker run 
```
docker run \
    -v /usr/local/share/cockpit:/usr/local/share/cockpit/ \
    -v /etc/gateway/mqtt-config.json:/etc/gateway/mqtt-config.json:ro \
    hilschercockpitpinger:latest
```
