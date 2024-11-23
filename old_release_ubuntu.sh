#!/bin/bash

# Verificar se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root (use sudo)."
  exit 1
fi

# Fazer backup do arquivo atual
echo "Fazendo backup do arquivo atual /etc/apt/sources.list..."
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Substituir o conteúdo do arquivo
echo "Substituindo o arquivo /etc/apt/sources.list com os repositórios old-releases..."
cat <<EOF > /etc/apt/sources.list
# Repositórios para versões antigas (EOL)
deb http://old-releases.ubuntu.com/ubuntu/ mantic main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ mantic-updates main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ mantic-backports main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ mantic-security main restricted universe multiverse
EOF

# Atualizar a lista de pacotes
echo "Atualizando a lista de pacotes..."
apt update

echo "Script concluído. Seu sistema está configurado para usar os repositórios old-releases."
