FROM node:18 AS builder

WORKDIR /app

COPY package*.json ./
COPY vite.config.js ./

RUN npm ci --include=dev

COPY . .

RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf