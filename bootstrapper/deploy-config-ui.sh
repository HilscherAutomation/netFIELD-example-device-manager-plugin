set -x

echo "create service-endpoint.js"

IP=$(ip addr  show dev eth0 | grep -Eo "inet \d*.\d*.\d*.\d" |  grep -Eo "(\d.*)*")
echo "our ip is: "$IP

echo "var serviceEndpoint = { \
  \"address\": $IP, \
  \"port\": 80 \
}; " > "$UI_SRC_PATH/service-endpoint.js"

echo "copying config ui to host fs ..."
mkdir -p /usr/local/share/cockpit/pythonhalloworld
cp -r $UI_SRC_PATH/* /usr/local/share/cockpit/pythonhalloworld/
 
echo " ... done copying  config ui to host fs"
