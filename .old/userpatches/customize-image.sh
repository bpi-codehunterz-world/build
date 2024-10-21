#!/bin/bash
# customize-image.sh
apt-get update
apt-get install -y make cmake build-essent* sof*prop*c* swig htop mariadb-client aircrack-ng nmap traceroute whois net-tools mariadb-server wget curl git python3-dev python3-pip python3-venv npm nodejs ufw openssh-server gcc clang git unzip libc6-dev 

git clone https://github.com/bpi-codehunterz-world/WiringBP.git -b bananapi
git clone https://github.com/bpi-codehunterz-world/BPI-WiringPi2
git clone https://github.com/bpi-codehunterz-world/BPI-WiringPi2-Python
git clone https://github.com/bpi-codehunterz-world/BPI-WiringPi2-Ruby.git
git clone https://github.com/bpi-codehunterz-world/BPI-WiringPi2-PHP
git clone https://github.com/bpi-codehunterz-world/BPI-WiringPi2-Perl
git clone https://github.com/bpi-codehunterz-world/BPI-WiringPi2-Node
git clone https://github.com/bpi-codehunterz-world/RPi.GPIO

me=$(whoami)
sudo chmod 777 -R ../*
sudo chown $me -hR ../*
cd BPI-WiringPi2
sudo ./build
sudo rm -rf /etc/ld.so.conf
cat <<EOF >> /etc/ld.so.conf
include /etc/ld.so.conf.d/*.conf
/usr/local/lib
EOF
sudo ldconfig
cd wiringPi
make static
sudo make install-static
cd ..
cd BPI-WiringPi2-Python
sudo python3 setup.py install
rm -rf build.sh
cat <<EOF >> build.sh
swig -python wiringpi.i
sudo python3 setup.py build install
EOF
sudo rm -rf Makefile
cat <<EOF >> Makefile
all: bindings
	python3 setup.py build

bindings:
	swig -python wiringpi.i

install:
	sudo python3 setup.py install
EOF
sudo chmod 777 -R ../*
sudo make
sudo make install
cd ..
cd RPi.GPIO
sudo python3 setup.py install
sudo pip3 install .
sudo pip install .
sudo useradd -m blackleakzpi
sudo gpasswd -a blackleakzpi sudo
sudo gpasswd -a blackleakzpi gpio
sudo gpasswd -a blackleakzpi pi
sudo gpasswd -a blackleakzpi spi
sudo gpasswd -a blackleakzpi i2c
sudo gpasswd -a blackleakzpi www-data
