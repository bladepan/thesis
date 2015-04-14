var fs = require('fs');
var async = require('async');
var files = ['/etc/passwd', '/etc/hosts', '/etc/profile'];
var finished = 0, totalSize = 0, totalSize2 = 0;
for (var i = 0; i < files.length; i++) {
    fs.readFile(files[i], function(err, data){
        totalSize += data.length;
        finished++;
        if (finished == files.length) { 
            console.log("total file size "+ totalSize);
        };
    });
};
async.each(files, function(fileName, done){
    fs.readFile(fileName, function(err, data){
        totalSize2 += data.length;
        done();
    });
}, function(err){
    console.log("total file size "+ totalSize2);
});