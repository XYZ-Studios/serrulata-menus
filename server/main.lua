local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resource) 
    if GetCurrentResourceName() ~= resource then return end
    for i = 1, #(Config.Locations) do 
        local item = Config.Locations[i].item
        local image = Config.Locations[i].image
        QBCore.Functions.CreateUseableItem(item, function(source) 
            TriggerClientEvent("itemimage:client:showimage", source, item) 
        end) 
    end 
end)

----------------------------------------------------------------------------------------------------- Vanilla Uinicorn
RegisterNetEvent('serrulate-menus:add:vu', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['vumenu'], 'add')
    Player.Functions.AddItem('vumenu', 1, nil, info)
end)

------------------------------------------------------------------------------------------------------ Uwu Cafe
RegisterNetEvent('serrulate-menus:add:uwu', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('uwumenu', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['uwumenu'], "add")
end)

------------------------------------------------------------------------------------------------------- Bean Machine

RegisterNetEvent('serrulate-menus:add:bean', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('beanmenu', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['beanmenu'], "add")
end)

------------------------------------------------------------------------------------------------------- In&Out

RegisterNetEvent('serrulate-menus:add:burgershot', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('burgershotmenu', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['burgershotmenu'], "add")
end)

