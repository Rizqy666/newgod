local QBCore = exports['qb-core']:GetCoreObject()
local on = false

function display(bool)
    on = bool
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = on,
        
    })
end

RegisterCommand('watermark', function(source, args)
    display(not on)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    display(true)
end)