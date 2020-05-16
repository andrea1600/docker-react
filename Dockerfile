# Multi-step build process

# First section to run build

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second section for the run

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html



