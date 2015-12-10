path = require 'path'
os = require 'os'
eventEmitter = require 'events'
ChizelWindow = require './chizel-window'
userEventHandler =  require './user-events'
_ = require 'underscore-plus'
electron = require 'electron'
ipcMain = electron.ipcMain
app = electron.app




class HashTable


    consturctor: (obj) ->
        @length = 0
        @items = {}
        for k in obj
            if obj.hasOwnProperty(k)
                @item[p] = obj[p]
                @length++

    @add: (key, item) ->
        i = 0
        for k in items
            if k is key
                console.log 'conteins key'
                i = 1
                break
        if i = 0
            @items[key] =  item
            @length

    @getItem: (key) ->
        if @hasItem(key)
            return @items[key]
        else
            return undefined
    @hasItem: (key) ->
        return @items.hasOwnProperty(key);

    @removeItem: (key) ->
        if @hasItem(key)
            previous = @items[key]
            @length--
            delete @item[key]
            return previous



module.exports =
class ChizelApplication
    _.extend @prototype, eventEmitter.prototype

    #Application State
    ChizelWindow: null
    CaseLoaded: false
    CasePath: ''
    ChizelResources = ''
    TabHTML = new HashTable({})


    @open: (option) ->
        createChizelApplication = new ChizelApplication(option)


    constructor: (option) ->
        @ChizelResources = option
        global.ChizelApplication = this
        @applicationEvents()
        @ChizelWindow = new ChizelWindow(@ChizelResources)
        userHandler = new userEventHandler()

    addWindow :  (window) ->
        if @mainWindow?
            @mainWindow = window
        else
            console.error 'Window is already displayed.'

    removeWindow: () ->
        ChizelWindow: null
        app.quit()

    applicationEvents: () ->

        app.on 'ready', -> #Do something on ready
        app.on 'before-quit', -> #Do somthing before quiting
        app.on 'window-all-closed', -> #No windows are visable
        app.on 'quit', (status) -> #Do something when app is quiting
            @exit(status)
        app.on 'open-file', -> #User wants to open a file
            #deflected to custom evetns
            # dialog.showOpenDialog([{title:'Open File',default:'',
            # filters:[{name:'EnCase',extensions:['E01']},
            # {name:'All Files', extensions:['*']}],
            # properties:'openFile'}])
        app.on 'open-url', -> # User wants to open a url not Supported

        app.on 'browser-window-blur', -> # browser window is blured
        app.on 'browser-window-focus', -> # browser window is focused

        app.on 'browser-window-created', -> # browser window is created

        app.on 'gpu-process-crashed', -> # gpu process has creashed

        app.on 'select-certificate', -> # client certificate is requested

    exit: (status) -> app.exit(status)
