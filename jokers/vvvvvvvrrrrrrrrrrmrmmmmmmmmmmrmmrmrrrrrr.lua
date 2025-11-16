SMODS.Joker { --VVVVVVVRRRRRRRRRRMRMMMMMMMMMMRMMRMRRRRRR
    key = "vvvvvvvrrrrrrrrrrmrmmmmmmmmmmrmmrmrrrrrr",
    config = {
        extra = {
            pow = 1,
            blindsskipped = 0
        }
    },
    loc_txt = {
        ['name'] = 'VVVVVVVRRRRRRRRRRMRMMMMMMMMMMRMMRMRRRRRR',
        ['text'] = {
            [1] = '{X:mult,C:white}X1{} Mult for every {C:purple}POW 2{} Blinds {C:attention}skipped{}',
            [2] = '{C:inactive,s:0.85}Don\'t know math? I\'ll help! Based on{}',
            [3] = '{C:inactive,s:0.85}uhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh{}',
            [4] = '(Currently {C:attention}#1#{} skipped, therefore {X:red,C:white}X#2#{} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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

    loc_vars = function(self, info_queue, card)
        local skips = G.GAME.skips or 0
        local pow = 1 + math.log(1 + skips, 2) -- always at least 1
        return { vars = { skips, pow } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local skips = G.GAME.skips or 0
            card.ability.extra.pow = 1 + math.log(1 + skips, 2) -- pow = Xmult, min 1
            card.ability.extra.blindsskipped = skips
            return { Xmult = card.ability.extra.pow }
        end
    end

}
