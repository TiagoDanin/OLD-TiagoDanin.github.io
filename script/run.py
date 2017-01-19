from SuperMarkdown import SuperMarkdown
import requests
import os
import re

ignore = ['TiagoDanin.github.io', 'SendCH-Telegram', 'DesenvolvimentoDeBots']
imagem = {}
imagem['Atom-TerminalColor'] = 'atom.png'
imagem['GenesiPassword'] = 'lua.png'
imagem['htmlEntities-for-lua'] = 'lua.png'
imagem['PythonColorize'] = 'color.png'
imagem['Quiz-Corona'] = 'corona.png'
imagem['RomanNumerals'] = 'lua.png'
imagem['SiD'] = 'sid.jpg'
imagem['SiDBot'] = 'sid.jpg'
imagem['SpotifyTelegram'] = 'spotify.png'
push_git = True

def write_text(text, name):
	try:
		file = open('sites/{}/index.html'.format(name), 'w')
	except FileNotFoundError as error:
		return False
	file.write(text)
	file.close()
	return True

def github():
	url = 'https://api.github.com/users/TiagoDanin/repos'
	data = requests.get(url)
	data_json = data.json()
	for v in data_json:
		name = v['name']
		watchers = v['watchers']
		language = v['language']
		size = v['size']
		url_readme = 'https://raw.githubusercontent.com/TiagoDanin/{}/master/README.md'.format(name)
		description = v['description']

		if watchers == '0':
			watchers = ''
		else:
			watchers = '<i class="ti-star"></i>' + str(watchers) + '  '

		if not v['language']:
			language = ''
		else:
			language = '<i class="ti-tag"></i>' + str(v['language']) + '  '

		info = '{lang}{watchers}<i class="ti-download"></i>  {size}KB'.format(lang=language,
																			watchers=watchers,
																			size=size)
		img = 'github.png'
		if name in imagem:
			img = imagem[name]
		else:
			img = 'github.png'

		if name in ignore:
			print('{} - {} - {}'.format(readme_data, name, 'IGNORE'))
		else:
			readme_data = requests.get(url_readme)
			readme = readme_data.text
			if readme != '404: Not Found':
				text = ''
				supermd = SuperMarkdown()
				supermd.add_content(text=readme)
				file = open('defaut.html', 'r')
				text = file.read()
				text = text.format(title=name,
									info=info,
									img=img,
									description=description,
									repo=name,
									html_text=re.sub('</style>', '-->', (re.sub('<style>', '<!--', supermd.build()))))
				status = write_text(text, name)
				if status:
					if push_git:
						os.system('cd sites/{}/ && git add -A && git commit -S -m "Update GH-Pages" && git config credential.helper store && git push'.format(name))
					print('{} - {} - {}'.format(readme_data, name, 'OK'))
				else:
					os.system('cd sites/ && git clone https://github.com/TiagoDanin/{}.git -b gh-pages'.format(name))
					status = write_text(text, name)
					if status:
						if push_git:
							os.system('cd sites/{}/ && git add -A && git commit -S -m "Update GH-Pages" && git config credential.helper store && git push'.format(name))
						print('{} - {} - {}'.format(readme_data, name, 'OK'))
					else:
						print('{} - {} - {}'.format(readme_data, name, 'No has git-repo'))
			else:
				print('{} - {} - {}'.format(readme_data, name, 'No has README file'))

github()
