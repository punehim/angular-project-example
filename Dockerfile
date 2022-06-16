# STAGE 1
FROM node:18-buster-slim as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --proad

# STAGE 2
FROM nginx:alpine
COPY --from=node /app/dist/test-deployment /usr/share/nginx/html
