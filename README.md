# Old-Release-Ubuntu-Mantic-23.10


# Script para Configurar Repositórios `old-releases` no Ubuntu

Este script automatiza o processo de configuração dos repositórios `old-releases` para versões antigas do Ubuntu que atingiram o fim do suporte (EOL). Ele faz backup do arquivo atual `/etc/apt/sources.list` e adiciona os repositórios corretos.

## Como usar este script

### Passo 1: Baixar o Script
Crie o script Bash com o seguinte conteúdo:

```bash
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
```

### Passo 2: Tornar o Script Executável
1. Salve o conteúdo acima em um arquivo chamado `ajustar_repositorios.sh`:
   ```bash
   nano ajustar_repositorios.sh
   ```

2. Torne o script executável:
   ```bash
   chmod +x ajustar_repositorios.sh
   ```

### Passo 3: Executar o Script
Execute o script como superusuário (com `sudo`):

```bash
sudo ./ajustar_repositorios.sh
```

### O que o Script Faz
1. Verifica se você está executando como root.
2. Faz um backup do arquivo `/etc/apt/sources.list` em `/etc/apt/sources.list.bak`.
3. Substitui o conteúdo do arquivo pelos repositórios de `old-releases` para a versão **mantic**.
4. Atualiza a lista de pacotes com `apt update`.

### Restaurar o Arquivo Original
Se precisar voltar ao arquivo original, você pode restaurá-lo usando o backup criado pelo script:

```bash
sudo mv /etc/apt/sources.list.bak /etc/apt/sources.list
sudo apt update
```

### Notas
- Este script é útil apenas para versões do Ubuntu que atingiram o fim do suporte (EOL).
- Após ajustar os repositórios, considere atualizar para uma versão com suporte ativo para manter o sistema seguro.

---
**Autor:** Gerado com auxílio do ChatGPT
