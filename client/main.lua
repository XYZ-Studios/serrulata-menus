local QBCore = exports['qb-core']:GetCoreObject()

local Active = false

RegisterNetEvent("itemimage:client:showimage", function(item)
    for i = 1, #(Config.Locations) do 
        if item == "vumenu" then
            local image = Config.Locations[1].image
            exports['ps-ui']:ShowImage(image)
        elseif item == "uwumenu" then
            local image = Config.Locations[2].image
            exports['ps-ui']:ShowImage(image)
        elseif item == "beanmenu" then
            local image = Config.Locations[3].image
            exports['ps-ui']:ShowImage(image)
        elseif item == "burgershotmenu" then
            local image = Config.Locations[4].image
            exports['ps-ui']:ShowImage(image)
        end
    end
end)

CreateThread(function()
    for i, v in pairs(Config.Locations) do
        local coords = Config.Locations[i].coords
        local size1 = Config.Locations[i].size1
        local size2 = Config.Locations[i].size2
        local heading = Config.Locations[i].heading
        local minZ = Config.Locations[i].minZ
        local maxZ = Config.Locations[i].maxZ
        
        if Config.Target == 'ox-target' then
            exports.ox_target:addBoxZone({ -- Enter
            coords = vector3(coords.x, coords.y, coords.z),
            size =  vec3(size1, size2, 5),
            rotation = heading,
            options = {
                {
                    name = 'sphere',
                    icon = 'fa-solid fa-circle',
                    label = 'Grab Menu',
                    onSelect = function()
                        TriggerEvent('serruata-menus:client:giveMenu')
                    end,
                    canInteract = function(entity, distance, coords, name)
                        return distance < 2
                    end
                }
            }
            })
        elseif Config.Target == 'qb-target' then
            exports['qb-target']:AddBoxZone('serruata-menus', vector3(coords.x, coords.y, coords.z), size1, size2, {
                name = 'serruata-menus',
                heading = heading,
                debugPoly = false,
                minZ = minZ,
                maxZ = maxZ
            }, {
                options = {
                    {
                        event = 'serruata-menus:client:giveMenu',
                        icon = 'fas fa-utensils',
                        label = 'Grab Menu',
                    }
                },
                distance = 2.5
            })
        end
    end
end)

RegisterNetEvent('serruata-menus:client:giveMenu', function(args)
    for i = 1, #(Config.Locations) do
        local plycoords = GetEntityCoords(cache.ped)
        local coords = Config.Locations[i].coords
        local dist = #(plycoords - coords)
        if dist < 5 then
            if coords == Config.Locations[1].coords then -- Vanilla Unicorn
                if Config.Locations[i].location == 'Vanilla Unicorn' then
                    TriggerServerEvent('serrulate-menus:add:vu')
                end
            elseif coords == Config.Locations[2].coords then -- Uwu Cafe
                if Config.Locations[i].location == 'UwU Cafe' then
                    TriggerServerEvent('serrulate-menus:add:uwu')
                end
            elseif coords == Config.Locations[3].coords then -- Bean Machine
                if Config.Locations[i].location == 'Bean Machine' then
                    TriggerServerEvent('serrulate-menus:add:bean')
                end
            elseif coords == Config.Locations[4].coords then -- In&Out
                if Config.Locations[i].location == 'Burger Shot' then
                    TriggerServerEvent('serrulate-menus:add:burgershot')
                end
            end
        end
    end
end)