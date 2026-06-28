FROM node:lts-alpine

RUN apk add --no-cache tini

RUN npm config set registry https://registry.npmmirror.com

ENV NODE_ENV=production

WORKDIR /app

COPY package.json ./

RUN npm install --production --ignore-scripts=false --legacy-peer-deps

COPY . .

EXPOSE 3000

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "app.js"]
