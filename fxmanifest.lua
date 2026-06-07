fx_version 'cerulean'
game 'gta5'

lua54 'yes'

version "1.0.0"

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/assets/*'
}

shared_script 'config.lua'

client_script 'client.lua'
server_script 'server.lua'
