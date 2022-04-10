# Definindo a Imagem base
FROM node:12.18.3-alpine3.12

# Efetuando a copia dos arquivos para o ambiente Docker no diretório "/app"
COPY ./ ./

# Definindo diretório de trabalho
WORKDIR /app

# Liberando a porta 3000
EXPOSE 3000

# Verificando se os arquivos foram copiados
RUN ls /app

# Executando aplicacão
CMD [ "node", "index.js" ]
