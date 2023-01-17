FROM node:18.13.0-alpine as stage1
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build

FROM node:18.13.0-alpine
WORKDIR /app
RUN apk add nginx
COPY ./nginx.conf /etc/nginx/http.d/server.conf
COPY --from=stage1 /app/build ./build
CMD nginx -g 'daemon off;'
