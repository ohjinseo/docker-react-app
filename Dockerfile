FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
# Nginx 컨테이너에서 매핑될 포트 정의
EXPOSE 80 
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
