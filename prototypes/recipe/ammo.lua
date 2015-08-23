data:extend(
{
    {
        type = "recipe",
        name = "gun-turret-2",
        enabled = true,
        energy_required = 20,
        ingredients =
        {
            {"iron-gear-wheel", 5},
            {"copper-plate", 10},
            {"steel-plate", 10},
            {"gun-turret", 1}
        },
        result = "gun-turret-2"
    },
    {
        type = "recipe",
        name = "basic-bullet-ammo-box",
        enabled = false,
        energy_required = 12,
        ingredients = 
        {
            {"basic-bullet-magazine", 100},
            {"steel-plate", 10}
        },
        result = "basic-bullet-ammo-box",
        result_count = 1
    },
    {
        type = "recipe",
        name = "piercing-bullet-ammo-box",
        enabled = false,
        energy_required = 24,
        ingredients =
        {
            {"piercing-bullet-magazine", 100},
            {"steel-plate", 25}
        },
        result = "piercing-bullet-ammo-box",
        result_count = 1
    },
}
)
