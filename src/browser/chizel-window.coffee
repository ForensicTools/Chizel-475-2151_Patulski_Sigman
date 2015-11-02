app = require 'app'
path = require 'path'
BrowserWindow = require 'browser-window'



module.exports =
class ChizelWindow

    mainWindow = null

    app.on 'ready', -> startApplication
    app.on 'closed', -> destoryWindow

    constructor: () ->
