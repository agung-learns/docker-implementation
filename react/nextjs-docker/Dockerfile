FROM node:20-alpine as deps

WORKDIR /app

COPY package*.json ./

RUN npm install
RUN npm ci


FROM node:20-alpine as development

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

FROM node:20-alpine as production

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NEXT_TELEMETRY_DISABLED 1

RUN npm run build
CMD ["npm", "start"]