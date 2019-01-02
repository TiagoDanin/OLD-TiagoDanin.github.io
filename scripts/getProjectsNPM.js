const npmUserPackages = require('npm-user-packages-downloads')
const fs = require('fs')

npmUserPackages('tiagodanin', '2010-01-01:2100-01-01').then(data => {
	fs.writeFile('source/projects/npm.json', JSON.stringify(data), (err) => {
		if(err) {
			return console.log(err);
		}
		return console.log('OK!')
	})
})
