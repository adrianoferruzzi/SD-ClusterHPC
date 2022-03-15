#!/bin/bash

# Configuração do NIS Server
sudo domainname master
sudo sed -i '-s/NISSERVER=false/NISSERVER=master' /etc/default/nis
sudo sed -i 's/0.0.0.0/#0.0.0.0/' /etc/ypserv.securenets
sudo sh -c "echo '255.255.255.0   10.0.10.0' >> /etc/ypserv.securenets"
sudo sed -i 's/MERGE_GROUP=false/MERGE_GROUP=true/' /var/yp/Makefile
sudo sed -i 's/MERGE_PASSWD=false/MERGE_PASSWD=true/' /var/yp/Makefile

sudo systemctl restart nis
sudo systemctl enable nis
cd /var/yp
sudo make 

echo ""
echo "Master node Configurado com Sucesso!!!"