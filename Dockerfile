#get node image for building project
FROM node:alpine

#create working directory
WORKDIR '/app'

#get the dependencies
COPY package.json .
RUN npm install

#copy files to container
COPY . .
RUN npm run build 

#run nginx server
FROM nginx 
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html