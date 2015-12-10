path = require 'path'
fs = require 'fs'
url = require 'url'
os = require 'os'
_ = require 'underscore-plus'
eventEmitter = require 'events'
ChizelApplication = require './chizel-application'

electron = require 'electron'
app = electron.app
menu = electron.menu
ipcMain = electron.ipcMain
menuItem = electron.MenuItem
crashReport = electron.crashReporter
browserWindow = electron.BrowserWindow


start = ->

    setUpCrashReporter()

    app.on 'ready', ->


        ChizelApplication.open(path.resolve(__dirname,'..','..','..'))


setUpCrashReporter = ->
    crashReport.start()



start()
