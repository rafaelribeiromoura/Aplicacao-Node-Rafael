# Imagem base leve com Node.js LTS
FROM node:20-alpine

# Ambiente de produção
ENV NODE_ENV=production
ENV PORT=3000

WORKDIR /app

# Copia primeiro só os manifestos para aproveitar o cache das camadas
COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force

# Copia o restante do código
COPY . .

# Roda como usuário sem privilégios (já existe na imagem oficial)
USER node

EXPOSE 3000

# Verifica se o servidor está respondendo
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:${PORT}/ || exit 1

CMD ["node", "index.js"]
