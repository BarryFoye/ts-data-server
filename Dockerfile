FROM node:16-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:16-alpine AS server

WORKDIR /app

COPY package* ./

RUN npm install --production

COPY --from=builder ./app/public ./public

COPY --from=builder ./app/build ./build

EXPOSE 3100

CMD ["npm", "start"]