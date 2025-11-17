SMODS.Joker{ --Fatass Jimbob
    key = "fatassjimbob",
    config = {
        extra = {
            emult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Fatass Jimbob',
        ['text'] = {
            [1] = '{C:red}-1{} Joker slots',
            [2] = '{X:enhanced,C:white}^1.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 2, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = card.ability.extra.emult
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end
}
