fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'antiwallhack'
author 'A7MED - Pure Studio'
version '1.1.0'
license 'MIT'
description 'Camera-based player concealment for FiveM (anti-ESP proof of concept). Functional, but client-controlled and can be bypassed.'
repository 'https://github.com/puredevs/FivemAntiESP'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

dependency '/onesync'
