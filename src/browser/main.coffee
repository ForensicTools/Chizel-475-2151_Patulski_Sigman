app = require 'app'
url = require 'url'
dialog = require 'dialog'
menu = require 'menu'
path = require 'path'
fs = require 'fs'
ipc = require 'ipc'
os = require 'os'
Menu = require 'menu'
MenuItem = require 'menu-item'
_ = require 'underscore-plus'
crashReport = require 'crash-reporter'
eventEmitter = require 'events'
browserWindow = require 'browser-window'

start = ->

    app.on 'ready', ->
        chizel = new ChizelApplication()
        chizelWindow = chizel.spawnWindow()
        chizel.windowEvents(chizelWindow)


class ChizelApplication
    _.extend @prototype, eventEmitter.prototype
    mainWindow: null

    constructor: () ->

        applicationEvents()


    spawnWindow: () ->
        mainWindow = new browserWindow({})

        mainWindow.loadUrl url.format
            protocol: 'file'
            pathname:  process.cwd() + "/static/index.html"
            slashs:true
        mainWindow
    createMenu: ->
        menu = new Menu()
        menu.append(new MenuItem({label: 'Open File', click: -> console.log 'openfile'}))
        menu

    normalizeDriveLetterName = (filePath) ->
        filePath.replace /^([a-z]):/, (driveLetter) -> driveLetter.toUpperCase() + ":"

    setUpCrashReporter = ->
        crashReport.start()


    exit : (status) -> app.exit(status)

    applicationEvents  = ->

        app.on 'ready', -> #Do something on ready
        app.on 'before-quit', -> #Do somthing before quiting
        app.on 'window-all-closed', -> #No windows are visable
        app.on 'quit', (status) -> #Do something when app is quiting
            exit(status)
        app.on 'open-file', -> #User wants to open a file
            dialog.showOpenDialog([{title:'Open File',default:'',
            filters:[{name:'EnCase',extensions:['E01']},
            {name:'All Files', extensions:['*']}],
            properties:'openFile'}])
        app.on 'open-url', -> # User wants to open a url not Supported

        app.on 'browser-window-blur', -> # browser window is blured
        app.on 'browser-window-focus', -> # browser window is focused

        app.on 'browser-window-created', -> # browser window is created

        app.on 'gpu-process-crashed', -> # gpu process has creashed

        app.on 'select-certificate', -> # client certificate is requested

    windowEvents: (mainWindow) ->

        mainWindow.on 'page-title-updated', -> #document changed its title

        mainWindow.on 'close', -> #when window is going to close
        mainWindow.on 'closed', ->  #the window is close deference the window object

        mainWindow.on 'unresponsive', => # web page become what it says

        mainWindow.on 'responsive', -> # web page is responsive from being unresponsive

        mainWindow.on 'blur', -> #window has lost foces
        mainWindow.on 'focus',  -> # window has gained focus

        mainWindow.on 'maximize', -> #window is maximized
        mainWindow.on 'unmaximize', -> # windows exits from maximized state

        mainWindow.on 'minimize', -> # window is minimized
        mainWindow.on 'restore', -> # window is restored from its minimized state

        mainWindow.on 'resized', -> # window is getting re sized
        mainWindow.on 'move', -> # window is getting moved to a new position

        mainWindow.on 'enter-full-screen', -> #window enters full screen state
        mainWindow.on 'leave-full-screen', -> # window leaves full screen state

        mainWindow.on 'app-command', (e, cmd ) -> # cmd is the a keyboard stroke or mouse button


start()
