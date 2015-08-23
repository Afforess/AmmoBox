data:extend(
{
    {
        type = "technology",
        name = "ammo-box",
        icon = "__AmmoBox__/graphics/icons/basic-ammo-box.png",
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "basic-bullet-ammo-box"
            },
            {
                type = "unlock-recipe",
                recipe = "piercing-bullet-ammo-box"
            }
        },
        prerequisites = {"military-3"},
        unit =
        {
            count = 150,
            ingredients =
            {
                {"science-pack-1", 2},
                {"science-pack-2", 1}
            },
            time = 45
        },
        upgrade = true,
        order = "e-l-a"
    }
}
)
