SMODS.Joker{ --Jimbob
    key = "jimbob",
    config = {
        extra = {
            mult = 8
        }
    },
    loc_txt = {
        ['name'] = 'Jimbob',
        ['text'] = {
            [1] = 'All {C:attention}non-face cards{} give {C:red}+8{} Mult',
            [2] = '{C:inactive}(A, 10, 9, 8, 7, 6, 5, 4, 3, 2){}'
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
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kylomask_mycustom_jokers"] = true, ["kylomask_jimbob"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (context.other_card:is_face()) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}