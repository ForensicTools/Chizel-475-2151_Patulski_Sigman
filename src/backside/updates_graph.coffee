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
      temp_date_array = []
      date_array = []
      final_array = []
      dict = {}
      i = 0
      j = 0
      all_files = FileSys.files
      myregex = /logs\\Personal/
      # console.log(FileSys.files)
      fd = fs.openSync('static\\data.tsv', 'w')
      for files in all_files
        if myregex.test(files) == true
          matches.push(files)
      while i < matches.length
        if matches[i] != null
          # file_array = matches[i].split "\\"
          # sync_date = file_array[9]
          temp_date_array.push(date_regex.exec(matches[i]))
        i++
      while j < temp_date_array.length
        if temp_date_array[j] != null
          date = temp_date_array[j][0]
          date_array.push(date)
          #console.log(date)
          split_date = date.split "-"
          month = split_date[1]
          if !dict[month]
            dict[month] = 1
          else
            dict[month]+=1
        j++
      for line in date_array
        check = line.split('-')
        final_array.push(line + ' ' + dict[check[1]] + "\n")
      fs.writeSync(fd, final_array)
      fs.closeSync(fd)
