FROM node:20-alpine as deps

WORKDIR /app

COPY package*.json ./

RUN npm install
RUN npm ci


FROM node:20-alpine as development

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .


FROM node:20-alpine as builder

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build


FROM nginx:1.27.0-alpine as production

EXPOSE 3000

COPY ./deploy/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html