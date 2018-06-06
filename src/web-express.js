

const http = require ("http");
const express = require ("express");
const server = express();
const {
  rootHandler,
  aboutHandler,
  notFoundHandler
} = require("./handlers.js");

server.get("/", rootHandler);
server.get("/about", aboutHandler);
server.use( notFoundHandler);

server.listen(8080, () => {
  console.log("Server is running");
});
