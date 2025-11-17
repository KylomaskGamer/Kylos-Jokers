SMODS.Joker { --Jimbobs 748th Debt
    key = "jimbobs748thdebt",
    config = {
        extra = {
            xmult = 0,
            currentmoney = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jimbobs 748th Debt',
        ['text'] = {
            [1] = '{X:red,C:white}X1{} Mult for every {C:purple}POW 10{} {C:money}Money{} you have',
            [2] = '{C:inactive,s:0.8}Don\'t know math? I\'ll help! Based on the amount of',
            [3] = 'digits (kinda,) the power of this joker goes up!{}',
            [4] = '{C:inactive}(Currently {C:money}$#2#{}, {C:inactive}therefore{} {}{X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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

    loc_vars = function(self, info_queue, card)
        local money = G.GAME.dollars or 0
        local xmult = 1 + math.log(math.max(1,money), 10) -- log base 10, min 1
        return { vars = { xmult, money  } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local money = G.GAME.dollars or 0
            card.ability.extra.currentmoney = money
            card.ability.extra.xmult = 1 + math.log(math.max(1,money), 10) -- Xmult = pow, log₁₀
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end

}
