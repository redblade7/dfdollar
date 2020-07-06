print("Digital Farm dollar mod loaded")

minetest.register_craftitem("dfdollar:one", {
    description = "1 (one) DF dollar note",
    inventory_image = "dfdollar_one.png",
    stack_max = 65535                                      -- The maximum is capped by the Minetest engine itself. Setting this higher won't increase it beyond 65535
})

minetest.register_craftitem("dfdollar:five", {
    description = "5 (five) DF dollar note",
    inventory_image = "dfdollar_five.png",
    stack_max = 65535                                      -- The maximum is capped by the Minetest engine itself. Setting this higher won't increase it beyond 65535
})

minetest.register_craftitem("dfdollar:ten", {
    description = "10 (ten) DF dollar note",
    inventory_image = "dfdollar_ten.png",
    stack_max = 65535                                      -- The maximum is capped by the Minetest engine itself. Setting this higher won't increase it beyond 65535
})

minetest.register_craftitem("dfdollar:twenty", {
    description = "20 (twenty) DF dollar note",
    inventory_image = "dfdollar_twenty.png",
    stack_max = 65535                                      -- The maximum is capped by the Minetest engine itself. Setting this higher won't increase it beyond 65535
})

minetest.register_craftitem("dfdollar:hundred", {
    description = "100 (one hundred) DF dollar note",
    inventory_image = "dfdollar_hundred.png",
    stack_max = 65535                                      -- The maximum is capped by the Minetest engine itself. Setting this higher won't increase it beyond 65535
})


if(minetest.get_modpath("homedecor_gastronomy")) ~= nil then

minetest.register_craftitem(":currency:minegeld_cent_25", {
    description = "1 (one) DF quarter (compat)",
    inventory_image = "dfdollar_quarter.png",
    stack_max = 65535,                                      -- The maximum is capped by the Minetest engine itself. Setting this higher won't increase it beyond 65535
    groups = {quartercoin=1,},
})

minetest.register_alias("dfdollar:quarter","currency:minegeld_cent_25")

end

if(minetest.get_modpath("homedecor_gastronomy")) == nil then

minetest.register_craftitem("dfdollar:quarter", {
    description = "1 (one) DF quarter",
    inventory_image = "dfdollar_quarter.png",
    stack_max = 65535,                                      -- The maximum is capped by the Minetest engine itself. Setting this higher won't increase it beyond 65535
    groups = {quartercoin=1,},
})

minetest.register_alias_force("currency:minegeld_cent_25","dfdollar:quarter") --Convert coins back to standard if mod requiring them is unloaded

end


--Recipes

----100 dollars per silver ingot

minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:one 100",
    recipe = {
        "moreores:silver_ingot",
    },
    
})

----Convert ones to fives
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:five",
    recipe = {
        "dfdollar:one", "dfdollar:one", "dfdollar:one", "dfdollar:one", "dfdollar:one",
    },
})

----Convert fives to ones

minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:one 5",
    recipe = {
        "dfdollar:five",
    },
})

----Convert fives to tens
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:ten",
    recipe = {
        "dfdollar:five", "dfdollar:five",
    },
})

----Convert fives to twenties
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:twenty",
    recipe = {
        "dfdollar:five", "dfdollar:five", "dfdollar:five", "dfdollar:five",
    },
})

----Convert tens to fives
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:five 2",
    recipe = {
        "dfdollar:ten",
    },
})

----Convert tens to twenties
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:twenty",
    recipe = {
        "dfdollar:ten", "dfdollar:ten",
    },
})

----Convert twenties to fives
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:five 16",
    recipe = {
        "dfdollar:twenty", "dfdollar:twenty", "dfdollar:twenty", "dfdollar:twenty",
    },
})

----Convert twenties to tens
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:ten 4",
    recipe = {
        "dfdollar:twenty", "dfdollar:twenty",
    },
})

----Convert twenties to hundreds
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:hundred",
    recipe = {
        "dfdollar:twenty", "dfdollar:twenty", "dfdollar:twenty", "dfdollar:twenty", "dfdollar:twenty",
    },
})

----Convert hundreds to twenties
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:twenty 5",
    recipe = {
        "dfdollar:hundred",
    },
})

----Convert ones to quarters
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:quarter 4",
    recipe = {
        "dfdollar:one",
    },
})

----Convert quarters to ones
minetest.register_craft({
    type = "shapeless",
    output = "dfdollar:one",
    recipe = {
        "group:quartercoin",  "group:quartercoin",  "group:quartercoin",  "group:quartercoin",
    },
})

----Convert hundreds back to silver ingot
minetest.register_craft({
    type = "shapeless",
    output = "moreores:silver_ingot 2",
    recipe = {
        "dfdollar:hundred", "dfdollar:hundred", 
    },
})
