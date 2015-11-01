"""
	Test
"""

var cmd=require('node-cmd');

cmd.get(
		'dir /s'
		function(data){
			console.log('List of all the files are : ' data)
		}
);

cmd.run('dir /s | FINDSTR OneDrive');
