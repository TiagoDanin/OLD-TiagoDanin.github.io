const npmUserPackages = require('npm-user-packages')
const fs = require('fs')

npmUserPackages('tiagodanin').then(data => {
	//console.log(data)
	var packages = []
	data.forEach(package => {
		packages.push({
			name: package.name,
			description: package.description,
			author: package.author.name
		})
	})
	fs.writeFile('source/projects/npm.json', JSON.stringify(packages), function(err) {
		if(err) {
			return console.log(err);
		}
		return console.log('OK!')
	})
})
