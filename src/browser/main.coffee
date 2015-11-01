app = require 'app'
crashReport = require 'crash-reporter'
path = require 'path'
fs = require 'fs'

start = () ->


    args = parseChizelFile()

    app.on 'ready' ->

        ChizelApplication = require path.join(args.resource , 'src', 'browser', 'atom-application')
        @ChizelApplication.open(args)

normalizeDriveLetterName = (filePath) ->
    filePath.replace /^([a-z]):/, (driveLetter) -> driveLetter.toUpperCase() + ":"

setUpCrashReporter = ->
    crashReport.start(product: "Chizel" , company: "Spider Security Inc.")

setupChizelHome = ->


parseChizelFile = ->



start()
