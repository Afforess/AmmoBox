data:extend(
{
    {
        type = "technology",
        name = "turrets-2",
        icon = "__base__/graphics/technology/turrets.png",
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "gun-turret-2"
            }
        },
        prerequisites = {"military-3", "turrets"},
        unit =
        {
            count = 50,
            ingredients =
            {
                {"science-pack-1", 4},
                {"science-pack-2", 2},
                {"science-pack-3", 1}
            },
            time = 40
        },
        upgrade = true,
        order = "e-l-a"
    }
}
)
