FROM node:latest as builder
WORKDIR /app
COPY /dist .

FROM nginx:latest
COPY nginx.conf /etc/nginx
# 打包后的文件夹放到/data/qx-login/要和ngnix一一对应
COPY --from=builder /app /data/qx-login/
