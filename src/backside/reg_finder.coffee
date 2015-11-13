`

var Onedrive_keys = ['\\Software\\Microsoft\\Windows\\CurrentVersion\\Run']
var key_array_length = Onedrive_keys.length;
for (var i= 0; i < key_array_length; i++)  {
    var Winreg = require('winreg')
    ,   regKey = new Winreg({
          hive: Winreg.HKCU,                                          // HKEY_CURRENT_USER
          key:  '\\Software\\Microsoft\\OneDrive' // key containing autostart programs
        })

    // list autostart programs
    regKey.values(function (err, items) {
      if (err)
        console.log('ERROR: '+err);
      else
        for (var i in items)
          console.log('ITEM: '+items[i].name+'\t'+items[i].type+'\t'+items[i].value);
    });
}`
