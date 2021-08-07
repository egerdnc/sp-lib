games {'gta5'}

fx_version 'cerulean'

description "Spontane Roleplay | Library | 19.06.2021"

client_scripts {
  "client/cl_*.lua"
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  "server/sv_*.lua"
}

shared_scripts {
  "shared/sh_*.lua"
}

server_export "getPlayers"
server_export "getPlayerCount"
server_export "logger"
server_export "tPrint"

export "logger"
export "tPrint"
