SMODS.Atlas {
    key = "jokers",
    px = 71,
    py = 95,
    path = "Jokers.png",
}

SMODS.Joker {
    key = "trash_joker",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = "Trash Joker",
        text = {
            "{X:mult,C:white}X#1#{} Mult"
        }
    },

    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,
    discovered = true,
    discovered = true,

    config = {
        extra = {
            Xmult = 1.5
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {

                Xmult = card.ability.extra.Xmult
            }
        end
    end
}

SMODS.Joker {
    key = "sad_joker",
    atlas = "jokers",
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = "Sad Joker",
        text = {
            "{C:mult}+#1#{} Mult",
            "if played hand",
            "doesn't contain a {C:attention}Pair{}"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            mult = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if not (next(context.poker_hands["Pair"])) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Joker {
    key = "unsure_joker",
    atlas = "jokers",
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = "Unsure Joker",
        text = {
            "{C:chips}+#1#{} Chips",
            "if played hand",
            "doesn't contain a {C:attention}Pair{}"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            chips = 100
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if not (next(context.poker_hands["Pair"])) then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}

SMODS.Joker {
    key = "all_seeing_eye",
    atlas = "jokers",
    pos = { x = 3, y = 0 },
    loc_txt = {
        name = "All Seeing Eye",
        text = {
            "{C:mult}+#1#{} Mult",
            "if played hand",
            "doesn't contain a {C:attention}Straight{} and",
            "doesn't contain a {C:attention}Flush{}"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            mult = 8
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if (not (next(context.poker_hands["Straight"]))) and (not (next(context.poker_hands["Flush"]))) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Joker {
    key = "heavy_joker",
    atlas = "jokers",
    pos = { x = 4, y = 0 },
    loc_txt = {
        name = "Heavy Joker",
        text = {
            "{C:chips}+#1#{} Chips",
            "if played hand",
            "doesn't contain a {C:attention}Straight{} and",
            "doesn't contain a {C:attention}Flush{}"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            chips = 70
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if (not (next(context.poker_hands["Straight"]))) and (not (next(context.poker_hands["Flush"]))) then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}

SMODS.Joker {
    key = "sociophobic_joker",
    atlas = "jokers",
    pos = { x = 5, y = 0 },
    loc_txt = {
        name = "Sociophobic Joker",
        text = {
            "{X:mult,C:white}X#1#{} Mult every Hand",
            "loses {X:mult,C:white}X1{} Mult per playend hand"
        }
    },

    rarity = 2,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            X_start_mult = 6
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.X_start_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.X_start_mult - #context.full_hand
            }
        end
    end
}

SMODS.Joker {
    key = "vip_card",
    atlas = "jokers",
    pos = { x = 7, y = 0 },
    loc_txt = {
        name = "VIP Card",
        text = {
            "{X:mult,C:white}X#1#{} Mult",
            "Destroys at end of round"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            Xmult = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end

        if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true;
                        end
                    }))
                    return true
                end
            }))

            G.GAME.pool_flags.gros_michel_extinct2 = true
            return {
                message = 'Destroyed!'
            }
        end
    end
}

SMODS.Joker {
    key = "hexagonal_dice",
    atlas = "jokers",
    pos = { x = 0, y = 5 },
    loc_txt = {
        name = "Hexagonal Dice",
        text = {
            "{C:green}#2# in #1#{} chance for each",
            "playing {C:attention}Aces{} to create",
            "a {C:spectral}Spectral{} Card when scored",
            "{C:inactive}(Must have a room){}"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            odds = 13
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.odds,
                G.GAME.probabilities.normal * 2
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if (context.other_card:get_id() == 14) and (pseudorandom('hexagonal_dice') < G.GAME.probabilities.normal * 2 / card.ability.extra.odds) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    extra = {
                        message = "+Spectral!",
                        message_card = card,
                        func = function() -- This is for timing purposes, everything here runs after the message
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'Spectral',
                                        key_append = 'vremade_hexagonal_dice' -- Optional, useful for checking the source of the creation in `in_pool`.
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end
                    },
                }
            end
        end
    end
}

SMODS.Joker {
    key = "refactoring_joker",
    atlas = "jokers",
    pos = { x = 6, y = 2 },
    loc_txt = {
        name = "Refactoring Joker",
        text = {
            "{C:chips}+#1#{} Chips",
            "{X:mult,C:white,E:1}Xsyntax_error{} Mult"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            minChips = 0,
            maxChips = 60,
            minXMult = 10,
            maxXMult = 15,
            XMult_divisor = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                { main_chips_start = {} },
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = pseudorandom('refactoring_joker', card.ability.extra.minChips,
                    card.ability.extra.maxChips),
                Xmult = pseudorandom('refactoring_joker', card.ability.extra.minXMult,
                    card.ability.extra.maxXMult) / card.ability.extra.XMult_divisor
            }
        end
    end
}

SMODS.Joker {
    key = "rule_of_thirds",
    atlas = "jokers",
    pos = { x = 0, y = 2 },
    loc_txt = {
        name = "Rule Of Thirds",
        text = {
            "Each played {C:attention}3{}, {C:attention}4{} or {C:attention}9{}",
            "gives {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
            "when scored"
        }
    },

    rarity = 2,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            chips = 18,
            mult = 6
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            (context.other_card:get_id() == 3
                or context.other_card:get_id() == 4
                or context.other_card:get_id() == 9) then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker {
    key = "prime_ryan",
    atlas = "jokers",
    pos = { x = 8, y = 3 },
    loc_txt = {
        name = "Prime Ryan",
        text = {
            "Played cards with",
            "{C:attention}prime{} rank give",
            "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
            "{C:inactive}(2, 3, 5, 7, Ace){}"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            chips = 23,
            mult = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            (context.other_card:get_id() == 2
                or context.other_card:get_id() == 3
                or context.other_card:get_id() == 5
                or context.other_card:get_id() == 7
                or context.other_card:get_id() == 14) then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker {
    key = "hoarder_joker",
    atlas = "jokers",
    pos = { x = 7, y = 5 },
    loc_txt = {
        name = "Hoarder Joker",
        text = {
            "{C:mult}+#1#{} Mult for each",
            "Consumable card in your slots",
            "Destroys when Consumable is used"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            mult_per = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_per
            }
        }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true;
                        end
                    }))
                    return true
                end
            }))

            G.GAME.pool_flags.gros_michel_extinct2 = true
            return {
                message = 'Destroyed!'
            }
        end

        if context.joker_main then
            local counter = 0
            for index, value in ipairs(G.consumeables.cards) do
                counter = counter + 1
            end
            return {
                mult = counter * card.ability.extra.mult_per
            }
        end
    end
}

SMODS.Joker {
    key = "cryptocurrency",
    atlas = "jokers",
    pos = { x = 5, y = 3 },
    loc_txt = {
        name = "Cryptocurrency",
        text = {
            "Multiplies {C:attention}sell value{}",
            "by {C:money}#1#${} at end of round"
        }
    },

    rarity = 1,
    cost = 8,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            money_mult = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra_value = card.ability.extra_value * card.ability.extra.money_mult
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}

SMODS.Joker {
    key = "survivor",
    atlas = "jokers",
    pos = { x = 3, y = 4 },
    loc_txt = {
        name = "Survivor",
        text = {
            "Gains {X:mult,C:white}X#2#{} Mults if",
            "all played cards is {C:attention}Aces{}",
            "Else divides gained Mults by {C:attention}#3#{}",
            "{C:inactive}(Currently: X#1#){}"
        }
    },

    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            Xmult = 1,
            gains_Xmult = 0.5,
            XMult_divisor = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.gains_Xmult,
                card.ability.extra.XMult_divisor
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval then
            for i in pairs(context.full_hand) do
                print(context.full_hand[i]:get_id())
                if not (context.full_hand[i]:get_id() == 14) then
                    print("false")
                    card.ability.extra.Xmult = card.ability.extra.Xmult / card.ability.extra.XMult_divisor
                    return {
                        message = "Sad!"
                    }
                end
            end

            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.gains_Xmult
            return {
                message = "Upgrade!"
            }
        end

        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end

}

SMODS.Joker {
    key = "robbler",
    atlas = "jokers",
    pos = { x = 0, y = 4 },
    loc_txt = {
        name = "Robbler",
        text = {
            "When Blind is selected",
            "gain {C:red}+3{} Discards and {C:money}$4{}",
            "Sets Hands to {C:blue}1{}"
        }
    },

    rarity = 1,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            discards = 3,
            money = 4,
            hands = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.discards,
                card.ability.extra.money,
                card.ability.extra.hands
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            return {
                dollars = card.ability.extra.money,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            ease_discard(card.ability.extra.discards, nil, true)
                            ease_hands_played(-G.GAME.current_round.hands_left + card.ability.extra.hands)
                            return true
                        end
                    }))
                end
            }
        end
    end
}

-- SMODS.Atlas {
--     key = "jokers_stickers",
--     px = 71,
--     py = 95,
--     path = "JokersStickers.png",
-- }

-- -- Joker Stickers
-- SMODS.Sticker {
--     key = "deadly_sticker",
--     atlas = "jokers_stickers",
--     pos = { x = 0, y = 0 },

--     calculate = function(self, card, context)
--         if context.joker_main then
--             return {
--                 mult = -100
--             }
--         end
--     end
-- }

SMODS.Challenge {
    key = "dev",
    loc_txt = {
        name = "Dev Challenge"
    },
    jokers = {
        -- { id = "j_abs_trash_joker" },
        -- { id = "j_abs_sad_joker" },
        -- { id = "j_abs_unsure_joker" },
        -- { id = "j_abs_all_seeing_eye" },
        -- { id = "j_abs_heavy_joker" },
        { id = "j_abs_survivor" },
    },
}
