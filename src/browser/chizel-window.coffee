path = require 'path'
fs = require 'fs'
url = require 'url'
_ = require 'underscore-plus'
eventEmitter = require 'events'

electron = require 'electron'
browserWindow = electron.BrowserWindow
app = electron.app
dialog = electron.dialog



module.exports =
class ChizelWindow
    _.extend @prototype , eventEmitter.prototype

    mainWindow:null
    loaded:null

    constructor:(path) ->

        #global.ChizelApplication.addWindow(this)

        @mainWindow = new browserWindow {}
        #@mainWindow.openDevTools()
        @mainWindow.loadURL url.format
            protocol: 'file'
            pathname:  path + "/static/index.html"
            slashs:true


        @windowEvents()


    windowEvents: ()->

        @mainWindow.on 'page-title-updated', -> #document changed its title

        @mainWindow.on 'close', -> #when window is going to close
        @mainWindow.on 'closed', ->  #the window is close deference the window object
            #global.ChizelApplication.removeWindow()
        @mainWindow.on 'unresponsive', => # web page become what it says

        @mainWindow.on 'responsive', -> # web page is responsive from being unresponsive

        @mainWindow.on 'blur', -> #window has lost foces
        @mainWindow.on 'focus',  -> # window has gained focus

        @mainWindow.on 'maximize', -> #window is maximized
        @mainWindow.on 'unmaximize', -> # windows exits from maximized state

        @mainWindow.on 'minimize', -> # window is minimized
        @mainWindow.on 'restore', -> # window is restored from its minimized state

        @mainWindow.on 'resized', -> # window is getting re sized
        @mainWindow.on 'move', -> # window is getting moved to a new position

        @mainWindow.on 'enter-full-screen', -> #window enters full screen state
        @mainWindow.on 'leave-full-screen', -> # window leaves full screen state

        @mainWindow.on 'app-command', (e, cmd ) -> # cmd is the a keyboard stroke or mouse button
