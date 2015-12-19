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
uuid = require 'uuid'


BaseDir =  path.resolve(__dirname)

obj =  require BaseDir + '\\html.json'

htmlFiles = obj.htmlFiles

$shell_tabs =  $('.chrome-tabs-shell')

tabsEmitter =  new events.EventEmitter()

getTabHTML = (uuid) ->
    for tab in htmlFiles
        console.log tab
        if uuid is tab.uuid
            return tab.html
    return 'Cloud not find tab data'
removeTabHTML = (uuid) ->
    for tab, index in htmlFiles
        if uuid is tab.uuid
            delete htmlFiles[index]
            return 'tab deleted'
    return 'Cloud not find tab data'

addTabHTML = (uuid, html) ->
    htmlFiles.push({uuid:uuid, html:html})


tabListener = () ->
    tabsEmitter.on 'tab-click', (data) ->
        console.log data
        console.log data.data('uuid')
        html = getTabHTML(data.data('uuid'))
        $('div.viewer').html('')
        $('div.viewer').html(html)

    tabsEmitter.on 'tab-close', (data) ->
        $('div.viewer').html('')
        removeTabHTML(data.data('uuid'))

# window first pops up
initDisplay = () ->
    chromeTabs.init({$shell: $shell_tabs, tabEmitter: tabsEmitter, minWidth: 45, maxWidth: 160})
    welcome = "
        <div class='jumbotron'><div class='container'><h1>Hello, Welcome to...</h1>
        <img src='Chizel_asciiArt.PNG' alt='Chizel Picture' style='width:1200px;height:250px;''>
        <p>Chizel is a cloud storage interrogator. It streamlines the process of collecting cloud artifacts on a box. Data stored on the local computer is analyzed, and presented in a clear manner.</p>
        <p><a class='btn btn-primary btn-lg' href='#' role='button'>Learn more &raquo;</a></p></div></div>
<div class='container'>
<div class='row'>
<div class='col-md-4'>
<h2>Heading</h2>
<p></p>
      <p><a class='btn btn-default' href='#' role='button'>View details &raquo;</a></p>
    </div>
    <div class='col-md-4'><h2>Heading</h2>
    <p> </p>
      <p><a class='btn btn-default' href='#' role='button'>View details &raquo;</a></p>
   </div>
   <div class='col-md-4'>
   <h2>Heading</h2><p></p><p><a class='btn btn-default' href='#' role='button'>View details &raquo;</a></p>
    </div></div><hr><footer><p>&copy; 2015 Chizel, Inc.</p></footer>"
    NewId =  uuid.v4()
    addTabHTML(NewId, welcome)
    chromeTabs.addNewTab($shell_tabs, {title:"Welcome"} , NewId)

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
    ipcRenderer.on 'actionReply' , (event, oneDriveData ) ->
            console.log oneDriveData
            treelist = []
            treelist.push oneDriveData.fs.tree
            $('#tree').treeview({data: treelist})
            chromeTabs.addNewTab($shell_tabs, {title:"OneDrive Activity"})
            console.log oneDriveData.reg
            fs.readFile(BaseDir + '\\update_graphIndex.html',{encoding:'utf-8'},(error, data) ->
                      console.log data
                      if error
                          $('div.viewer').html(error)
                      else

                          $('div.viewer').html(data))


initDisplay()
tabListener()

$('div.viewer').html(getTabHTML($shell_tabs.find('chrome-tab-current').data('uuid')))
