#!/bin/bash

#cambios en el sources.lst
#backup del anterior
cp /etc/apt/sources.list /etc/apt/sources.list-bak
sed -i 's/ar.archive/old-releases/g' /etc/apt/sources.list
sed -i 's/archive/old-releases/g' /etc/apt/sources.list
cat /etc/apt/sources.list

sudo apt-get update
#ingreso de nuevos sources en el nuevo archivo
#echo "deb http://packages.medibuntu.org/ hardy free non-free" >> /etc/apt/sources.list-new
#copia del nuevo en el viejo
#mv /etc/apt/sources.list-new /etc/apt/sources.list

# Array de apps y librerias necesarias
apps=(

curl
automake
libgdbm-dev 
libncurses5-dev
libtool 
bison 
libffi-dev

)

# bucle para instalar las aplicaciones con 'yes' pa instalar de una
for app in "${apps[@]}"
do
apt-get install $app -y
done

# Obtenemos ruby
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc

# instalamos ruby
rvm install 2.0.0-p451
rvm use 2.0.0-p451 --default

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
#Para instalar rails
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
#Instalamos rails
gem install rails
#Comprobamos version
rails -v

# recordad darle permisos de escritura: sudo chmod 755 scrip_instalacion_ROR.sh
# AUTOR: el sapox
