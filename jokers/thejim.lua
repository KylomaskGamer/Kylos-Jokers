SMODS.Joker{ --The Jim
    key = "thejim",
    config = {
        extra = {
            Xmult = 1.5,
            Xmult2 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'The Jim',
        ['text'] = {
            [1] = '{X:mult,C:white}X1.5{} Mult',
            [2] = 'Does it again when {C:attention}The Bob{} is present'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
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
            if (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_kylomask_thebob" then
                        return true
                        end
                    end
                    return false
                    end)() then
                        return {
                            Xmult = card.ability.extra.Xmult
                        }
                    else
                        return {
                            Xmult = card.ability.extra.Xmult2
                        }
                    end
                end
            end
}