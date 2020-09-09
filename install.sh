#!/bin/bash
# i3 setup script

add_ppa() {
  for i in "$@"; do
    grep -h "^deb.*$i" /etc/apt/sources.list.d/* > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
      echo "Adding ppa:$i"
      sudo add-apt-repository -y ppa:$i
    else
      echo "ppa:$i already exists"
    fi
  done
}


add_ppa ppa:kgilmer/speed-ricer

sudo apt update
sudo apt install i3-gaps dunst rofi xsettingsd lxappearance i3blocks

cp -lriv .config ~/

snap install spt
