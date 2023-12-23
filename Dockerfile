FROM node:20.10.0-alpine3.18

RUN apk update && \
  apk add --no-cache \
  ffmpeg \
  imagemagick \
  webp && \
  rm -rf /var/cache/apk/*

COPY package*.json .

RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["npm", "run", "qr"]
