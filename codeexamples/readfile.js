var fs = require('fs');
fs.readFile('/etc/passwd', function (err, data) {
  if (err) throw err;
  console.log(data);
});
fs.readFile('/etc/hosts', function (err, data) {
  if (err) throw err;
  console.log(data);
});
console.log("Reading file");