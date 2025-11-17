SMODS.Joker{ --SwSwSwSw:WcWbCcCb:--------:----cwcw:RwRw----
    key = "swswswswwcwbcccbcwcwrwrw",
    config = {
        extra = {
            chips = 20,
            mult = 2,
            chips2 = 20,
            mult2 = 2
        }
    },
    loc_txt = {
        ['name'] = 'SwSwSwSw:WcWbCcCb:--------:----cwcw:RwRw----',
        ['text'] = {
            [1] = '{C:blue}+20{} Chips and {C:red}+2{} Mult',
            [2] = 'Bonuses doubled when playing a {C:attention}Four of a Kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Four of a Kind" then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                    mult = card.ability.extra.mult
                }
            }
        else
            return {
                chips = card.ability.extra.chips2,
                extra = {
                mult = card.ability.extra.mult2
            }
        }
    end
end
end
}
