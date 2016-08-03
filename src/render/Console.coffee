###
file: console.coffee
Status: not implemented
Purpose:
displays information about the application
to the user.
###
$ =  require 'jquery'


module.exports =
class Console


    constructor:(options) ->
        {resourcesPath} = options

        setUpView()


    setUpView = ->
