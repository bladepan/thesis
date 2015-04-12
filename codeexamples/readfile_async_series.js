var fs = require('fs');
var async = require('async');
var files = ['/etc/passwd', '/etc/hosts', '/etc/profile'];
var fileIndex = 0;
var currentFile = files[fileIndex];
var readFileCallback = function(err, data){
    if (err) throw err;
    console.log(currentFile + " length " + data.length);
    if (fileIndex == files.length -1) return;
    currentFile = files[++fileIndex];
    fs.readFile(currentFile, readFileCallback);
}
fs.readFile(currentFile, readFileCallback);
async.eachSeries(files, function(currentFile, next){
    fs.readFile(currentFile, function(err, data){
        if (err) return next(err);
        console.log(currentFile + " length " + data.length);
        next();
    });
}, function(err){
    if(err) throw err;
});