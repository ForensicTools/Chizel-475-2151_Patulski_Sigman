app = require 'app'
crashReport = require 'crash-reporter'
path = require 'path'
fs = require 'fs'

start = ->

    resourcePath = path.dirname(path.dirname(__dirname))
    args = parseChizelFile(resourcePath)

    app.on 'ready', ->

        ChizelApplication = require path.join(resourcePath ,  'scripts', 'browser','chizel-application')
        ChizelApplication.open(args)
        setUpCrashReporter()
        console.log args
normalizeDriveLetterName = (filePath) ->
    filePath.replace /^([a-z]):/, (driveLetter) -> driveLetter.toUpperCase() + ":"

setUpCrashReporter = ->
    crashReport.start(product: "Chizel" , company: "Spider Security Inc.")



parseChizelFile = (options) ->
    'resourcePath': options



start()
