data:extend(
{
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
    {
        type = "recipe",
        name = "flame-thrower-ammo-compressed",
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 12,
        ingredients =
        {
          {type="item", name="steel-plate", amount=25},
          {type="fluid", name="lubricant", amount=2.5},
          {type="item", name="flame-thrower-ammo", amount=100}
        },
        result = "flame-thrower-ammo-compressed"
  }
}
)
