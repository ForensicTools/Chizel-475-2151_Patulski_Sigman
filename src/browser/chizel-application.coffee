app = require 'app'
ipc = require 'ipc'
ChizelWindow = require './chizel-window'
ApplicationMenu = require './application-menu'
ChizelProtocolHandler = require './chizel-protocol-handler'
Menu = require 'menu'
app = require 'app'
dialog = require 'dialog'
shell = require 'shell'
fs = require 'fs-plus'
ipc = require 'ipc'
path = require 'path'
os = require 'os'
net = require 'net'
url = require 'url'
{EventEmitter} = require 'events'
_ =require 'underscore-plus'


module.exports =
  class ChizelApplication
    _.extend @prototype, EventEmitter.prototype


    @open: (option) ->
      createChizelApplication = -> new ChizelApplication(option)
      

    constructor: (option) ->
