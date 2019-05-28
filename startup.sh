#!/bin/bash
yum update -y
yum install wget java -y

# Check if need to format disk
if [ ! -f "/dev/sdm/server.jar" ]; then
    mkfs -t ext4 /dev/sdm
fi

mkdir /opt/minecraft
mount /dev/sdm /opt/minecraft
cd /opt/minecraft

if [ ! -f "server.jar" ]; then
    # version 1.14.2
    # Update link from this site https://www.minecraft.net/en-us/download/server/
    wget https://launcher.mojang.com/v1/objects/808be3869e2ca6b62378f9f4b33c946621620019/server.jar
    echo "eula=true" >> eula.txt
fi


nohup java -Xms4096M -Xmx4096M  -jar server.jar nogåui
