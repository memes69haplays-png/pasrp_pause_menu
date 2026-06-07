RegisterNetEvent('pasrp:getPlayerCount', function()
    local src = source

    TriggerClientEvent(
        'pasrp:returnPlayerCount',
        src,
        #GetPlayers()
    )
end)
