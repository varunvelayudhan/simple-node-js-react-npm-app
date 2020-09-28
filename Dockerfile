FROM node:10.16.3

#RUN apt-get update && apt-get upgrade -y \
#    && apt-get clean

#RUN mkdir /app
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install 

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]
