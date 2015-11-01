app = require 'app'
path = require 'path'
ipc = require 'ipc'
eventEmitter = require 'events'


module.exports =
class ChizelApplication

    @open(options) ->

        @ChizelApplication = new ChizelApplication(options)

    constructor: (options) ->
        
