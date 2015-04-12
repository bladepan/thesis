var fs = require('fs');
var files = ['/etc/passwd', '/etc/hosts'];
for (var i = 0; i < files.length; i++) {
    var fileName = files[i];
    fs.readFile(fileName, function(err, data){
        if (err) throw err;
        // this will always print "content of /etc/hosts is ..."
        console.log("content of " + fileName + " is "+ data);
    });
}
var createReadFileCallback = function(fileName){
    return function(err, data){
        if (err) throw err;
        console.log("content of " + fileName + " is "+ data);
    }
};
for (var i = 0; i < files.length; i++) {
    var fileName = files[i];
    fs.readFile(fileName, createReadFileCallback(fileName));
}
