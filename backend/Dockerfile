# Use uma imagem oficial do Node.js
FROM node:20

# Atualizar e instalar pacotes necessários
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar apenas arquivos relacionados ao npm para reduzir cache de build
COPY package*.json ./

# Instalar dependências do projeto
RUN npm install && npm rebuild @tensorflow/tfjs-node --build-from-source

# Copiar o restante dos arquivos do projeto
COPY . .

# Expor a porta do backend
EXPOSE 5000

# Comando padrão para iniciar o aplicativo
CMD ["npm", "start"]
