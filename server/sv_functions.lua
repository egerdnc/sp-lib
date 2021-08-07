function activatePlayer(pOnline, identifier)
    MySQL.Async.execute("UPDATE `users` SET online = @isOnline WHERE identifier = @playerIdentifier", {["playerIdentifier"] = identifier, ["isOnline"] = pOnline})
end
