local menuOpen = false
local playerCount = 0

RegisterNetEvent('pasrp:returnPlayerCount')
AddEventHandler('pasrp:returnPlayerCount', function(count)
    playerCount = count
end)

CreateThread(function()
    while true do
        Wait(10000)
        TriggerServerEvent('pasrp:getPlayerCount')
    end
end)

CreateThread(function()
    while true do
        Wait(0)

        DisableControlAction(0, 200, true)

        if IsControlJustPressed(0, 200) then
            menuOpen = not menuOpen

            SetNuiFocus(menuOpen, menuOpen)

            SendNUIMessage({
                action = menuOpen and "open" or "close",
                playerCount = playerCount,
                time = os.date("%I:%M %p")
            })
        end
    end
end)

RegisterNUICallback("close", function(_, cb)
    menuOpen = false

    SetNuiFocus(false, false)

    cb("ok")
end)

RegisterNUICallback("disconnect", function(_, cb)
    ExecuteCommand("quit")

    cb("ok")
end)

RegisterNUICallback("discord", function(_, cb)
    SendNUIMessage({
        action = "copyDiscord"
    })

    cb("ok")
end)

RegisterNUICallback("openMap", function(_, cb)

    SetNuiFocus(false, false)

    menuOpen = false

    ActivateFrontendMenu(
        GetHashKey("FE_MENU_VERSION_MP_PAUSE"),
        false,
        -1
    )

    cb("ok")
end)

RegisterNUICallback("settings", function(_, cb)

    SetNuiFocus(false, false)

    menuOpen = false

    ActivateFrontendMenu(
        GetHashKey("FE_MENU_VERSION_LANDING_MENU"),
        false,
        -1
    )

    cb("ok")
end)
