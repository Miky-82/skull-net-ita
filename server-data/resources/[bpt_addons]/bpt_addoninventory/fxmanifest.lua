fx_version("adamant")

game("gta5")

description("Adds a way for resources to store items for players")
lua54("yes")

version("2.0.0")

server_scripts({
    "@es_extended/imports.lua",
    "@oxmysql/lib/MySQL.lua",
    "server/classes/addoninventory.lua",
    "server/main.lua",
})

server_exports({
    "GetSharedInventory",
    "AddSharedInventory",
})

dependency("es_extended")
