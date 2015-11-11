app = require 'app'
ipc = require 'ipc'
os = require 'os'
_ = require 'underscore-plus'
browserWindow = require 'browser-window'


module.exports =
class userEvents

    constructor: () ->
        @userRequests()

    userRequests: () ->
        ipc.on 'analyse-hd', (event, data) ->
            event.sender.send('actionReply', 'yo whats up')

        ipc.on 'analyse-ram',(event,data) ->
            event.sender.send

        ipc.on 'add-evidence', (event,data) ->
            event.sender.send

        ipc.on 'create-case', (event, data) ->
            console.log data
            event.sender.send 'actionReply', 'yo get chizelin!!!'

        ipc.on 'open-case', (event, data ) ->
            event.sender.sent 'actionReply', 'case is open'
