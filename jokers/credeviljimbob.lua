SMODS.Joker{ --{C:red}Evil Jimbob{}
    key = "credeviljimbob",
    config = {
        extra = {
            mult = 6
        }
    },
    loc_txt = {
        ['name'] = '{C:red}Evil Jimbob{}',
        ['text'] = {
            [1] = 'All {C:attention}evaluating jokers{} give {C:red}+6{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },

    
    calculate = function(self, card, context)
        if context.other_joker  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}