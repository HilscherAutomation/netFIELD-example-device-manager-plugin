# Docker run 
```
docker run \
    -v /usr/local/share/cockpit:/usr/local/share/cockpit/ \
    -v /etc/gateway/mqtt-config.json:/etc/gateway/mqtt-config.json:ro \
    hilschercockpitpinger:latest
```