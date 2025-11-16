SMODS.Joker{ --Cousin of Jimbob
    key = "cousinofjimbob",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Cousin of Jimbob',
        ['text'] = {
            [1] = 'Balances {C:blue}Chips{} and {C:red}Mult{} on first hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
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
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    balance = true
                }
            end
        end
    end
}