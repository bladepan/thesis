var fs = require('fs');
var async = require('async');
fs.readFile('/etc/passwd', function(err, data){
    if (err) throw err;
    var file1Length = data.length;
    fs.readFile('/etc/hosts', function(err, data){
        if (err) throw err;
        console.log("Total file length is " + (file1Length + data.length));
    });
});
var readFileLength = function(fileName){
    return function(next){
        fs.readFile(fileName, function(err, data){
            if (err) return next(err);
            next(null, data.length);
        });        
    };
};
async.auto({
    'file1' : readFileLength('/etc/passwd'),
    'file2' : readFileLength('/etc/hosts'),
    'print' : ['file1', 'file2', function(next, results){
        console.log("Total file length is " + (results.file1 + results.file2)); 
    }]
}, function(err){
    if (err) throw err;
});