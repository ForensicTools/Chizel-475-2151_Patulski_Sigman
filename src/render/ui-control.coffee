$ = require 'jquery'
ipc = require 'ipc'
remote = require 'remote'
dialog = remote.require 'dialog'

Create_New_Case = () ->
    console.log 'you want to create a new case'
    path = dialog.showOpenDialog({ properties: ['openDirectory']})
    ipc.send 'create-case', path
    ipc.on 'actionReply', ->
        alert 'Case was created. Start chizelin!'

Open_Case = () ->
    console.log 'you want to open a new case'

Analyze_Hard_Drive = () ->
    console.log 'you clicked the hard button'
    ipc.send 'hard_analyse' , 'someData'
    ipc.on 'actionReply', (reply) -> console.log reply

Analyze_RAM = () ->
    console.log 'you clicked the ram button'

Options = () ->
    console.log 'wil open up options when it is implemented'
