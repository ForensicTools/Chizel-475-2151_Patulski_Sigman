app = require 'app'
path = require 'path'
ipc = require 'ipc'
os = require 'os'
_ = require 'underscore-plus'
eventEmitter = require 'events'
ChizelWindow = require './chizel-window'

module.exports =
class ChizelApplication
    _.extend @prototype, eventEmitter.prototype

    @open: (options) ->

        createChizelApplication = -> new ChizelApplication(options)
        console.log 'open'

        createChizelApplication()
    windows: null
    applicationMenu:null
    resourcePath:null
    version:null
    quiting:false

    exit: (status) -> app.exit(status)

    constructor: (settings) ->
        {@resourcePath} = settings
        console.log 'chizel applications'

        @windows = []
        global.ChizelApplication = this

        @handleEvents()

        @openWindow()

    removeWindow: (window) ->
        if @windows.length is 1
            if process.platform in ['win32']
                app.quit()
                return
        @windows.splice(@windows.indexOf(window), 1)

    addWindow: (window) ->
        @windows.push window
        # add menu to the window


    handleEvents: ->

        @on 'ready', -> #Do something on ready
        @on 'before-quit', -> #Do somthing before quiting
        @on 'window-all-closed', -> #No windows are visable
        @on 'quit', -> #Do something when app is quiting
        @on 'open-file', -> #User wants to open a file
        @on 'open-url', -> # User wants to open a url not Supported

        @on 'browser-window-blur', -> # browser window is blured
        @on 'browser-window-focus', -> # browser window is focused

        @on 'browser-window-created', -> # browser window is created

        @on 'gpu-process-crashed', -> # gpu process has creashed

        @on 'select-certificate', -> # client certificate is requested

    openWindow: ->
        openedWindow  = new ChizelWindow(@resourcePath)
