export DEBIAN_FRONTEND=noninteractive
mkdir /home/ubuntu/.ssh/
until ping -c1 www.google.com >/dev/null 2>&1; do :; done
apt-get update 
apt-get install -y curl