fs = require 'fs'
path = require 'path'

module.exports =
class chizelFS
    dirToTreeObj: (dir, done) ->
        results = []

        fs.readdir(dir, (err, list) ->

            if(err)
                return done(err)

            pending = list.length

            if(!pending)
                return done(null, {name: path.basename(dir), type: 'folder', children: results})

            for file in list
                do (file) ->
                    file = path.resolve(dir, file)
                    fs.stat(file, (err, stat) ->
                        if(stat && stat.isDirectory())
                            directoryTreeToObj(file, (err, file) ->
                                str_to_match = file.match(/OneDrive/g)
                                if str_to_match?
                                    console.log(file))
                        else
                            results.push({type: 'file', name: path.basename(file)})
                            done(null, results) if(!--pending)))


    treeObjToView: (results) ->
        view = null
        for path in results
            pathInfo = path.parse(path)
            pathSplit = path.split(path.sep)
            if view?
                view = { text: pathSplit[0], nodes:[]}
            view =  treeObjToViewHelp(path, view)
        return view


    treeObjToViewHelp = (list, node) ->
        root = list.pop()

        if node.text is root
            for child in node.nodes
                if child.text is root
                    treeObjToViewHelp(list, node)
            newNode = {text: root, node:[]}
            node.nodes.push newNode
        else
            console.log 'root does not match'

        return node




# dirTree = 'c:\\'
#
# directoryTreeToObj(dirTree, (err, res) -> if(err) console.log(err))



# var fs = require('fs');
# var path = require('path');
#
# var diretoryTreeToObj = function(dir, done) {
#     var results = [];
#
#     fs.readdir(dir, function(err, list) {
#         if (err)
#             return done(err);
#
#         var pending = list.length;
#
#         if (!pending)
#             return done(null, {name: path.basename(dir), type: 'folder', children: results});
#
#         list.forEach(function(file) {
#             file = path.resolve(dir, file);
#             //console.log(file);
#             fs.stat(file, function(err, stat) {
#                 if (stat && stat.isDirectory()) {
#                     diretoryTreeToObj(file, function(err, res) {
#                         //		console.log(file);
#
# 						var str_to_match = file.match(/OneDrive/g);
#                         if (str_to_match != null){
#                           // fs.stat(file && function(err, stat) {
#                           //   if (stat && stat.isDirectory()) {
#                           //     directoryTreeToObj
#                           //   }
#                           // }
#                           console.log(file)
#                         }
#                         // console.log(str_to_match);
#                         // results.push({
#                         //     name: path.basename(file),
#                         //     type: 'folder',
#                         //     children: res
#                         // });
#                         // if (!--pending)
#                         //     done(null, results);
#                     });
#                 }
#                 else {
#                     results.push({
#                         type: 'file',
#                         name: path.basename(file)
#                     });
#                     if (!--pending)
#                         done(null, results);
#                 }
#             });
#         });
#     });
# };
#
# var dirTree = ('c:\\');
#
# diretoryTreeToObj(dirTree, function(err, res){
#     if(err)
#         console.error(err);
#
#     //console.log(res);
# });
# ;
