

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        --TriggerClientEvent('chatMessage', -1, 'OOC | '..author,  false, message)
    end
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, false, '/' .. command) 
    end

    CancelEvent()
end)

-- player join messages
AddEventHandler('chat:init', function()
    --TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) .. ' joined.')
end)

AddEventHandler('playerDropped', function(reason)
    --TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
end)
-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)

-- QBCore.Commands.Add('police', 'Police message.', {}, false, function(source, args)
-- 	-- If From Console
-- 	if source == 0 then
-- 		TriggerClientEvent('chat:addMessage', -1, {
--         	template = '<div class="chat-message" style="background-color: rgba(52, 67, 235, 0.75);">{0} <b>Police</b> <img src=' .. Config.Images.Police .. ' style="width:22px; padding-right: 5px; position:relative ; top: 3px;height:20px ;"></img></div>',
--         	args = { args }
--     	})
		
-- 		TriggerEvent('barbaronn:SendWebhookDiscordMsg', Config.Logs, "CONSOLE", "```[Police] " .. args .. "```" )
-- 		return
-- 	end

-- 	-- Emojis Stuff
-- 	args = table.concat(args, ' ')
-- 	args = args:gsub("%:heart:", "❤️")
--     args = args:gsub("%:smile:", "🙂")
--     args = args:gsub("%:thinking:", "🤔")
--     args = args:gsub("%:check:", "✅")
--     args = args:gsub("%:hot:", "🥵")
--     args = args:gsub("%:sad:", "😦")

--     -- Permmisions Stuff
-- 	local xPlayer = QBCore.Functions.GetPlayer(source)
-- 	if xPlayer.PlayerData.job ~= nil and xPlayer.PlayerData.job.name == 'police' then
-- 		TriggerClientEvent('chat:addMessage', -1, {
--         	template = '<div class="chat-message" style="background-color: rgba(52, 67, 235, 0.75);"><b>Police</b> {0}<img src=' .. Config.Images.Police .. ' style="width:22px; padding-right: 5px; position:relative ; top: 5px;height:20px ;"></img></div>',
--         	args = { args }
--     	})
-- 	else
-- 		TriggerClientEvent('chat:addMessage', source, {
--         	template = '<div class="chat-message" style="background-color: rgba(66, 66, 66, 0.75); color: white;"><img src=' .. Config.Images.System .. ' style="width:22px; padding-right: 5px; position:relative ; top: 5px;height:20px ;"></img><b>ADMIN</b> You are not a police officer</div>',
--         	args = {}
--     	})
-- 	end
	
-- 	-- Logs Stuff
-- 	TriggerEvent('barbaronn:SendWebhookDiscordMsg', Config.Logs, GetPlayerName(source) .. " | " .. GetPlayerIdentifiers(source)[1], "```[Police] " .. args .. "```" )
-- end)

-- QBCore.Commands.Add('ems', 'EMS Message.', {}, false, function(source, args)
-- 	-- If From Console
-- 	if source == 0 then
-- 		TriggerClientEvent('chat:addMessage', -1, {
--         	template = '<div class="chat-message" style="background-color: rgba(163, 62, 48, 0.75);">{0} <b>EMS</b> <img src=' .. Config.Images.Ems .. ' style="width:22px; padding-right: 5px; position:relative ; top: 3px;height:20px ;"></img></div>',
--         	args = { args }
--     	})
		
-- 		TriggerEvent('barbaronn:SendWebhookDiscordMsg', Config.Logs, "CONSOLE", "```[Police] " .. args .. "```" )
-- 		return
-- 	end

-- 	-- Emojis Stuff
-- 	args = table.concat(args, ' ')
-- 	args = args:gsub("%:heart:", "❤️")
--     args = args:gsub("%:smile:", "🙂")
--     args = args:gsub("%:thinking:", "🤔")
--     args = args:gsub("%:check:", "✅")
--     args = args:gsub("%:hot:", "🥵")
--     args = args:gsub("%:sad:", "😦")

--     -- Permmisions Stuff
-- 	local xPlayer = QBCore.Functions.GetPlayer(source)
-- 	if xPlayer.PlayerData.job ~= nil and xPlayer.PlayerData.job.name == 'ambulance' then
-- 		TriggerClientEvent('chat:addMessage', -1, {
--         	template = '<div class="chat-message" style="background-color: rgba(255, 0, 21, 0.75);"><b>EMS</b> {0}<img src=' .. Config.Images.Ems .. ' style="width:22px; padding-right: 5px; position:relative ; top: 5px;height:20px ;"></img></div>',
--         	args = { args }
--     	})
-- 	else
-- 		TriggerClientEvent('chat:addMessage', source, {
--         	template = '<div class="chat-message" style="background-color: rgba(66, 66, 66, 0.75); color: white;"><img src=' .. Config.Images.System .. ' style="width:22px; padding-right: 5px; position:relative ; top: 5px;height:20px ;"></img><b>ADMIN</b> You are not an EMS employer</div>',
--         	args = {}
--     	})
-- 	end
	
-- 	-- Logs Stuff
-- 	TriggerEvent('barbaronn:SendWebhookDiscordMsg', Config.Logs, GetPlayerName(source) .. " | " .. GetPlayerIdentifiers(source)[1], "```[Police] " .. args .. "```" )
-- end)


-- RegisterCommand('staff', function(source, args, rawCommand)
-- 	-- If From Console
-- 	if source == 0 then
-- 		TriggerClientEvent('chat:addMessage', -1, {
--         	template = '<div class="chat-message" style="background-color: rgba(255, 0, 0, 0.75);"><img src=' .. Config.Images.System .. ' style="width:22px; padding-right: 5px; position:relative ; top: 3px;height:20px ;"></img><b>ADMIN:</b> {0}</div>',
--         	args = { args }
--     	})
-- 		return
-- 	end

-- 	-- Emojis Stuff
-- 	args = table.concat(args, ' ')
-- 	args = args:gsub("%:heart:", "❤️")
--     args = args:gsub("%:smile:", "🙂")
--     args = args:gsub("%:thinking:", "🤔")
--     args = args:gsub("%:check:", "✅")
--     args = args:gsub("%:hot:", "🥵")
--     args = args:gsub("%:sad:", "😦")

--     -- Permmisions Stuff
-- 	local xPlayerGroup = QBCore.Functions.GetPermission(source)
-- 	if xPlayerGroup ~= nil and xPlayerGroup ~= "user" then
-- 		TriggerClientEvent('chat:addMessage', -1, {
--         	template = '<div class="chat-message" style="background-color: rgba(163, 62, 48, 0.75);"><img src=' .. Config.Images.System .. ' style="width:22px; padding-right: 5px; position:relative ; top: 3px;height:20px ;"></img><b>ADMIN:</b> {0}</div>',
--         	args = { args }
--     	})
-- 	else
-- 		TriggerClientEvent('chat:addMessage', source, {
--         	template = '<div class="chat-message" style="background-color: rgba(66, 66, 66, 0.75); color: white;"><img src=' .. Config.Images.System .. ' style="width:22px; padding-right: 5px; position:relative ; top: 5px;height:20px ;"></img><b>ADMIN</b> You are not a staff member</div>',
--         	args = {}
--     	})
-- 	end
	
-- 	-- Logs Stuff
-- 	TriggerEvent('barbaronn:SendWebhookDiscordMsg', Config.Logs, GetPlayerName(source) .. " | " .. GetPlayerIdentifiers(source)[1], "```[Police] " .. args .. "```" )
-- end, false)