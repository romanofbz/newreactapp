#base image
FROM node:alpine as builder

#dependencies
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
# default command

CMD ["npm", "run", "start"]

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html