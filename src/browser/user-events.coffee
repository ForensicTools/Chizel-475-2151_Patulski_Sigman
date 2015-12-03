###
File: user-events.coffee

Purpose:
Recives events from the render process and delagates to other classes.
Handles user events on the main/browser process side.
Sends data to be view to the render process.
###
os = require 'os'
_ = require 'underscore-plus'
Filesys = require '../backside/filesystem_chizelin'
electron = require 'electron'
graph = require '../backside/updates_graph'
app = electron.app
ipcMain = electron.ipcMain

module.exports =
class userEvents

    constructor: () ->
        @userRequests()

    userRequests: () ->
        ipcMain.on 'add-evidence', (event,data) ->
            event.sender.send

        ipcMain.on 'create-case', (event, data) ->
            console.log data
            event.sender.send 'actionReply', 'yo get chizelin!!!'

        ipcMain.on 'open-case', (event, data ) ->
            event.sender.send 'actionReply', 'case is open'

        ipcMain.on 'one-drive', (event, data) ->
            onedriveFS = new Filesys('OneDrive')

            onedriveFS.searchFS('C:\\Users')
            graph(onedriveFS)
            #console.log onedriveFS.tree
            event.sender.send 'actionReply', onedriveFS
