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
      dict = {}
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
          date = date_array[j][0]
          #console.log(date)
          split_date = date.split "-"
          month = split_date[1]
          #console.log(month)
        #console.log(dict[month])

          if !dict[month]
            dict[month] = 1
            console.log(dict[month])
          else
            dict[month]+=1
        j++
      console.log(dict)
