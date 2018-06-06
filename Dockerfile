# Base image for nodes.js applications
FROM node:carbon


# Create app directory
RUN mkdir /usr/src/app

# Copying the code to the folder
COPY src/* /usr/src/app/

WORKDIR /usr/src/app
RUN npm install && npm install express --save

# Service Port
EXPOSE 80

# Command line to be executed
CMD node web-express.js
