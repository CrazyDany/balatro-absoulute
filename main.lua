assert(SMODS.load_file("ui.lua"))()
assert(SMODS.load_file("jokers.lua"))()

SMODS.Challenge {
    key = "dev",
    loc_txt = {
        name = "Developer Mode",
    },
    jokers = {
        { id = "j_mime" },
        { id = "j_abs_servant" },
    },
    consumeables = {
        { id = "c_deja_vu", edition = "negative" },
        { id = "c_chariot", edition = "negative" },
    }
}
