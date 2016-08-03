###
file: reg_finder.coffee
purpose:
searches computer for registry entris specific to cloude storage services 
###

winReg = require 'winreg'
events = require 'events'

regEmitter = new events.EventEmitter()

module.exports =
Reg = (path) ->
    regKey = new winReg({
          hive: winReg.HKCU,                                #HKEY_CURRENT_USER
          key: path  #key containing Onedrive
        })

    regKey.values( (err, items ) ->
        #regHtml = '<table> <tr> <th>Name</th> <th>Type</th> <th>Value</th> </tr>'

        if(err)
             console.log 'ERROR: ' + err
            #regHtml = '<table><td>There was an error!</td></table>'
        else
            for item in items
                console.log 'Item: '+ item.name + '\t' + item.type + '\t' + item.value
                #regHtml = regHtml + '<td>'+ item.name + '</td> <td>' + item.type + '</td> <td>'+ item.value + '</td>'

            #regHtml = regHtml + '</table>'

        #regEmitter.emit 'one-drive-reg' , regHtml
        )

#
# module.exports =
# class Registry
#
#     constructor: () ->
#         if process.env.SystemRoot
#             system32Path = path.join(process.env.SystemRoot, 'System32')
#             regPath = path.join(system32Path, 'reg.exe')
#         else
#             regPath = 'reg.exe'
#
#
#
#     getRegistry: (args) ->
#         spawnedProcess =  ChildProcess.spawn(regPath, args)
#
#
# #
# `
# var Onedrive_key = ['\\Software\\Microsoft\\OneDrive']
# var key_array_length = Onedrive_key.length;
# for (var i= 0; i < key_array_length; i++)  {
#     var Winreg = require('winreg')
#     ,   regKey = new Winreg({
#           hive: Winreg.HKCU,                                // HKEY_CURRENT_USER
#           key:  '\\Software\\Microsoft\\OneDrive' // key containing Onedrive
#         })
#
#     regKey.values(function (err, items) {
#       if (err)
#         console.log('ERROR: '+err);
#       else
#         for (var i in items)
#           console.log('ITEM: '+items[i].name+'\t'+items[i].type+'\t'+items[i].value);
#     });
# }`
