fx_version 'cerulean'
game 'gta5'

version '1.0.0'

escrow_ignore = {
    "config.lua"
}

shared_scripts {
    'config.lua'
}

files {
    'html/style.css',
    'html/index.js',
    'html/index.html',
}

ui_page {
	'html/index.html'
}

client_script 'client/main.lua'
server_script {'@oxmysql/lib/MySQL.lua', 'server/main.lua' }

lua54 'yes'