assert(SMODS.load_file("jokers.lua"))()
assert(SMODS.load_file("quality-of-life.lua"))()

SMODS.Challenge {
    key = "dev",
    loc_txt = {
        name = "Developer Mode",
    },
    jokers = {
        { id = "j_abs_trash_joker" },
        { id = "j_abs_sad_joker" },
        { id = "j_abs_unsure_joker" },
        { id = "j_abs_all_seeing_eye" },
        { id = "j_abs_heavy_joker" },
        { id = "j_abs_sociophobia" },
        { id = "j_abs_vip_card" },
        { id = "j_abs_hexagonal_dice" },
        { id = "j_abs_refactoring_joker" },
        { id = "j_abs_rule_of_thirds" },
        { id = "j_abs_prime_ryan" },
        { id = "j_abs_hoarder_joker" },
        { id = "j_abs_cryptocurrency" },
        { id = "j_abs_flying_aces" },
        { id = "j_abs_exchange" },
        { id = "j_abs_sausage" },
        { id = "j_abs_weapon_bearer" },
        { id = "j_abs_servant" },
        { id = "j_abs_erratic" },
        { id = "j_abs_spider" },
        { id = "j_abs_killerqueen" },
        { id = "j_abs_patriarchy" },
        { id = "j_abs_matriarchy" }
    }
}
