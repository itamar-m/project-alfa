# Base image for nodes.js applications
FROM node:carbon

# Create app directory
RUN mkdir /usr/src/app
# RUN mkdir /usr/src/app/node_modules

# Copying the code to the folder
COPY src/handlers.js /usr/src/app/
COPY src/web-express.js /usr/src/app/
COPY src/package-lock.json /usr/src/app/
COPY src/package.json /usr/src/app/

# Setting WORKDIR
WORKDIR /usr/src/app

# Installing dependencies
RUN npm install express --save

# Service Port
EXPOSE 80

# Command line to be executed
CMD [ "node", "web-express.js"]
