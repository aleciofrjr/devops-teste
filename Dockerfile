# Definindo a Imagem
FROM node:12.18.3-alpine3.12

# Efetuando a copia da aplicacao para o ambiente Docker no diretório /app
COPY . app/

# Definindo diretório de trabalho
WORKDIR /app

# Liberando a porta 3000
EXPOSE 3000

# Executando aplicação
RUN ls /app/
RUN npm start
