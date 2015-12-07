"""
  Parses update files and creates graph based on time.
"""


FileSystemChizel = require '../backside/filesystem_chizelin'


fs = require 'fs'
path = require 'path'


module.exports =
    graphicData = (FileSys) ->
      date_regex = /[0-9]{4}-[0-9]+-[0-9]+/g
      matches = []
      date_array = []
      i = 0
      j = 0
      all_files = FileSys.files
      myregex = /logs\\Personal/
      # console.log(FileSys.files)
      for files in all_files
        if myregex.test(files) == true
          matches.push(files)
      while i < matches.length
        if matches[i] != null
          # file_array = matches[i].split "\\"
          # sync_date = file_array[9]
          date_array.push(date_regex.exec(matches[i]))
        i++
      while j < date_array.length
        if date_array[j] != null
          console.log(date_array[j])
      # console.log(sync_date)
      # console.log(matches[i])
        j++
