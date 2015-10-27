require "defines"
require 'libs/utils'

local logger = require 'libs/logger'
local l = logger.new_logger("main")
local rescan = 0

script.on_event(defines.events.on_built_entity, function(event)
    local player = game.players[event.player_index]

    l:log("Created Entity: "..event.created_entity.type)
    if event.created_entity.name == "gun-turret-2" then
        l:log("Placing Gun Turret mk2 Entity")

        local turret_ui = player.surface.create_entity{name = "gun-turret-2-ui", position = event.created_entity.position, force = player.force}
        addGunTurretMk2(event.created_entity, turret_ui)
    end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
    l:log("Robot Created Entity: "..event.created_entity.type)
    if event.created_entity.name == "gun-turret-2" then
        l:log("Placing Gun Turret mk2 Entity")

        local turret_ui = event.created_entity.surface.create_entity{name = "gun-turret-2-ui", position = event.created_entity.position, force = event.created_entity.force}
        addGunTurretMk2(event.created_entity, turret_ui)
    end
end)

script.on_event({defines.events.on_entity_died,defines.events.on_preplayer_mined_item,defines.events.on_robot_pre_mined}, function(event)
    onGunTurretMk2Destroyed(event.entity)
end)

script.on_event(defines.events.on_tick, function(event)
    if game.tick % 20 == 0 and global.turrets ~= nil then
        local valid_turrets = {}
        for _,turret_entry in ipairs(global.turrets) do
            if turret_entry ~= nil and turret_entry.turret ~= nil and turret_entry.turret_ui ~= nil then
                if not turret_entry.turret.valid or not turret_entry.turret_ui.valid then
                    removeGunTurretMk2(turret_entry)
                else
                    -- temp hack for serialization bugs in factorio:
                    if turret_entry.turret.health ~= nil then
                        updateInventory(turret_entry)
                        -- Allow repairing damaged turrets
                        turret_entry.turret.operable = turret_entry.turret.health < 500
                        valid_turrets[#valid_turrets + 1] = turret_entry
                    end
                end
            end
        end
        global.turrets = valid_turrets
    end

    if rescan > 0 then
        rescan = rescan - 1
        if rescan == 0 then
            scanMap()
        end
    end
end)

script.on_load(function()
    -- 1s delay to let game load up
    rescan = 60
end)

function scanMap()
    l:log("Scanning map for any untracked turret entities")
    global.turrets = {}
    local turrets = findEntitiesInGeneratedChunks({"gun-turret-2"})
    local turretUIs = findEntitiesInGeneratedChunks({"gun-turret-2-ui"})
    for i = 1, #turrets do
        local turretUI = findNearestEntity(turretUIs, turrets[i].position, 0.25, l)
        if turretUI ~= nil then
            addGunTurretMk2(turrets[i], turretUI)
            l:log("Adding turret and turret ui at position: " .. l:toString(turrets[i].position))
        else
            l:log("No turret ui found for turret at " .. l:toString(turrets[i].position))
        end
    end

    rescan = 0
end

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
