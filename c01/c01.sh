#/bin/bash 

# Atualiza pacotes
sudo apt-get update
sudo apt-get upgrade

# Corrigindo timezone
sudo timedatectl set-timezone America/Sao_Paulo

## Editando o hosts 
sudo sh -c "echo '10.0.10.1	master' >> /etc/hosts"
sudo sh -c "echo '10.0.10.2	c01' >> /etc/hosts"
sudo sh -c "echo '10.0.10.3	c02' >> /etc/hosts"

# Instalando os pacotes de desenvolvimento em C
sudo apt-get install -y gcc openmpi-bin git net-tools libopenmpi-dev expect

# Instalando e configurando o NTP Client
sudo apt-get install -y ntpdate
sudo ntpdate 10.0.10.1 
sudo systemctl restart ntp
sudo systemctl enable ntp

# Instalando e configurando o NFS Client
sudo apt-get -y install nfs-common  
sudo systemctl restart nfs-utils.service
sudo systemctl enable nfs-utils.service 
sudo mount -t nfs 10.0.10.1:/home /home  
sudo sh -c "echo 'master:/home      /home        nfs defaults,soft 0 0' >> /etc/hosts"

sudo useradd -s /bin/bash -d /home/aluno -c "test user" -m aluno


