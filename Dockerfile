# STAGE 1
FROM public.ecr.aws/bitnami/node:18.3.0 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --proad

# STAGE 2
FROM public.ecr.aws/nginx/nginx:1.21-perl
COPY --from=node /app/dist/test-deployment /usr/share/nginx/html
