
console.log("Handlers module\n");

exports.rootHandler = (request, response) => {

  response.write ("Now I am demonstration the Jenkins Pipeline..");
  response.end();
};

exports.aboutHandler = (request, response) => {

  response.write ("About HTTP.");
  response.end();
};

exports.notFoundHandler = (request, response) => {

  response.write ("404 HTTP.");
  response.end();
};

// exports.rootHandler = rootHandler;
