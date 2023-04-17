---@diagnostic disable: lowercase-global
-- # Make VSC shut up about globals

add_projectile = add_projectile                                     ---@type function
c = c                                                               ---@type table
ACTION_DRAW_RELOAD_TIME_INCREASE = ACTION_DRAW_RELOAD_TIME_INCREASE ---@type number 


-- # Import useful functions
dofile_once("mods/community_rebalance/files/scripts/gun/library.lua")


--[[
    # SEE CONTRIBUTING.MD (TODO!)
    Format is:

    -- English Action Name
    ["ACTION_ID"] = {
        property = value,
    },

]]

local actions_to_edit = {

    -- Chainsaw
    ["CHAINSAW"] = {
        description = "Hello there",
        mana = 5,
        action = function ( recursion_level, iteration )
            if mana >= c.fire_rate_wait then
                mana = math.max((mana - c.fire_rate_wait), 0)
                add_projectile("data/entities/projectiles/deck/chainsaw.xml")
                -- Tweak: mana reduction proportional to cast delay reduced, need feedback on scaling
                c.fire_rate_wait = 0
                c.spread_degrees = c.spread_degrees + 6.0
                current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the digger reload time back to 0
            else
                ShakeManaBar()
            end
        end
    },

}

return actions_to_edit