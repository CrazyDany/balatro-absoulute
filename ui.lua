SMODS.current_mod.config_tab = function()
    local ui = {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {                                                   -- 0
            { n = G.UIT.C, config = { align = "cm" }, nodes = {} }, -- 1
            {
                n = G.UIT.C,
                config = { align = "cm" },
                nodes = {                                                   -- 2
                    { n = G.UIT.R, config = { align = "cm" }, nodes = {} }, -- 3
                    { n = G.UIT.R, config = { align = "cm" }, nodes = {} }  -- 4
                }
            }
        }
    }
    return { n = G.UIT.O, config = { object = ui } }
end
