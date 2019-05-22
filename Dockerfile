FROM node:latest as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN  npm config set registry https://registry.npm.taobao.org --global && \
     npm config set disturl https://npm.taobao.org/dist --global && \
     npm install && npm run build

FROM nginx:latest
COPY nginx.conf /etc/nginx
COPY --from=builder /app/dist /usr/share/nginx/html
