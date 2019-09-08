#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

EMAIL=$(jq --raw-output ".email" $CONFIG_PATH)
PWD=$(jq --raw-output ".pwd" $CONFIG_PATH)
MQTTENABLED=$(jq --raw-output ".mqttenabled" $CONFIG_PATH)
MQTTURL=$(jq --raw-output ".mqtturl" $CONFIG_PATH)
MQTTTOPIC=$(jq --raw-output ".mqtttopic" $CONFIG_PATH)
LOGLEVEL=$(jq --raw-output ".loglevel" $CONFIG_PATH)
SCHEDULERENABLED=$(jq --raw-output ".scheduler_enabled" $CONFIG_PATH)
CRON=$(jq --raw-output ".cron" $CONFIG_PATH)
WEATHERPROVIDER=$(jq --raw-output ".weather_provider" $CONFIG_PATH)
APIKEY=$(jq --raw-output ".apikey" $CONFIG_PATH)
LATITUDE=$(jq --raw-output ".latitude" $CONFIG_PATH)
LONGITUDE=$(jq --raw-output ".longitude" $CONFIG_PATH)
EARLIESTSTART=$(jq --raw-output ".earliest_start" $CONFIG_PATH)
LATESTSTOP=$(jq --raw-output ".latest_stop" $CONFIG_PATH)
STARTEARLY=$(jq --raw-output ".start_early" $CONFIG_PATH)
OFFDAYS=$(jq --raw-output ".off_days" $CONFIG_PATH)
SQUAREMETERS=$(jq --raw-output ".square_meters" $CONFIG_PATH)
PERHOUR=$(jq --raw-output ".per_hour" $CONFIG_PATH)
MOWTIME=$(jq --raw-output ".mow_time" $CONFIG_PATH)
CHARGETIME=$(jq --raw-output ".charge_time" $CONFIG_PATH)
DAYSFORTOTALCUT=$(jq --raw-output ".days_for_total_cut" $CONFIG_PATH)
RAINDELAY=$(jq --raw-output ".rain_delay" $CONFIG_PATH)
THRESHOLD=$(jq --raw-output ".threshold" $CONFIG_PATH)

# set options
sed -i "s|%%EMAIL%%|$EMAIL|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%PWD%%|$PWD|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%MQTTENABLED%%|$MQTTENABLED|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%MQTTURL%%|$MQTTURL|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%MQTTTOPIC%%|$MQTTTOPIC|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%LOGLEVEL%%|$LOGLEVEL|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%SCHEDULERENABLED%%|$SCHEDULERENABLED|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%CRON%%|$CRON|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%WEATHERPROVIDER%%|$WEATHERPROVIDER|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%APIKEY%%|$APIKEY|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%LATITUDE%%|$LATITUDE|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%LONGITUDE%%|$LONGITUDE|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%EARLIESTSTART%%|$EARLIESTSTART|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%LATESTSTOP%%|$LATESTSTOP|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%STARTEARLY%%|$STARTEARLY|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%OFFDAYS%%|$OFFDAYS|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%SQUAREMETERS%%|$SQUAREMETERS|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%PERHOUR%%|$PERHOUR|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%MOWTIME%%|$MOWTIME|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%CHARGETIME%%|$CHARGETIME|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%DAYSFORTOTALCUT%%|$DAYSFORTOTALCUT|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%RAINDELAY%%|$RAINDELAY|g" /usr/src/landroid-bridge/config.json
sed -i "s|%%THRESHOLD%%|$THRESHOLD|g" /usr/src/landroid-bridge/config.json

# start server
cd /usr/src/landroid-bridge
exec node dist/server.js
exec node dist/server.js
