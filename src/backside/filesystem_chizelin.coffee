<<<<<<< HEAD
`
"Test";
var fs = require('fs');
var path = require('path');
=======

`
"""
	Test
"""
>>>>>>> 5b02c5114e558e4108fd84f29b7d368df17a50f0

var diretoryTreeToObj = function(dir, done) {
    var results = [];

    fs.readdir(dir, function(err, list) {
        if (err)
            return done(err);

<<<<<<< HEAD
        var pending = list.length;

        if (!pending)
            return done(null, {name: path.basename(dir), type: 'folder', children: results});

        list.forEach(function(file) {
            file = path.resolve(dir, file);
            //console.log(file);
            fs.stat(file, function(err, stat) {
                if (stat && stat.isDirectory()) {
                    diretoryTreeToObj(file, function(err, res) {
                        //		console.log(file);
												var str_to_match = file.match(/OneDrive/g);
												console.log(str_to_match);
                        // results.push({
                        //     name: path.basename(file),
                        //     type: 'folder',
                        //     children: res
                        // });
                        // if (!--pending)
                        //     done(null, results);
                    });
                }
                // else {
                //     results.push({
                //         type: 'file',
                //         name: path.basename(file)
                //     });
                //     if (!--pending)
                //         done(null, results);
                // }
            });
        });
    });
};

var dirTree = ('c:\\');

diretoryTreeToObj(dirTree, function(err, res){
    if(err)
        console.error(err);

    //console.log(res);
});
=======
cmd.run('dir /s | FINDSTR OneDrive');
>>>>>>> 5b02c5114e558e4108fd84f29b7d368df17a50f0
`
