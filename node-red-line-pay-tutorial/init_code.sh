#!/bin/bash

# Clone playground
git clone https://github.com/Miura55/node-red-playeground-with-mongodb playground
cd playground

# Set the password for Node-RED
npm install bcryptjs
YOUR_NODERED_PASSWORD=$(openssl rand -base64 12 | fold -w 10 | head -1)
UI_NODERED_PASSWORD_CRYPT=$(node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" ${YOUR_NODERED_PASSWORD})

# Delete .env file if it exists
if [ -e ".env" ]; then
    rm .env
fi

# Write password to .env file
echo "NODE_RED_PASSWORD='${UI_NODERED_PASSWORD_CRYPT}'" >>.env

docker-compose up -d
clear
docker-compose run --rm mongodb /tmp/createNodeREDUser.sh shop

echo "Your Node-RED password:${YOUR_NODERED_PASSWORD}"
