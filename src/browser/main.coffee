app = require 'app'
BrowserWindow = require 'browser-window'
crashReport = require 'crash-reporter'
path = require 'path'

start = () ->
    crashReport.start()

    mainWindow = null

    app.on 'ready', spawnWindow
    app.on 'closed', destoryWindow

    #console.log app.getLocale()

destoryWindow = () ->
    @mainWindow = null

spawnWindow = () ->

    path = path.dirname __dirname
    @mainWindow = new BrowserWindow({width:800, height:600})

    @mainWindow.loadUrl('file://' + path + '/static/index.html' );

start()
