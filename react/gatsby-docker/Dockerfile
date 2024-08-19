# Stage 1: Install dependencies
FROM node:20-alpine as deps

WORKDIR /app

COPY package*.json ./

# Install build tools and Python for native dependencies
RUN apk add --no-cache python3 g++ make

RUN npm ci
RUN npm install


FROM node:20-alpine as development

ENV GATSBY_TELEMETRY_DISABLED 1

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .


FROM node:20-alpine as build

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build

# Stage 4: Production environment
FROM nginx:1.27.0-alpine as production

COPY --from=build /app/public /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
