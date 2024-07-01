FROM node:16 as builder
WORKDIR /workspace
COPY . .
RUN npm i && \
    npm run build:prod

FROM nginx
COPY --from=builder /workspace/dist /usr/share/nginx/html
