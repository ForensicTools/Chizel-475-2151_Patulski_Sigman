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
registry =  require '../backside/reg_finder'

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
            global.ChizelApplication.CaseLoaded = true
            global.ChizelApplication.CasePath = data
            reg =  new registry()

            reg.getRegistry(['export','HKCU',data])

            event.sender.send 'actionReply', 'Case Path Accpeted'

        ipcMain.on 'open-case', (event, data ) ->
            event.sender.send 'actionReply', 'case is open'

        ipcMain.on 'one-drive', (event, data) ->
            onedriveFS = new Filesys('OneDrive')

            onedriveFS.searchFS('C:\\Users')
            graph(onedriveFS)
            #console.log onedriveFS.tree
            event.sender.send 'actionReply', onedriveFS

        ipcMain.on 'google-drive', (event, data) ->
            googledriveFS = new Filesys('Google Drive')

            googledriveFS.searchFS('C:\\Users')
            graph(googledriveFS)
            #console.log onedriveFS.tree
            event.sender.send 'actionReply', googledriveFS

        ipcMain.on 'drop-box', (event, data) ->
            dropboxFS = new Filesys('DropBox')

            dropboxFS.searchFS('C:\\Users')
            graph(dropboxFS)
            #console.log onedriveFS.tree
            event.sender.send 'actionReply', dropboxFS


        ipcMain.on 'tab-click',  (event, data) ->
