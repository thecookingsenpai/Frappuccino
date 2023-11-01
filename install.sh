#!/bin/bash

USER=$(whoami)

if ! [ -d "/home/$USER/frappuccino" ]; then
    echo "ERROR: You must have frappuccino in:"
    echo "/home/$USER/frappuccino"
    exit
fi

echo "Hello, $USER! Let's install Frappuccino and keep your system wide awake!"

if [ -f /etc/systemd/system/frappuccino.service ]; then
    echo "You have already a frappuccino.service installed."
    echo "To force this new installation, execute:"
    echo "sudo rm -rf /etc/systemd/system/frappuccino.service"
    exit
fi

PRIVILEGES=$(id -u)

if [ $PRIVILEGES -eq 0 ]; then
    echo "You are using root. This is supported but not necessary. We advise you to use your user."
    echo "Press CTRL+C in 5 seconds to exit..."
    sleep 7
fi

echo "Everything seems to be nice and packed! Let's a go!"
echo "First, we need to check that we have the needed files"

if ! [ -f "./hots.sh"  ]; then
    echo "Missing hots.sh file. Please redownload."
    exit
fi

if ! [ -f "./inhibitor.sh" ]; then
    echo "Missing inhibitor.sh file. Please redownload."
    exit
fi

if ! [ -f "./frappuccino.service" ]; then
    echo "Missing frappuccino.service. Please redownload."
    exit
fi

echo "We do have the files indeed."
echo "Setting up the service..."

echo "Requesting privileges..."
sudo echo "Privileges acquired"

cp ./frappuccino.service ./frappuccino.service.bak
sed -i "s/USERNAMEPLACEHOLDER/$(whoami)/g" frappuccino.service
sudo mv frappuccino.service /etc/systemd/system/frappuccino.service
cp ./frappuccino.service.bak ./frappuccino.service
sudo systemctl daemon-reload
sudo systemctl enable frappuccino.service
sudo systemctl start frappuccino.service

echo "If everything is alright, you should see a green 'active' text now."
sleep 2
sudo systemctl status frappuccino.service

