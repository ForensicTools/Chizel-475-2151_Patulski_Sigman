###
File: filesystem_chizelin.coffee
Purpose:
Indexes the file system to find files related to a Cloud Storage Service.

###
fs = require 'fs'
path = require 'path'
fileTree = require 'file-size-tree'


module.exports =
class chizelFS

    results = []
    tree = {}
    dirList = (_dir) ->
        try
            content = fs.readdirSync(_dir)
            for _path in content
                _absPath = path.join(_dir,_path)
                _stat = fs.statSync(_absPath)
                if _stat && _stat.isFile()
                    found = _absPath.search(/OneDrive/ig)
                    if found >= 0
                        results.push _absPath
                if _stat && _stat.isDirectory()
                    dirList( _absPath)
        catch error
            #console.error error


    dirlist: (dir) ->
        serviceResults = []
        console.log 'start search'
        dirList('C:\\Users')
        console.log 'end search'
        console.log fileTree(results)
        return results



    treeObjToView: (results) ->
        view = []
        for _path in results
            console.log 'hi'
            pathSplit = _path.split(path.sep)
            currentNode = view
            for _subPath in pathSplit
                console.log 'hello'
                wantedNode = _subPath
                lastNode = currentNode
                for cn in currentNode
                    console.log 'yoyoyo'
                    if cn.text is wantedNode
                        currentNode = cn.nodes
                        break
                if lastNode == currentNode
                    newNode = {text: wantedNode, nodes:[] }
                    currentNode = newNode.nodes
        console.log view
        return view


    # treeObjToViewHelp = (list, node) ->
    #
    #     if list.length =< 0
    #         return node
    #
    #     if !node?
    #         node = {text: list.shift(), nodes:[]}
    #         treeObjToViewHelp(list, node)
    #
    #     if node?
    #
    #         newNode = {text: list.shift() , nodes:[]}
    #         node.nodes.push newNode
    #         treeObjToViewHelp(list, node.nodes[0])
    #     else
    #         console.log 'root does not match'
    #
    #     #return node




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
#             fs.stat(file, function(err, stat) {
#                 if (stat && stat.isDirectory()) {
#                     diretoryTreeToObj(file, function(err, res) {
# 						var str_to_match = file.match(/OneDrive/g);
#                         if (str_to_match != null){
#                           console.log(file)
#                         }
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
