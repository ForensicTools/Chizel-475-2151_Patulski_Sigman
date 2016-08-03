"""
  Parses update files and creates graph based on time.
"""


FileSystemChizel = require '../backside/filesystem_chizelin'


fs = require 'fs'
path = require 'path'


module.exports =
    graphicData = (FileSys) ->
      date_sort_asc = (date1, date2) ->
        if date1 > date2
          return 1
        if date1 < date2
          return -1
      getMonth = (monthStr) ->
        new Date(monthStr + '-1-01').getMonth() + 1
      date_regex = /[0-9]{4}-[0-9]+-[0-9]+/g
      matches = []
      temp_date_array = []
      date_array = []
      final_array = []
      dict = {}
      date_obj_array = []
      month_array = []
      i = 0
      j = 0
      all_files = FileSys.files
      myregex = /logs\\Personal/
      # console.log(FileSys.files)
      fd = fs.openSync('static\\data.csv', 'w')
      sortNumber = (a, b) ->
        a - b
      for files in all_files
        if myregex.test(files) == true
          matches.push(files)
      #console.log(matches.sort(sortNumber))
      while i < matches.length
        if matches[i] != null
          # file_array = matches[i].split "\\"
          # sync_date = file_array[9]
          temp_date_array.push(date_regex.exec(matches[i]))
        i++
      #console.log(temp_date_array)
      while j < temp_date_array.length
        if temp_date_array[j] != null
          temp_date = temp_date_array[j][0]
          date_array.push(temp_date)
        j++
      for date in date_array
        split_date = date.split "-"
        date_obj_array.push(new Date(split_date[0],split_date[1],split_date[2]))
        month = split_date[1]
        if !dict[month]
          dict[month] = 1
        else
          dict[month]+=1

      for line in date_array
        check = line.split('-')
        final_array.push(line + ',' + dict[check[1]] + "\n")
      console.log(final_array)
      final_array.sort(date_sort_asc)
      #console.log(final_array)
      final_array.unshift("date,close" + "\n")
      fs.writeSync(fd, final_array.join(""))
      fs.closeSync(fd)
      #console.log(dict)
