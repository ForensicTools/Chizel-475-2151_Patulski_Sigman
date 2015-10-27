crashReporter = require 'crash-reporter'
app = require 'app'
fs = require 'fs-plus'
path = require 'path'
yargs = require 'yargs'
console.log = require 'nslog'


start = ->
  setupChizel()
  args = parseCommandLine()

  ChizelApplication = require path.join(args.resourcePath, 'src', 'browser','chizel-application')
  ChizelApplication.open(args)


setupChizel = ->



parseCommandLine = ->







start()
