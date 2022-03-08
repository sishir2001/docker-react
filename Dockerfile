# dockerfile for production environment
FROM node:16-alpine as builder
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

CMD ["npm","run","build"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# the nginx server will start by default
