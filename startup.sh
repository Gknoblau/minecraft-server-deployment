#!/bin/bash -v
yum update -y
yum install wget java -y

cd /home/ec2-user
wget https://launcher.mojang.com/v1/objects/ed76d597a44c5266be2a7fcd77a8270f1f0bc118/server.jar
echo "eula=true" >> eula.txt
nohup java -Xmx1024M -Xms1024M -jar server.jar nogui