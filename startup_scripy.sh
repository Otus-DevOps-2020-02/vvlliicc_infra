#/bin/bash

#check updates and install rybu packages

apt update
apt install -y ruby-full ruby-bundler build-essential

#Install key and instaling mango database

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt update
apt install -y mongodb-org

# check service mongo  and enabled autorun mongo-db
systemctl start mongod
systemctl enable mongod

#donwload, install and run progect
cd ~
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
