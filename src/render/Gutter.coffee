###
file: gutter.coffee
status: not implemented
purpose:
handles events and ui of gutter section of chizel
###

$ = require 'jquery'

module.exports =
class Guter

    constructor: (options) ->
        {resourcesPath} = options
        setUpView()


    setUpView = ->
