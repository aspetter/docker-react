# Build phase
FROM node:alpine as builder
WORKDIR 'home/app'
COPY package.json .
RUN npm install
COPY . .
RUN ["npm", "run", "build"]

# Production
FROM nginx
EXPOSE 80
COPY --from=builder /home/app/build /usr/share/nginx/html

