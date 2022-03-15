#/bin/bash 

# Atualiza pacotes
sudo apt-get update
sudo apt-get upgrade

# Ajustando o hostname
hostnamectl set-hostname master

# Corrigindo timezone
sudo timedatectl set-timezone America/Sao_Paulo

## Editando o hosts 
sudo sh -c "echo '10.0.10.1	master' >> /etc/hosts"
sudo sh -c "echo '10.0.10.2	c01' >> /etc/hosts"
sudo sh -c "echo '10.0.10.3	c02' >> /etc/hosts"

# Instalando os pacotes de desenvolvimento em C
sudo apt-get install -y gcc openmpi-bin git net-tools libopenmpi-dev expect

# Instalação e configuração do NTP server
sudo apt -y install ntp
sudo sh -c "echo 'restrict 10.0.10.0 mask 255.255.255.0 nomodify notrap' >> /etc/ntp.conf"
sudo systemctl restart ntp
sudo systemctl enable ntp

# Instalação e configuração do NFS Server
sudo apt-get -y install nfs-kernel-server nmap
sudo sh -c "echo '/home 10.0.10.0/24(rw,no_root_squash,async,no_subtree_check)' >>  /etc/exports"
sudo exportfs -r 
sudo systemctl restart nfs-server.service
sudo systemctl enable nfs-server.service
sudo systemctl restart portmap.service
sudo systemctl enable portmap.service

sudo useradd -s /bin/bash -d /home/aluno -c "test user" -m aluno

