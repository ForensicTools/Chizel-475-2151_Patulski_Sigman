###
File: ui-contorl.coffee

Purpose:
Handles user interactions on the render side of the
aplication. Sends events to the main/browser process to deal with
users commands. Recvices data back from main/browser process and
displays in it in the DOM.

###
$ = require 'jquery'
ipc = require 'ipc'
remote = require 'remote'
dialog = remote.require 'dialog'


tree = [
  {
    text: "Parent 1",
    nodes: [
      {
        text: "Child 1",
        nodes: [
          {
            text: "Grandchild 1"
          },
          {
            text: "Grandchild 2"
          }
        ]
      },
      {
        text: "Child 2"
      }
    ]
  },
  {
    text: "Parent 2"
  },
  {
    text: "Parent 3"
  },
  {
    text: "Parent 4"
  },
  {
    text: "Parent 5"
  },
  {
    text: "Parent 1",
    nodes: [
      {
        text: "Child 1",
        nodes: [
          {
            text: "Grandchild 1"
          },
          {
            text: "Grandchild 2"
          }
        ]
      },
      {
        text: "Child 2"
      }
    ]
  },
  {
    text: "Parent 2"
  },
  {
    text: "Parent 3"
  },
  {
    text: "Parent 4"
  },
  {
    text: "Parent 5"
  }
];



Create_New_Case = () ->
    console.log 'you want to create a new case'
    path = dialog.showOpenDialog({ properties: ['openDirectory']})
    ipc.send 'create-case', path
    ipc.on 'actionReply', ->
        $('#tree').treeview({data: tree});
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

Analyze_OneDrive = () ->
    console.log 'analying one drive'
    path = dialog.showOpenDialog({ properties: ['openDirectory']})
    ipc.send 'one-drive', path[0]
    ipc.on 'actionReply' ,(treeView, err) ->
        if err
            $('#tree').append('<span>Could not display tree view!</span>')
        else
            $('#tree').treeview({data: tree})
