# Étape 1 : Build
FROM node:18 AS builder

# Créer un dossier app
WORKDIR /app

# Cloner le repo Postiz
RUN git clone https://github.com/gitroomhq/postiz . && \
    yarn install && \
    yarn build

# Étape 2 : Runtime
FROM node:18

WORKDIR /app

COPY --from=builder /app /app

# Expose le port utilisé par le backend (5000)
EXPOSE 5000

# Démarre le serveur Next.js
CMD ["yarn", "start"]
