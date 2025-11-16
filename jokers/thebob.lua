SMODS.Joker{ --The Bob
    key = "thebob",
    config = {
        extra = {
            xchips = 1.5,
            xchips2 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'The Bob',
        ['text'] = {
            [1] = '{X:chips,C:white}X1.5{} Chips',
            [2] = 'Does it again when {C:attention}The Jim{} is present'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
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
            if (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_kylomask_thejim" then
                        return true
                        end
                    end
                    return false
                    end)() then
                        return {
                            x_chips = card.ability.extra.xchips
                        }
                    else
                        return {
                            x_chips = card.ability.extra.xchips2
                        }
                    end
                end
            end
}