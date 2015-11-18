###
File: filesystem_chizelin.coffee
Purpose:
Indexes the file system to find files related to a Cloud Storage Service.

###
fs = require 'fs'
path = require 'path'



class Tree

    constructor:  (text) ->
        @text = text
        @nodes = []

    buildTree: (list) ->
        console.log list
        if list.length <= 0
            console.log '0'
            return this

        if !this.text?
            console.log '1'
            this.text = list.shift()
            this.buildTree(list)

        else
            console.log '2'
            root = list[0]

            if this.text is root
                console.log '3'
                list.shift()
                this.buildTree(list)
            else
                console.log '4'
                for subNode in this.nodes
                    if subNode.text is root
                        return subNode.buildTree(list)
                newNode  = new Tree (list.shift())
                newNode.buildTree(list)
                this.nodes.push newNode


module.exports =
class chizelFS

    results = []



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
        #console.log 'start search'
        dirList('C:\\Users')
        #console.log 'end search'
        tree =  new Tree(null)
        #console.log tree
        #console.log 'began the tree asm'
        #list =  ["hfjkdfhfgj", "hkdjshf", "gjjksodfj"]
        for _path in results
        #console.log 'first'
            tree.buildTree(_path.split(path.sep))
        #console.log 'second'
        #tree.buildTree(results[1].split(path.sep))
        #console.log 'done'
        #console.log 'done asm the tree'
        return tree


    listToTree = (list, node) ->


        #return node




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
