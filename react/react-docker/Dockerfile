FROM node:20-alpine as deps

WORKDIR /app

COPY package*.json ./

RUN npm install
RUN npm ci


FROM node:20-alpine as development

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .


FROM node:20-alpine as build

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build --prod


FROM nginx:1.27.0-alpine as production

COPY --from=build /app/dist/angular-docker /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]