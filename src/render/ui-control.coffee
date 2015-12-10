###
File: ui-contorl.coffee

Purpose:
Handles user interactions on the render side of the
aplication. Sends events to the main/browser process to deal with
users commands. Recvices data back from main/browser process and
displays in it in the DOM.

###
#$ = require 'jquery'
electron = require 'electron'
ipcRenderer = electron.ipcRenderer
remote = electron.remote
dialog = remote.require 'dialog'
events =  require 'events'
path = require 'path'
fs =  require 'fs'

BaseDir =  path.resolve(__dirname)

$shell_tabs =  $('.chrome-tabs-shell')



tabsEmitter =  new events.EventEmitter()


tabListener = () ->
    tabsEmitter.on 'tab-click', (data) ->
        console.log data

    tabsEmitter.on 'tab-close', (data) ->
        console.log data

# window first pops up
initDisplay = () ->
    chromeTabs.init({$shell: $shell_tabs, tabEmitter: tabsEmitter, minWidth: 45, maxWidth: 160})

    fs.readFile(BaseDir + '\\tabs\\welcome.html',{encoding:'utf-8'},(error, data) ->
            if error
                $('div.viewer').html(error)
            else
                $('div.viewer').html(data)

         )

    chromeTabs.addNewTab($shell_tabs, {title:"Welcome"})

Create_New_Case = () ->
    console.log 'you want to create a new case'
    path = dialog.showOpenDialog({ properties: ['openDirectory']})
    ipcRenderer.send 'create-case', path
    ipcRenderer.on 'actionReply', ->
        alert 'Case was created. Start chizelin!'

Open_Case = () ->
    console.log 'you want to open a new case'


Analyze_GoogleDrive = () ->
    console.log 'analting google drive'
    ipcRenderer.send 'google-drive', ''

    ipcRenderer.on 'actionReply', (event, treeView) ->
        console.log treeView
        treelist = []
        treelist.push treeView.tree
        $('#tree').treeview({data: treelist})


Analyse_Dropbox = () ->
    console.log 'anazing dropbox'
    ipcRenderer.send 'dropbox', ''

    ipcRenderer.on 'actionReply', (event, treeView) ->
        console.log treeView
        treelist = []
        treelist.push treeView.tree
        $('#tree').treeview({data: treelist})

Analyze_OneDrive = () ->
    console.log 'analying one drive'
    #chromeTabs.addNewTab({title:"OneDrive",  })
    ipcRenderer.send 'one-drive', ''
    ipcRenderer.on 'actionReply' , (event, treeView ) ->
            console.log treeView
            treelist = []
            treelist.push treeView.tree
            $('#tree').treeview({data: treelist})



initDisplay()
tabListener()
