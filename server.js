// server.js
const egg = require('egg');

egg.startCluster({
  workers: 2,
  baseDir: __dirname,
  port: 7001
});