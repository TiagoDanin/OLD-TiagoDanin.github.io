import npmUserPackages from 'npm-user-packages-downloads';
import fs from 'fs';

console.log('Get npm packages')
npmUserPackages('tiagodanin', '2010-01-01:2100-01-01').then(data => {
	fs.writeFile('source/projects/npm.json', JSON.stringify(data), (err) => {
		if(err) {
			return console.log(err);
		}
		return console.log('OK!')
	})
})
