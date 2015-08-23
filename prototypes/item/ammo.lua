data:extend(
{
    {
        type = "item",
        name = "gun-turret-2-ui",
        icon = "__AmmoBox__/graphics/icons/gun-turret.png",
        flags = {"goes-to-quickbar"},
        subgroup = "defensive-structure",
        order = "b[turret]-b[gun-turret-2]",
        place_result = "gun-turret-2-ui",
        stack_size = 50
    },
    {
        type = "item",
        name = "gun-turret-2",
        icon = "__AmmoBox__/graphics/icons/gun-turret.png",
        flags = {"goes-to-quickbar"},
        subgroup = "defensive-structure",
        order = "b[turret]-b[gun-turret-2]",
        place_result = "gun-turret-2",
        enable = false,
        stack_size = 50
    },
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
}
)
