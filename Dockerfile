# Étape 1 : Build
FROM node:18-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Étape 2 : Exécution
FROM node:18-alpine AS runner
WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000

# Lancer ton server.js en production
CMD ["node", "server.js"]
