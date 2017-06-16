data:extend(
{
    {
        type = "ammo",
        name = "basic-bullet-ammo-box",
        icon = "__AmmoBox__/graphics/icons/basic-ammo-box.png",
        icon_size = 64,
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
        order = "a[basic-clips]-a[firearm-magazine]",
        stack_size = 100
    },
    {
        type = "ammo",
        name = "piercing-bullet-ammo-box",
        icon = "__AmmoBox__/graphics/icons/piercing-ammo-box.png",
        icon_size = 64,
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
        order = "a[basic-clips]-c[piercing-rounds-magazine]",
        stack_size = 100
    },
    {
        type = "ammo",
        name = "uranium-bullet-ammo-box",
        icon = "__AmmoBox__/graphics/icons/uranium-ammo-box.png",
        icon_size = 64,
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
                            damage = { amount = 24 , type = "physical"}
                        }
                    }
                }
            }
        },
        magazine_size = 1000,
        subgroup = "ammo",
        order = "a[basic-clips]-c[piercing-rounds-magazine]-d[uranium-ammo]",
        stack_size = 100
    },
    {
        type = "ammo",
        name = "flamethrower-ammo-compressed",
        icon = "__AmmoBox__/graphics/icons/flamethrower-ammo-compressed.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        ammo_type =
        {
            category = "flamethrower",
            target_type = "position",
            clamp_position = true,

            action =
            {
                type = "direct",
                action_delivery =
                {
                    type = "stream",
                    stream = "handheld-flamethrower-fire-stream",
                    max_length = 25,
                    duration = 240,
                }
            }
        },
        magazine_size = 10000,
        subgroup = "ammo",
        order = "e[flamethrower]",
        stack_size = 50
    },
}
)
