FROM node:24-alpine
WORKDIR /app
COPY package*.json ./
Run npm ci 
COPY . .
CMD ["npm","run","dev","--","--host","0.0.0.0"]