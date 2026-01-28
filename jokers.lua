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

    config = {
        extra = {
            Xmult = 2
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
            "{C:mult}+#1#{} Mult if",
            "played hand doesn't",
            "contain a {C:attention}Pair{}"
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
            "{C:chips}+#1#{} Chips if",
            "played hand doesn't",
            "contain a {C:attention}Pair{}"
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
            chips = 150
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
            "{C:mult}+#1#{} Mult if played",
            "hand doesn't contain a",
            "{C:attention}Straight{} and {C:attention}Flush{}"
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
            "{C:chips}+#1#{} Chips if played",
            "hand doesn't contain a",
            "{C:attention}Straight{} and {C:attention}Flush{}"
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
            if (not (next(context.poker_hands["Straight"]))) and (not (next(context.poker_hands["Flush"]))) then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}

SMODS.Joker {
    key = "refactoring_joker",
    atlas = "jokers",
    pos = { x = 9, y = 0 },
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
    key = "prime_ryan",
    atlas = "jokers",
    pos = { x = 3, y = 1 },
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
            mult = 3
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
    key = "sausage",
    atlas = "jokers",
    pos = { x = 7, y = 6 },
    loc_txt = {
        name = "Sausage",
        text = {
            "When Blind is selected gain {C:money}#1#${}",
            "Reduces by {C:money}#2#${} at the end of round"
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
            money = 12,
            decrease = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.decrease
            }
        }
    end,

    calculate = function(self, card, context)
        if context.blind then
            return {
                dollars = card.ability.extra.money
            }
        end

        if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
            card.ability.extra.money = card.ability.extra.money - card.ability.extra.decrease
            if card.ability.extra.money <= 0 then
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
                return {
                    message = "Destroyed!"
                }
            end

            return {
                message = "Decreasesed!"
            }
        end
    end
}

SMODS.Joker {
    key = "weapon_bearer",
    atlas = "jokers",
    pos = { x = 3, y = 4 },
    loc_txt = {
        name = "Weapon Bearer",
        text = {
            "+#1# {C:attention}Consumable{} slots"
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
            extra_slots = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.extra_slots
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.extra_slots
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.extra_slots
    end
}

SMODS.Joker {
    key = "sociophobia",
    atlas = "jokers",
    pos = { x = 5, y = 0 },
    loc_txt = {
        name = "Sociophobia",
        text = {
            "{X:mult,C:white}X#1#{} Mult every hand",
            "Decreases by {X:mult,C:white}X2{} Mult",
            "per played hand"
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
            X_start_mult = 8
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
                Xmult = math.max(1, (card.ability.extra.X_start_mult + 2) - (#context.full_hand + #context.full_hand))
            }
        end
    end
}

SMODS.Joker{ --VIP Card
    key = "vip_card",
    config = {
        extra = {
            destroychance = 1,
            xmult0 = 8,
            odds = 128
        }
    },
    loc_txt = {
        ['name'] = 'VIP Card',
        ['text'] = {
            [1] = '{X:red,C:white}X8{} Mult',
            [2] = '{C:green}#1# in 128{} chance this is destroyed',
            [3] = 'at the end of round.',
            [4] = 'Chance doubles at the end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.destroychance, card.ability.extra.odds, 'j_abs_vip_card') 
        return {vars = {card.ability.extra.destroychance, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 8
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            card.ability.extra.destroychance = card.ability.extra.destroychance + card.ability.extra.destroychance
            if SMODS.pseudorandom_probability(card, 'group_0_8d21e238', card.ability.extra.destroychance, card.ability.extra.odds, 'j_abs_vip_card', false) then
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
            end
        end
    end
}

SMODS.Joker {
    key = "hexagonal_dice",
    atlas = "jokers",
    pos = { x = 8, y = 0 },
    loc_txt = {
        name = "Hexagonal Dice",
        text = {
            "{C:green}#2# in #1#{} chance for each",
            "playing {C:attention}Aces{} to create",
            "a {C:spectral}Spectral{} Card when scored",
            "{C:inactive}(Must have a room){}"
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
            odds = 8
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.odds,
                G.GAME.probabilities.normal
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if (context.other_card:get_id() == 14) and (pseudorandom('hexagonal_dice') < G.GAME.probabilities.normal / card.ability.extra.odds) then
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
    key = "rule_of_thirds",
    atlas = "jokers",
    pos = { x = 0, y = 1 },
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
    key = "cryptocurrency",
    atlas = "jokers",
    pos = { x = 5, y = 1 },
    loc_txt = {
        name = "Cryptocurrency",
        text = {
            "Multiplies {C:attention}sell value{}",
            "by {C:money}#1#{} at the end of round",
            "{C:inactive}(Maximum {C:money}$#2#{C:inactive} per round)"
        }
    },

    rarity = 2,
    cost = 4,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            money_mult = 1.4,
            new_cost = 2,
            max_addational = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money_mult,
                card.ability.extra.max_addational
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local prev_cost = card.ability.extra.new_cost
            card.ability.extra.new_cost = prev_cost * card.ability.extra.money_mult
            local addational = card.ability.extra.new_cost - prev_cost

            if addational > card.ability.extra.max_addational then
                addational = card.ability.extra.max_addational
            end

            if addational < 1 then
                addational = 1
            end

            addational = math.floor(addational)

            card.ability.extra_value = card.ability.extra_value + addational
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}

SMODS.Joker {
    key = "flying_aces",
    atlas = "jokers",
    pos = { x = 4, y = 1 },
    loc_txt = {
        name = "Flying Aces",
        text = {
            "Gains {X:mult,C:white}X#2#{} Mult if",
            "all played cards are {C:attention}Aces{}",
            "Else divides gained Mult by {C:attention}#3#{}",
            "{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive} Mult)"
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
            Xmult = 1,
            gains_Xmult = 1,
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
                if not (context.full_hand[i]:get_id() == 14) then
                    card.ability.extra.Xmult = math.max(1, card.ability.extra.Xmult / card.ability.extra.XMult_divisor)
                    return {
                        message = "Decrease"
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
    key = "exchange",
    atlas = "jokers",
    pos = { x = 6, y = 1 },
    loc_txt = {
        name = "Exchange Machine",
        text = {
            "When {C:attention}Blind is selected{},",
            "Sets Hands to {C:blue}#3#{} and",
            "gives {C:money}$#2#{} and {C:red}+#1#{} Discard",
            "for each decreased hand"
        }
    },

    rarity = 2,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            discards_per = 1,
            money_per = 3,
            hands = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.discards_per,
                card.ability.extra.money_per,
                card.ability.extra.hands
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            local total_dollars = 0
            local total_discards = 0

            for i = 1, (G.GAME.current_round.hands_left - card.ability.extra.hands) do
                total_dollars = total_dollars + card.ability.extra.money_per
                total_discards = total_discards + card.ability.extra.discards_per
            end

            return {
                dollars = total_dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            ease_discard(total_discards, nil, true)
                            ease_hands_played(-G.GAME.current_round.hands_left + card.ability.extra.hands)
                            return true
                        end
                    }))
                end
            }
        end
    end
}

SMODS.Joker {
    key = "servant",
    atlas = "jokers",
    pos = { x = 8, y = 1 },
    loc_txt = {
        name = "Servant",
        text = {
            "Each #1# {C:attention}Jacks{} held in hand",
            "gives {X:mult,C:white}X#2#{} Mult and {C:money}$#3#{}",
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
            divider = 2,
            xmult = 2,
            dollars = 7
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.divider,
                card.ability.extra.xmult,
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 11 then
            local need_to_ability = false
            local jack_count = 0
            for _, pcard in ipairs(G.hand.cards) do
                if pcard:get_id() == 11 then
                    jack_count = jack_count + 1
                    if pcard == context.other_card then
                        if jack_count % card.ability.extra.divider == 0 then
                            need_to_ability = true
                        end
                        break
                    end
                end
            end

            if need_to_ability then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    return {
                        x_mult = card.ability.extra.xmult,
                        dollars = card.ability.extra.dollars
                    }
                end
            end
        end
    end,
}

SMODS.Joker{ --Erratic Joker
    key = "erratic",
    config = {
        extra = {
            destroychance = 1
        }
    },
    loc_txt = {
        ['name'] = 'Erratic Joker',
        ['text'] = {
            [1] = 'Recreates each played card',
            [2] = 'with randomized rank and suit'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = true,
    atlas = 'jokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.destroychance}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card.seal ~= nil then
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        return true
                    end
                }))
            elseif (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        scored_card:set_ability(random_enhancement)
                        return true
                    end
                }))
            elseif context.other_card.edition ~= nil then
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                        if random_edition then
                            scored_card:set_edition(random_edition, true)
                        end
                        return true
                    end
                }))
            elseif (context.other_card.seal ~= nil and context.other_card.edition ~= nil) then
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                        if random_edition then
                            scored_card:set_edition(random_edition, true)
                        end
                        return true
                    end
                }))
            elseif ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and context.other_card.edition ~= nil) then
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        scored_card:set_ability(random_enhancement)
                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                        if random_edition then
                            scored_card:set_edition(random_edition, true)
                        end
                        return true
                    end
                }))
            elseif (context.other_card.edition ~= nil and context.other_card.seal ~= nil) then
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                        if random_edition then
                            scored_card:set_edition(random_edition, true)
                        end
                        return true
                    end
                }))
            elseif (context.other_card.seal ~= nil and (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()) then
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        scored_card:set_ability(random_enhancement)
                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        return true
                    end
                }))
            elseif (context.other_card.seal ~= nil and (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and context.other_card.seal ~= nil) then
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        scored_card:set_ability(random_enhancement)
                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                        if random_edition then
                            scored_card:set_edition(random_edition, true)
                        end
                        return true
                    end
                }))
            else
                local scored_card = context.other_card
                card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                        return true
                    end
                }))
            end
        end
    end
}

SMODS.Joker{ --Patriarchy
    key = "patriarchy",
    config = {
        extra = {
            odds = 2,
            dollars0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Patriarchy',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance to give {C:gold}$10{}',
            [2] = 'for each {C:attention}King{} used',
            [3] = 'in scoring'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = false,
    discovered = true,
    atlas = 'jokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_abs_patriarchy') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:get_id() == 13 then
                if SMODS.pseudorandom_probability(card, 'group_0_1bd0b502', 1, card.ability.extra.odds, 'j_abs_patriarchy', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 10
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }
    
SMODS.Joker{ --Matriarchy
    key = "matriarchy",
    config = {
        extra = {
            odds = 2,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Matriarchy',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance to retrigger',
            [2] = 'each {C:attention}Queen{} used in scoring',
            [3] = '{C:attention}1{} additional time'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = false,
    discovered = true,
    atlas = 'jokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_abs_matriarchy') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                if SMODS.pseudorandom_probability(card, 'group_0_d9bb1477', 1, card.ability.extra.odds, 'j_abs_matriarchy', false) then
                    
                    return {repetitions = 1}
                end
            end
        end
    end
}

SMODS.Joker{ --Poacher
    key = "poacher",
    config = {
        extra = {
            curmult = 1,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Poacher',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X0.5{} if all played',
            [2] = 'cards are {C:attention}Wild{} cards',
            [3] = '{C:green}1 in 4{} chance to destroy',
            [4] = 'each played {C:attention}Wild{} card',
            [5] = '{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_poacher') 
        return {vars = {card.ability.extra.curmult, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_fa34a52e', 1, card.ability.extra.odds, 'j_modprefix_poacher', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.curmult = (card.ability.extra.curmult) + 0.5
            return {
                Xmult = card.ability.extra.curmult
            }
        end
    end
}

SMODS.Joker{ --Sock
    key = "sock",
    config = {
        extra = {
            curmult = 1,
            discused = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sock',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X1{} Mult if only one',
            [2] = 'card is scored and discards',
            [3] = 'are not used this round',
            [4] = '{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.curmult, card.ability.extra.discused}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (#context.scoring_hand == 1 and (card.ability.extra.discused or 0) == 0) then
                card.ability.extra.curmult = (card.ability.extra.curmult) + 1
                return {
                    extra = {
                        Xmult = card.ability.extra.curmult
                    }
                }
            end
        end
        if context.pre_discard  then
            return {
                func = function()
                    card.ability.extra.discused = 1
                    return true
                end
            }
        end
    end
}

SMODS.Joker {
    key = "hoarder",
    atlas = "jokers",
    pos = { x = 1, y = 1 },
    loc_txt = {
        name = "Hoarder",
        text = {
            "{X:mult,C:white}X#1#{} Mult for each",
            "{C:attention}Consumable{} card in",
            "your slots",
            "{S:1.1,C:red,E:2}Destroys when {C:attention}Consumable{}",
            "{S:1.1,C:red,E:2}card is used{}"
        }
    },

    rarity = 3,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            mult_per = 1.75
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
                Xmult = math.max(1, counter * card.ability.extra.mult_per)
            }
        end
    end
}

SMODS.Joker {
    key = "mrna",
    atlas = "jokers",
    pos = { x = 6, y = 0 },
    loc_txt = {
        name = "MRNA",
        text = {
            "If first hand of round has only 1 card,",
            "gains base Chips and card Chips value",
            "{C:inactive}(Currently {C:blue}+#1#{C:inactive} Chips)"
        }
    },

    rarity = 3,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    unlocked = true,
    discovered = true,

    config = {
        extra = {
            chips = 0
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
        if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1

            local add_chips = context.full_hand[1].ability.perma_bonus
            local rank = context.full_hand[1]:get_id()

            if rank == 14 then
                add_chips = add_chips + 11
            else
                if rank >= 11 then
                    add_chips = add_chips + 10
                else
                    add_chips = add_chips + rank
                end
            end

            print(context.poker_hands["High Card"])
            card.ability.extra.chips = card.ability.extra.chips + add_chips + context.full_hand[1].ability.bonus or
                0 + context.full_hand[1].ability.perma_bonus or 0
            return {
                message = {
                    "Upgrade!"
                },
                colour = G.C.CHIPS
            }
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end

}

SMODS.Joker{ --Spider
    key = "spider",
    config = {
        extra = {
            cardcount = 0,
            handchanged = 0,
            hand_size0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Spider',
        ['text'] = {
            [1] = '{C:attention}+1{} hand size for each 8 cards',
            [2] = 'added to your full deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cardcount, card.ability.extra.handchanged}}
    end,
    
    calculate = function(self, card, context)
        if context.playing_card_added  then
            if card.ability.extra.cardcount >= 7 then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(1)
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.cardcount = 0
                            return true
                        end,
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
                                card.ability.extra.handchanged = (card.ability.extra.handchanged) + 1
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                }
            else
                return {
                    func = function()
                        card.ability.extra.cardcount = (card.ability.extra.cardcount) + 1
                        return true
                    end
                }
            end
        end
        if context.selling_self  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.handchanged).." Hand Limit", colour = G.C.BLUE})
                    
                    G.hand:change_size(-card.ability.extra.handchanged)
                    return true
                end
            }
        end
    end
}
SMODS.Joker{ --Killer Queen
    key = "killerqueen",
    config = {
        extra = {
            curmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Killer Queen',
        ['text'] = {
            [1] = 'Destroys each played {C:attention}Jack{}',
            [2] = 'and gains {X:red,C:white}X0.5{} Mult',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.curmult}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 11 then
                context.other_card.should_destroy = true
                card.ability.extra.curmult = (card.ability.extra.curmult) + 0.5
                return {
                    message = "Off with his head!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.curmult
            }
        end
    end
}