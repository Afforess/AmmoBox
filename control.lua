require "defines"

local logger = require 'libs/logger'
local l = logger.new_logger("main")

game.on_event(defines.events.on_built_entity, function(event)
    local player = game.players[event.player_index]
    
    l:log("Created Entity: "..event.created_entity.type)
    if event.created_entity.name == "gun-turret-2" then
        l:log("Placing Gun Turret mk2 Entity")
        
        local turret_ui = player.surface.create_entity{name = "gun-turret-2-ui", position = event.created_entity.position, force = player.force}
        addGunTurretMk2(event.created_entity, turret_ui)
    end
end)

game.on_event(defines.events.on_robot_built_entity, function(event)    
    l:log("Robot Created Entity: "..event.created_entity.type)
    if event.created_entity.name == "gun-turret-2" then
        l:log("Placing Gun Turret mk2 Entity")
        
        local turret_ui = event.created_entity.surface.create_entity{name = "gun-turret-2-ui", position = event.created_entity.position, force = event.created_entity.force}
        addGunTurretMk2(event.created_entity, turret_ui)
    end
end)

game.on_event({defines.events.on_entity_died,defines.events.on_preplayer_mined_item,defines.events.on_robot_pre_mined}, function(event)
    onGunTurretMk2Destroyed(event.entity)
end)

game.on_event(defines.events.on_tick, function(event)
    if game.tick % 20 == 0 and global.turrets ~= nil then
        for _,turret_entry in ipairs(global.turrets) do
            if turret_entry ~= nil then
                updateInventory(turret_entry)
            end
        end
    end
end)

game.on_load(function()
    setupGlobal()
    -- Prune list of mk2 turrets for invalid entities
    local turrets = global.turrets
    global.turrets = {}
    l:log("Pruning turret list")
    for _,turret_entry in ipairs(turrets) do
        if turret_entry ~= nil and turret_entry.turret ~= nil and turret_entry.turret_ui ~= nil then
            addGunTurretMk2(turret_entry.turret, turret_entry.turret_ui)
        end
    end
    l:log("Pruned "..(#turrets - #global.turrets).." dead mk2 gun turrets from global data")
end)

function addGunTurretMk2(turret_entity, turret_ui_entity)
    setupGlobal()
    turret_ui_entity.destructible = false
    turret_entity.operable = false
    global.turrets[#global.turrets + 1] = { turret = turret_entity, turret_ui = turret_ui_entity, loaded = false }
end

function removeGunTurretMk2(turret_entity)
    for i,turret_entry in ipairs(global.turrets) do
        if turret_entry ~= nil and (turret_entry.turret == turret_entity or turret_entry.turret_ui == turret_entity) then
            l:log("Found gun turret at pos "..i)
            table.remove(global.turrets, i)
            return turret_entry
        end
    end
    l:log("Did not find gun turret: "..l:toString(turret_entity))
    return nil
end

function onGunTurretMk2Destroyed(turret_entity)
    l:log("Entity name: "..turret_entity.name)
    if turret_entity.name == "gun-turret-2" or turret_entity.name == "gun-turret-2-ui" then
        turret_entry = removeGunTurretMk2(turret_entity)
        
        if turret_entry ~= nil then
            l:log("Turret Entry: "..l:toString(turret_entry))
            
            if turret_entity == turret_entry.turret then
                l:log("Destroying Gun Turret mk2 at "..l:toString(turret_entry.turret_ui.position))
                if not turret_entry.turret_ui.get_inventory(1).is_empty() then
                    turret_entity.insert(turret_entry.turret_ui.get_inventory(1)[1])
                end
                turret_entry.turret_ui.destroy()
            else
                l:log("Destroying Gun Turret mk2 at "..l:toString(turret_entry.turret.position))
                if not turret_entry.turret.get_inventory(1).is_empty() then
                    turret_entity.insert(turret_entry.turret.get_inventory(1)[1])
                end
                turret_entry.turret.destroy()
            end
        else
            l:log("No Turret Entry")
        end
    end
end

function updateInventory(turret_entry)
    if turret_entry.turret.get_inventory(1).is_empty() and not turret_entry.turret_ui.get_inventory(1).is_empty() then
        item = turret_entry.turret_ui.get_inventory(1)[1]
        --l:log("Turret UI has items: "..l:toString(items))
        if turret_entry.turret.can_insert(item) and item.prototype.type == "ammo" and item.count > 0 then
            turret_entry.turret.insert({name = item.prototype.name, count = 1})
            item.count = item.count - 1
            --l:log("Inserted item "..l:toString(item).."into turret")
        end
    end
end

function setupGlobal()
    if global.turrets == nil then
        global.turrets = {}
    end
end
