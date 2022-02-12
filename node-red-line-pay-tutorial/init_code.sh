#!/bin/bash

# Clone playground
git clone https://github.com/Miura55/node-red-playeground-with-mongodb playground
cd playground
sudo chmod -R 777 ./

# Set the password for Node-RED
npm install bcryptjs
YOUR_NODERED_PASSWORD=$(more /dev/urandom | tr -d -c '[:alnum:]' | fold -w 10 | head -1)
UI_NODERED_PASSWORD_CRYPT=$(node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" ${YOUR_NODERED_PASSWORD})

sed -i -e "s/\/\/adminAuth:/adminAuth:{\x0A\
        type: \"credentials\",\x0A\
        users: [{\x0A\
            username: \"admin\",\x0A\
            password: process.env.NODE_RED_PASSWORD,\x0A\
            permissions: \"*\"\x0A\
        }]\x0A\
    },\x0A\
    \/\/adminAuth:/" $YOUR_NODERED_SETTING_DIR

sed -i -e "s*process.env.NODE_RED_PASSWORD*\"$UI_NODERED_PASSWORD_CRYPT\"*" nodered/settings.js

docker-compose up -d
clear
echo "Your Node-RED password:${YOUR_NODERED_PASSWORD}"

# Set DB user for Node-RED
docker-compose run --rm mongodb /tmp/createNodeREDUser.sh shop
