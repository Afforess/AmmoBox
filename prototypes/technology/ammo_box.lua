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
        order = "e-l-a"
    },
    {
        type = "technology",
        name = "flame-thrower-2",
        icon = "__base__/graphics/technology/flame-thrower.png",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "flame-thrower-ammo-compressed"
          }
        },
        prerequisites = {"flame-thrower", "military-3"},
        unit =
        {
          count = 30,
          ingredients =
          {
            {"science-pack-1", 4},
            {"science-pack-2", 3},
            {"science-pack-3", 1}
          },
          time = 35
        },
        order = "e-c-b"
     }
}
)
