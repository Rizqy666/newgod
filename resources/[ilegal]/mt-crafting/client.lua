local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerData.gang = GangInfo
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

local function GetCraftableItems()
	local items = {}
	for k,v in pairs(Config.Main) do
		if PlayerData.metadata["craftinglevel"] >= v.level then
			items[k] = v
		end
	end
	return items
end

RegisterNetEvent('mt-crafting:client:AbrirMenuCraft', function()
    local columns = {
        {
            header = Lang.menuHeader,
            isMenuHeader = true,
        },
    }
    local items = GetCraftableItems()
    for k, v in pairs(items) do
        local item = {}
        item.header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items[v.itemName].image.." width=35px style='margin-right: 10px'> " .. v.label .. "<br> Required Points: " .. v.level
        local text = ""
        for k, v in pairs(v.items) do
            text = text .. "• " .. QBCore.Shared.Items[v.item].label .. ": " .. v.amount .. "x <br>"
        end
        item.text = text
        item.params = {
            event = 'mt-crafting:client:CraftItems',
            args = {
                type = k
            }
        }
        table.insert(columns, item)
    end

    exports['qb-menu']:openMenu(columns)
end)

local function CraftItems(item)
    local playername = GetPlayerName(PlayerId())
    local playerid = GetPlayerServerId(PlayerId())
    local pontos = Config.Main[item].points
    local prob = math.random(1, 100)
    if QBCore.Functions.GetPlayerData().metadata["craftinglevel"] >= Config.Main[item].level then
        QBCore.Functions.Progressbar('crafting', Lang.crafting .. Config.Main[item].label, Config.Main[item].craftingTime, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini@repair",
            anim = "fixing_a_ped",
            }, {}, {}, function()
                ClearPedTasks(PlayerPedId())
                if prob <= Config.Main[item].chance then
                    if Config.Logs['UseLogs'] == true then
                        TriggerServerEvent('qb-log:server:CreateLog', 'crafting', 'Item Crafted', 'green', string.format(playername.. ' id ' ..playerid.. ' was crafted 1 ' ..Config.Main[item].label.. ' and earn '..pontos.. ' points', true))
                        QBCore.Functions.Notify(Lang.craftSuccess .. Config.Main[item].label, 'success')
                    else
                        QBCore.Functions.Notify(Lang.craftSuccess .. Config.Main[item].label, 'success')
                    end
                if Config.Main[item].type == 'weapon' then
                    if Config.Main['GenerateSerialNumberAtWeapons'] == true then
                        local info = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
                        TriggerServerEvent('mt-crafting:server:AddWeapon', Config.Main[item].itemName, 1, info)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.Main[item].itemName], "add")
                        TriggerServerEvent('mt-crafting:server:AddPontos', pontos)
                    else
                        TriggerServerEvent('mt-crafting:server:AddItem', Config.Main[item].itemName, 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.Main[item].itemName], "add")
                        TriggerServerEvent('mt-crafting:server:AddPontos', pontos)
                    end
                else
                    TriggerServerEvent('mt-crafting:server:AddItem', Config.Main[item].itemName, 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.Main[item].itemName], "add")
                    TriggerServerEvent('mt-crafting:server:AddPontos', pontos)
                end
                for k, v in pairs(Config.Main[item].items) do
                    TriggerServerEvent('mt-crafting:server:RemoveItem', v.item, v.amount)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
                end
            elseif QBCore.Functions.GetPlayerData().metadata["craftinglevel"] >= Config.Main[item].lostpoints then
                local pontosPerdidos = Config.Main[item].lostpoints
                QBCore.Functions.Notify(Lang.craftFailed1 .. Config.Main[item].lostpoints .. Lang.points, 'error', 7500)
                TriggerServerEvent('mt-crafting:server:TirarPontos', pontosPerdidos)
            else
                QBCore.Functions.Notify(Lang.craftFailed2, 'error', 7500)
            end
        end)
    else
        QBCore.Functions.Notify('You dont have requeried level to craft this item!', 'error', 7500)
    end
end

RegisterNetEvent('mt-crafting:client:CraftItems', function(data)
    QBCore.Functions.TriggerCallback("mt-crafting:server:ItemsSuficientes", function(hasItems)
        if (hasItems) then
            CraftItems(data.type)
        else
            QBCore.Functions.Notify(Lang.errorRightItems, "error")
            return
        end
    end, Config.Main[data.type].items)
end)

RegisterNetEvent('mt-crafting:client:SpawnarMesa', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = `prop_tool_bench02_ld`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    QBCore.Functions.Progressbar('name_here', 'PLACING TABLE...', 1000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'missfinale_c2ig_11',
        anim = 'pushcar_offcliff_f',
        flags = 16,
    }, {}, {}, function()
        local obj = CreateObject(model, x, y, z, true, false, true)
        PlaceObjectOnGroundProperly(obj)
        SetEntityAsMissionEntity(obj)

        TriggerServerEvent('mt-crafting:server:RemoveItem', 'mesa_craft', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['mesa_craft'], "remove")
    end)
end)

RegisterNetEvent('mt-crafting:client:EliminarMesa', function(obj)
    if DoesEntityExist(obj) then
        QBCore.Functions.Progressbar('name_here', 'TAKING TABLE...', 1000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'missfinale_c2ig_11',
            anim = 'pushcar_offcliff_f',
            flags = 16,
        }, {}, {}, function()
            if DoesEntityExist(obj) then
                SetEntityAsMissionEntity(obj)
                DeleteEntity(obj)
                if not DoesEntityExist(obj) then
                    TriggerServerEvent('mt-crafting:server:AddItem', 'mesa_craft', 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['mesa_craft'], "add")
                else
                    QBCore.Functions.Notify("You can't pick up this table", 'error', 5000)
                end
            end
        end)
    end
end)

CreateThread(function()
    if Config.MainLocation['UseLocation'] == true then
        exports['qb-target']:AddBoxZone("MainCraft", Config.MainLocation['Location'], 1, 1, {
            name="MainCraft",
            heading=0,
            debugpoly = false,
        }, {
            options = {
                {
                    event = "mt-crafting:client:AbrirMenuCraft",
                    icon = "fas fa-table",
                    label = Lang.targetLabel,
                },
                {
                    event = "mt-crafting:client:VerificarPontos",
                    icon = "fas fa-coins",
                    label = Lang.targetPoints,
                },
            },
            distance = 1.5
        })
    end
end)

RegisterCommand('craftpoints', function()
    local pontos = QBCore.Functions.GetPlayerData().metadata["craftinglevel"]

    QBCore.Functions.Notify(Lang.pointsCommand1 ..pontos.. Lang.pointsCommand2, 'primary', 7500)
end)

RegisterNetEvent('mt-crafting:client:VerificarPontos', function()
    local pontos = QBCore.Functions.GetPlayerData().metadata["craftinglevel"]

    QBCore.Functions.Notify(Lang.pointsCommand1 ..pontos.. Lang.pointsCommand2, 'primary', 7500)
end)