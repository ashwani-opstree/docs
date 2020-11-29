FROM node:14.15.1 AS builder

WORKDIR /app
COPY ./ /app/
RUN yarn install && yarn build

FROM nginx:latest
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/build/ /usr/share/nginx/html/
