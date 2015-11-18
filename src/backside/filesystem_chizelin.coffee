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
        if list.length <= 0
            return this

        if !this.text?
            this.text = list.shift()
            this.buildTree(list)

        else
            root = list[0]

            if this.text is root
                list.shift()
                this.buildTree(list)
            else
                for subNode in this.nodes
                    if subNode.text is root
                        return subNode.buildTree(list)
                newNode  = new Tree (list.shift())
                newNode.buildTree(list)
                this.nodes.push newNode

    decorateTree: (_path) ->

module.exports =
    class FileSys

        constructor: (keywords) ->
            @tree = new Tree(null)
            @keywords = keywords
            @files =  []
            @places = []

        searchFS: (_dir) ->
            fs.readdir(_dir, (err, files) ->
                for _path in files
                    _absPath = path.join(_dir, _path)
                    fs.stat(_absPath, (err, _stats ) ->
                        if (err)
                            console.log err
                        else
                            if _stats && _stats.isFile()
                                for _keywords in this.keywords
                                    found = _absPath.search(new RegExp(_keywords, 'g,','i'))
                                    if found >= 0
                                        this.results.push _absPath
                            if _stats && _stats.isDirectory()
                                searchFS(_absPath)

                        ))
