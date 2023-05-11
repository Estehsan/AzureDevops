const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.write("Welcome to 2022\n\n");
  res.write(`User Agent: ${req.headers["user-agent"]}\n`);
  res.end();
});

const port = 3000;
server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
