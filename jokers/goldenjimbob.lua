SMODS.Joker{ --Golden Jimbob
    key = "goldenjimbob",
    config = {
        extra = {
            money5 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Golden Jimbob',
        ['text'] = {
            [1] = 'Gives {C:attention}20%{} of your {C:attention}current{} {C:money}money{}',
            [2] = '...worth of {C:money}money{}, up to {C:money}250${}',
            [3] = 'when a blind is defeated',
            [4] = '{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
        
        return {vars = {(math.floor(lenient_bignum(G.GAME.dollars / 5)) or 0)}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        if G.GAME.dollars < to_big(250) then
            return {
                dollars = math.floor(lenient_bignum(G.GAME.dollars / 5))
            }
        end
    end
end
}