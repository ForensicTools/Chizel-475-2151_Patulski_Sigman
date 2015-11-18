###
File: user-events.coffee

Purpose:
Recives events from the render process and delagates to other classes.
Handles user events on the main/browser process side.
Sends data to be view to the render process.
###

app = require 'app'
ipc = require 'ipc'
os = require 'os'
_ = require 'underscore-plus'
browserWindow = require 'browser-window'
index = require '../backside/filesystem_chizelin'

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
            event.sender.send 'actionReply', 'case is open'

        ipc.on 'one-drive', (event, data) ->
            chizelFS = new index()
            viewTree = chizelFS.dirlist(data)
            #console.log viewTree    
            event.sender.send 'actionReply', viewTree
