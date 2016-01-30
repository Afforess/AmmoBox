require 'util'

-- verify gun_turret 2 tech has not been overriden by another mod
-- and if it is overriden, re-add the recipe to the list of effects
local found_recipe = false
for _, effect in pairs(data.raw.technology['turrets-2'].effects) do
    if effect.recipe and effect.recipe == 'ammobox-gun-turret-2' then
        found_recipe = true
        break
    end
end
if not found_recipe then
    table.insert(data.raw.technology['turrets-2'].effects, {
        type = "unlock-recipe",
        recipe = "ammobox-gun-turret-2"
    })
end

-- copy the tech bonuses for gun-turrets to the ammoxbox gun-turret so they apply for both
for _, tech in pairs(data.raw.technology) do
    if tech.effects then
        for _, effect in pairs(tech.effects) do
            if effect.turret_id and effect.turret_id == 'gun-turret' then
                local neweff = table.deepcopy(effect)
                neweff.turret_id = 'ammobox-gun-turret-2'
                table.insert(tech.effects, neweff)
            end
        end
    end
end
