require "defines"
require 'libs/utils'
require 'libs/logger'

script.on_event(defines.events.on_built_entity, function(event)
    local player = game.players[event.player_index]

    if event.created_entity.name == "ammobox-gun-turret-2" then
        Logger.log("Placing Gun Turret mk2 Entity")

        local turret_ui = player.surface.create_entity{name = "ammobox-gun-turret-2-ui", position = event.created_entity.position, force = player.force}
        addGunTurretMk2(event.created_entity, turret_ui)
    end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
    if event.created_entity.name == "ammobox-gun-turret-2" then
        Logger.log("Placing Gun Turret mk2 Entity")

        local turret_ui = event.created_entity.surface.create_entity{name = "ammobox-gun-turret-2-ui", position = event.created_entity.position, force = event.created_entity.force}
        addGunTurretMk2(event.created_entity, turret_ui)
    end
end)

script.on_event({defines.events.on_entity_died,defines.events.on_preplayer_mined_item,defines.events.on_robot_pre_mined}, function(event)
    onGunTurretMk2Destroyed(event.entity)
end)

script.on_event(defines.events.on_tick, function(event)
    if event.tick % 30 == 0 and global.turrets ~= nil then
        for i = #global.turrets, 1, -1 do
            local turret_data = global.turrets[i]
            if turret_data == nil then
                table.remove(global.turrets, i)
            elseif turret_data.turret == nil or turret_data.turret_ui == nil then
                table.remove(global.turrets, i)
            elseif not turret_data.turret.valid or not turret_data.turret_ui.valid then
                table.remove(global.turrets, i)
            else
                updateInventory(turret_data)
                -- Allow repairing damaged turrets
                turret_data.turret.operable = turret_data.turret.health < 500
            end
        end
    end
end)

function addGunTurretMk2(turret_entity, turret_ui_entity)
    if global.turrets == nil then global.turrets = {} end

    turret_ui_entity.destructible = false
    turret_entity.operable = false
    -- turret is the actual gun turrent entity
    -- turret ui is the logistics container players can interact with
    global.turrets[#global.turrets + 1] = { turret = turret_entity, turret_ui = turret_ui_entity}
end

function removeGunTurretMk2(turret_entity)
    for i,turret_entry in ipairs(global.turrets) do
        if turret_entry ~= nil and (turret_entry.turret == turret_entity or turret_entry.turret_ui == turret_entity) then
            Logger.log("Found gun turret at pos "..i)
            table.remove(global.turrets, i)
            return turret_entry
        end
    end
    Logger.log("Did not find gun turret: " .. serpent.line(turret_entity))
    return nil
end

function onGunTurretMk2Destroyed(turret_entity)
    Logger.log("Gun Turret Destroyed, Entity name: " .. turret_entity.name)
    if turret_entity.name == "ammobox-gun-turret-2" or turret_entity.name == "ammobox-gun-turret-2-ui" then
        turret_entry = removeGunTurretMk2(turret_entity)

        if turret_entry ~= nil then
            if turret_entity == turret_entry.turret then
                -- move the turret inventory so it is properly added to player inventory
                if not turret_entry.turret_ui.get_inventory(1).is_empty() then
                    turret_entity.insert(turret_entry.turret_ui.get_inventory(1)[1])
                end
                turret_entry.turret_ui.destroy()
            else
                -- move the turret inventory so it is properly added to player inventory
                if not turret_entry.turret.get_inventory(1).is_empty() then
                    turret_entity.insert(turret_entry.turret.get_inventory(1)[1])
                end
                turret_entry.turret.destroy()
            end
        end
    end
end

function updateInventory(turret_entry)
    local turret_inv = turret_entry.turret.get_inventory(1)
    if turret_inv.is_empty() then
        local turret_container_inv = turret_entry.turret_ui.get_inventory(1)
        if not turret_container_inv.is_empty() then
            
            item = turret_container_inv[1]
            if item.prototype.type == "ammo" and item.count > 0 and turret_entry.turret.can_insert(item) then
                turret_entry.turret.insert({name = item.prototype.name, count = 1})
                item.count = item.count - 1
            end
        end
    end
end
