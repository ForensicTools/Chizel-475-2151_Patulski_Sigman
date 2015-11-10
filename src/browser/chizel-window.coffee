app = require 'app'
path = require 'path'
BrowserWindow = require 'browser-window'
dialog = require 'dialog'
fs = require 'fs'
url = require 'url'
_ = require 'underscore-plus'
eventEmitter = require 'events'


module.exports =
class ChizelWindow
    _.extend @prototype , eventEmitter.prototype

    browserWindow:null
    loaded:null

    constructor:(settings) ->
        @resourcePath = settings

        console.log 'chziel-window'

        options =
            show:true
            title:'Chizel'
            resizable:true

        @browserWindow = new BrowserWindow options
        global.ChizelApplication.addWindow(this)
        console.log 'from chizel window ', @resourcePath
        @handleEvents()

        # load settings
        @setLoadSettings(settings)

    setLoadSettings: (loadSettingObj) ->
        console.log 'kkd', loadSettingObj
        @browserWindow.openDevTools()
        @browserWindow.loadUrl url.format
            protocol: 'file'
            pathname: "#{loadSettingObj}/static/index.html"
            slashs:true
            hash: encodeURIComponent(JSON.stringify(loadSettingObj))

    handleEvents: ->
        @browserWindow.on 'page-title-updated', -> #document changed its title

        @browserWindow.on 'close', -> #when window is going to close
        @browserWindow.on 'closed', =>  #the window is close deference the window object
            global.ChizelApplication.removeWindow(this)

        @browserWindow.on 'unresponsive', => # web page become what it says

        @browserWindow.on 'responsive', -> # web page is responsive from being unresponsive

        @browserWindow.on 'blur', -> #window has lost foces
        @browserWindow.on 'focus',  -> # window has gained focus

        @browserWindow.on 'maximize', -> #window is maximized
        @browserWindow.on 'unmaximize', -> # windows exits from maximized state

        @browserWindow.on 'minimize', -> # window is minimized
        @browserWindow.on 'restore', -> # window is restored from its minimized state

        @browserWindow.on 'resized', -> # window is getting re sized
        @browserWindow.on 'move', -> # window is getting moved to a new position

        @browserWindow.on 'enter-full-screen', -> #window enters full screen state
        @browserWindow.on 'leave-full-screen', -> # window leaves full screen state

        @browserWindow.on 'app-command', (e, cmd ) -> # cmd is the a keyboard stroke or mouse button
