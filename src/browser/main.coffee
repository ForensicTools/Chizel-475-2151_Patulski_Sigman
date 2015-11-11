app = require 'app'
url = require 'url'
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
ChizelApplication = require './chizel-application'

start = ->

    setUpCrashReporter()

    app.on 'ready', ->


        ChizelApplication.open()


setUpCrashReporter = ->
    crashReport.start()



start()
