#!/bin/bash

# Configuração do NIS Server
sudo systemctl restart nis
sudo systemctl enable nis
cd /var/yp
sudo make 

echo ""
echo "Master node Configurado com Sucesso!!!"