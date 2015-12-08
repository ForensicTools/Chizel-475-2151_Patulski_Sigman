"""
  Parses update files and creates graph based on time.
"""


FileSystemChizel = require '../backside/filesystem_chizelin'


fs = require 'fs'
path = require 'path'


module.exports =
    graphicData = (FileSys) ->
      console.log(FileSys.files)
