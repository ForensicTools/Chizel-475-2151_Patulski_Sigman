$ = require 'jquery'

module.exports =
class SideBar

    constructor: (options) ->
        {resourcesPath} = options
        setUpView()

    setUpView = ->
