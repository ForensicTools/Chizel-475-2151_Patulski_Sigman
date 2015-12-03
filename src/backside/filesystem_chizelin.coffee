###
File: filesystem_chizelin.coffee
Purpose:
Indexes the file system to find files related to a Cloud Storage Service.

###
fs = require 'fs'
path = require 'path'


class Tree

    @text: null
    @dataPath: ''
    @nodes: []
    @isFile: true
    @size: 0

    constructor:  (text) ->
        if text
            @text = text

    ###
    function: buildTree
    args: array of broken up file path. Ex: ['C:\\','path','to','file.txt']
    op: adds list to tree object
    ###
    buildTree: (list) ->
        if list.length <= 0
            return this

        if !@text?
            @text = list.shift()
            @dataPath = @text
            @buildTree(list)

        else
            root = list[0]

            if @text is root
                list.shift()
                @buildTree(list)
            else
                for subNode in @nodes
                    if subNode.text is root
                        return subNode.buildTree(list)


                newNode  = new Tree ( list.shift() )

                newNode.dataPath =  @dataPath  + path.sep + path.sep + newNode.text
                newNode.buildTree(list)

                @nodes.push newNode
                @isFile = false
                @size =  @size + 1


module.exports =
class FileSys

    constructor: (keywords) ->
        @tree = new Tree()
        @files = []
        @keywords = keywords

    createTree: () ->
        for _path in @files
            @tree.buildTree(_path.split(path.sep))

    searchFS: (_dir) ->
        try
            contents = fs.readdirSync(_dir)

            for _path in contents
                _absPath = path.join(_dir, _path)
                _stats = fs.statSync(_absPath)
                if _stats && _stats.isFile()
                    found = _absPath.search( new RegExp(@keywords, 'g','i') )
                    if found >= 0
                        #@tree.buildTree(_absPath.split(path.sep))
                        @files.push _absPath
                if _stats && _stats.isDirectory()
                    @searchFS(_absPath)

        catch error
