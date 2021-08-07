ActivePlayers = {}

RegisterNetEvent("sp-infinity:addPlayer")
AddEventHandler("sp-infinity:addPlayer", function()
    local src = source
    ActivePlayers[src] = true
    activatePlayer(1, GetPlayerIdentifiers(src)[1])
end)

AddEventHandler("playerDropped", function()
    local src = source
    ActivePlayers[src] = nil
    activatePlayer(0, GetPlayerIdentifiers(src)[1])
end)

function getPlayers()
    return ActivePlayers
end

function getPlayerCount()
    local count = 0
    for k, v in pairs(ActivePlayers) do
        count = count + 1
    end
    return count
end

exports["callback"]:Register("sp-infinity:getPlayers", function(source)
    return ActivePlayers
end)

exports["callback"]:Register("sp-infinity:getPlayerCount", function(source)
    return getPlayerCount()
end)
