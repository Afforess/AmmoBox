data:extend(
{
    {
        type = "recipe",
        name = "basic-bullet-ammo-box",
        enabled = false,
        energy_required = 12,
        ingredients =
        {
            {"firearm-magazine", 100},
            {"iron-plate", 10}
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
            {"piercing-rounds-magazine", 100},
            {"steel-plate", 10}
        },
        result = "piercing-bullet-ammo-box",
        result_count = 1
    },
    {
        type = "recipe",
        name = "uranium-bullet-ammo-box",
        enabled = false,
        energy_required = 48,
        ingredients =
        {
            {"uranium-rounds-magazine", 100},
            {"steel-plate", 20}
        },
        result = "uranium-bullet-ammo-box",
        result_count = 1
    },
    {
        type = "recipe",
        name = "flamethrower-ammo-compressed",
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 12,
        ingredients =
        {
          {type="item", name="steel-plate", amount=10},
          {type="fluid", name="lubricant", amount=2.5},
          {type="item", name="flamethrower-ammo", amount=100}
        },
        result = "flamethrower-ammo-compressed"
  }
}
)
