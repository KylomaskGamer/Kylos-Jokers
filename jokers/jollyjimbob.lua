SMODS.Joker{ --Jolly Jimbob
    key = "jollyjimbob",
    config = {
        extra = {
            mult = 16
        }
    },
    loc_txt = {
        ['name'] = 'Jolly Jimbob',
        ['text'] = {
            [1] = 'All {C:attention}face cards{} give {C:red}+16{} Mult',
            [2] = '{C:inactive}(K, Q, J){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}