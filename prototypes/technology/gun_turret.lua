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
                recipe = "ammobox-gun-turret-2"
            }
        },
        prerequisites = {"military-2", "turrets"},
        unit =
        {
            count = 50,
            ingredients =
            {
                {"science-pack-1", 1},
                {"science-pack-2", 1},
                {"military-science-pack", 1}
            },
            time = 30
        },
        upgrade = true,
        order = "e-l-a"
    }
}
)
