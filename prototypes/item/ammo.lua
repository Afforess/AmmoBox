data:extend(
{
    {
        type = "ammo",
        name = "basic-bullet-ammo-box",
        icon = "__AmmoBox__/graphics/icons/basic-ammo-box.png",
        flags = {"goes-to-main-inventory"},
        ammo_type =
        {
            category = "bullet",
            action =
            {
                {
                    type = "direct",
                    action_delivery =
                    {
                        {
                            type = "instant",
                            source_effects =
                            {
                                {
                                    type = "create-explosion",
                                    entity_name = "explosion-gunshot"
                                }
                            },
                            target_effects =
                            {
                                {
                                    type = "create-entity",
                                    entity_name = "explosion-hit"
                                },
                                {
                                    type = "damage",
                                    damage = { amount = 2 , type = "physical"}
                                }
                            }
                        }
                    }
                }
            }
        },
        magazine_size = 1000,
        subgroup = "ammo",
        order = "a[basic-clips]-b[basic-bullet-magazine]",
        stack_size = 100
    },
    {
        type = "ammo",
        name = "piercing-bullet-ammo-box",
        icon = "__AmmoBox__/graphics/icons/piercing-ammo-box.png",
        flags = {"goes-to-main-inventory"},
        ammo_type =
        {
            category = "bullet",
            action =
            {
                type = "direct",
                action_delivery =
                {
                    type = "instant",
                    source_effects =
                    {
                        type = "create-explosion",
                        entity_name = "explosion-gunshot"
                    },
                    target_effects =
                    {
                        {
                            type = "create-entity",
                            entity_name = "explosion-hit"
                        },
                        {
                            type = "damage",
                            damage = { amount = 5 , type = "physical"}
                        }
                    }
                }
            }
        },
        magazine_size = 1000,
        subgroup = "ammo",
        order = "a[basic-clips]-c[piercing-bullet-magazine]",
        stack_size = 100
    },
    {
        type = "ammo",
        name = "flame-thrower-ammo-compressed",
        icon = "__AmmoBox__/graphics/icons/flame-thrower-ammo-compressed.png",
        flags = {"goes-to-main-inventory"},
        ammo_type =
        {
          category = "flame-thrower",
          target_type = "direction",
          action =
          {
            type = "direct",
            action_delivery =
            {
              {
                type = "flame-thrower",
                explosion = "flame-thrower-explosion",
                direction_deviation = 0.05,
                speed_deviation = 0.22,
                starting_frame_deviation = 0.10,
                projectile_starting_speed = 0.60,
                starting_distance = 0.7,
              }
            }
          }
        },
        magazine_size = 10000,
        subgroup = "ammo",
        order = "e[flame-thrower]",
        stack_size = 50
    },
}
)
