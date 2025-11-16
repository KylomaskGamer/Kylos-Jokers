SMODS.Joker{ --Jimbobs 23rd Debt
    key = "jimbobs23rddebt",
    config = {
        extra = {
            currentmoney = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jimbobs 23rd Debt',
        ['text'] = {
            [1] = '{C:blue}+1{} Chip for each {C:money}$1{}',
            [2] = '(Currently {C:blue}+#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {(G.GAME.dollars or 0)}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = G.GAME.dollars
            }
        end
    end
}