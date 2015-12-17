###
file: side-bar.coffee
status: not implemented
purpose:
handles events and ui of side bar section of chizel
###

$ = require 'jquery'

module.exports =
class SideBar

    constructor: (options) ->
        {resourcesPath} = options
        setUpView()

    setUpView = ->
